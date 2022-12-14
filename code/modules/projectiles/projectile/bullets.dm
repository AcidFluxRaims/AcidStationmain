/obj/item/projectile/bullet
	name = "bullet"
	icon_state = "bullet"
	damage = 50
	damage_type = BRUTE
	damage_flags = DAM_BULLET | DAM_SHARP
	nodamage = 0
	embed = 1
	shrapnel_chance_multiplier = 1
	arterial_bleed_chance_multiplier = 1
	var/mob_passthrough_check = 0

	muzzle_type = /obj/effect/projectile/bullet/muzzle
	miss_sounds = list('sound/weapons/guns/miss1.ogg','sound/weapons/guns/miss2.ogg','sound/weapons/guns/miss3.ogg','sound/weapons/guns/miss4.ogg')
	ricochet_sounds = list('sound/weapons/guns/ricochet1.ogg', 'sound/weapons/guns/ricochet2.ogg',
							'sound/weapons/guns/ricochet3.ogg', 'sound/weapons/guns/ricochet4.ogg')
	impact_sounds = list(BULLET_IMPACT_MEAT = SOUNDS_BULLET_MEAT, BULLET_IMPACT_METAL = SOUNDS_BULLET_METAL)

/obj/item/projectile/bullet/on_hit(var/atom/target, var/blocked = 0)
	if (..(target, blocked))
		var/mob/living/L = target
		shake_camera(L, 3, 2)

/obj/item/projectile/bullet/attack_mob(var/mob/living/target_mob, var/distance, var/miss_modifier)
	if(penetrating > 0 && damage > 20 && prob(damage))
		mob_passthrough_check = 1
	else
		mob_passthrough_check = 0
	. = ..()

	if(. == 1 && iscarbon(target_mob))
		damage *= 0.7 //squishy mobs absorb KE

/obj/item/projectile/bullet/can_embed()
	//prevent embedding if the projectile is passing through the mob
	if(mob_passthrough_check)
		return 0
	return ..()

/obj/item/projectile/bullet/check_penetrate(var/atom/A)
	if(QDELETED(A) || !A.density) return 1 //if whatever it was got destroyed when we hit it, then I guess we can just keep going

	if(ismob(A))
		if(!mob_passthrough_check)
			return 0
		return 1

	var/chance = damage
	if(has_extension(A, /datum/extension/penetration))
		var/datum/extension/penetration/P = get_extension(A, /datum/extension/penetration)
		chance = P.PenetrationProbability(chance, damage, damage_type)

	if(prob(chance))
		if(A.opacity)
			//display a message so that people on the other side aren't so confused
			A.visible_message("<span class='warning'>\The [src] pierces through \the [A]!</span>")
		return 1

	return 0

//For projectiles that actually represent clouds of projectiles
/obj/item/projectile/bullet/pellet
	name = "shrapnel" //'shrapnel' sounds more dangerous (i.e. cooler) than 'pellet'
	damage = 37.5
	//icon_state = "bullet" //TODO: would be nice to have it's own icon state
	var/pellets = 4			//number of pellets
	var/range_step = 2		//projectile will lose a fragment each time it travels this distance. Can be a non-integer.
	var/base_spread = 90	//lower means the pellets spread more across body parts. If zero then this is considered a shrapnel explosion instead of a shrapnel cone
	var/spread_step = 10	//higher means the pellets spread more across body parts with distance

/obj/item/projectile/bullet/pellet/Bumped()
	. = ..()
	bumped = 0 //can hit all mobs in a tile. pellets is decremented inside attack_mob so this should be fine.

/obj/item/projectile/bullet/pellet/proc/get_pellets(var/distance)
	var/pellet_loss = round((distance - 1)/range_step) //pellets lost due to distance
	return max(pellets - pellet_loss, 1)

/obj/item/projectile/bullet/pellet/attack_mob(var/mob/living/target_mob, var/distance, var/miss_modifier)
	if (pellets < 0) return 1

	var/total_pellets = get_pellets(distance)
	var/spread = max(base_spread - (spread_step*distance), 0)

	//shrapnel explosions miss prone mobs with a chance that increases with distance
	var/prone_chance = 0
	if(!base_spread)
		prone_chance = max(spread_step*(distance - 2), 0)

	var/hits = 0
	for (var/i in 1 to total_pellets)
		if(target_mob.lying && target_mob != original && prob(prone_chance))
			continue

		//pellet hits spread out across different zones, but 'aim at' the targeted zone with higher probability
		//whether the pellet actually hits the def_zone or a different zone should still be determined by the parent using get_zone_with_miss_chance().
		var/old_zone = def_zone
		def_zone = ran_zone(def_zone, spread)
		if (..()) hits++
		def_zone = old_zone //restore the original zone the projectile was aimed at

	pellets -= hits //each hit reduces the number of pellets left
	if (hits >= total_pellets || pellets <= 0)
		return 1
	return 0

/obj/item/projectile/bullet/pellet/get_structure_damage()
	var/distance = get_dist(loc, starting)
	return ..() * get_pellets(distance)

/obj/item/projectile/bullet/pellet/Move()
	. = ..()

	//If this is a shrapnel explosion, allow mobs that are prone to get hit, too
	if(. && !base_spread && isturf(loc))
		for(var/mob/living/M in loc)
			if(M.lying || !M.CanPass(src, loc, 0.5, 0)) //Bump if lying or if we would normally Bump.
				if(Bump(M)) //Bump will make sure we don't hit a mob multiple times
					return

/* short-casing projectiles, like the kind used in pistols or SMGs */

/obj/item/projectile/bullet/pistol
	damage = 45
	distance_falloff = 3


/obj/item/projectile/bullet/pistol/holdout
	damage = 40
	shrapnel_chance_multiplier = 1.2
	arterial_bleed_chance_multiplier = 1.2
	distance_falloff = 2

//10mm Revolver
/obj/item/projectile/bullet/pistol/xo
	fire_sound = 'sound/weapons/gunshot/revolver_2.ogg'
	damage = 45
	armor_penetration = 10
	distance_falloff = 5


/obj/item/projectile/bullet/pistol/strong
	damage = 70
	armor_penetration = 15
	distance_falloff = 4

//Ultimate Argument
/obj/item/projectile/bullet/pistol/large
	fire_sound = 'sound/weapons/gunshot/revolver_1.ogg'
	damage = 90
	shrapnel_chance_multiplier = 0.8
	arterial_bleed_chance_multiplier = 0.8
	distance_falloff = 2.5
	armor_penetration = 20

//"rubber" bullets
//Armor pen is to prevent them from being invalidated by ARMOR_BALLISTIC_MINOR, as has been the case.
/obj/item/projectile/bullet/pistol/rubber
	name = "frangible bullet"
	damage_flags = 0
	damage = 40
	agony = 40
	embed = 1
	armor_penetration = 10

/obj/item/projectile/bullet/pistol/rubber/holdout
	agony = 25
	armor_penetration = 5

/obj/item/projectile/bullet/pistol/strong/rubber
	damage = 60
	armor_penetration = 10
	agony = 60

//4mm. Tiny, very low damage, does not embed, but has very high penetration. Only to be used for the experimental SMG.
/obj/item/projectile/bullet/flechette
	damage = 20
	armor_penetration = 30
	embed = 0
	distance_falloff = 6

/* shotgun projectiles */

/obj/item/projectile/bullet/shotgun
	name = "slug"
	damage = 60
	armor_penetration = 30
	distance_falloff = 1.1

/obj/item/projectile/bullet/shotgun/beanbag		//because beanbags are not bullets
	name = "beanbag"
	damage = 10
	damage_flags = 0
	agony = 65
	armor_penetration = 10
	embed = 0
	distance_falloff = 1.1

//Skrell version of slug
/obj/item/projectile/bullet/shotgun/flechette
	name = "flechette"
	damage = 60
	armor_penetration = 80
	distance_falloff = 1

//Spreads damage across more body parts than slugs, but is more effective up close and against unarmored opponents
//High number of pellets with low velocity lends itself to more embeds
/obj/item/projectile/bullet/pellet/shotgun
	name = "buckshot"
	damage = 30
	armor_penetration = 5
	pellets = 10
	range_step = 2
	spread_step = 10
	shrapnel_chance_multiplier = 2.0

/obj/item/projectile/bullet/pellet/birdshot
	name = "rubbershot"
	damage = 2
	pellets = 10
	range_step = 2
	spread_step = 10
	agony = 8.5
	embed = 0

/obj/item/projectile/bullet/sabot
	name = "sabot"
	icon_state= "rod"
	damage = 35
	armor_penetration = 80
	shrapnel_chance_multiplier = 0.1
	arterial_bleed_chance_multiplier = 0.1
	penetrating = 1
	damage_flags = DAM_EDGE

/* "Rifle" rounds */

//Mercenary Assault Rifle
/obj/item/projectile/bullet/rifle
	damage = 40
	armor_penetration = 25
	shrapnel_chance_multiplier = 1.5
	arterial_bleed_chance_multiplier = 1.5

//Most onship assault rifles (Z8 Bulldog)
/obj/item/projectile/bullet/rifle/military
	damage = 35
	armor_penetration = 35
	shrapnel_chance_multiplier = 1
	arterial_bleed_chance_multiplier = 1

/obj/item/projectile/bullet/rifle/military/sec
	damage = 30 //higher damage
	armor_penetration = 5 //much worse pen - frangible bullets
	shrapnel_chance_multiplier = 2
	arterial_bleed_chance_multiplier = 1.5 //higher post pen

//Hornet
/obj/item/projectile/bullet/rifle/military/large
	damage = 60
	armor_penetration = 30
	distance_falloff = 0.50
	shrapnel_chance_multiplier = 1
	arterial_bleed_chance_multiplier = 1

//Anti Material Rifle
/obj/item/projectile/bullet/rifle/shell
	damage = 80
	stun = 3
	weaken = 3
	penetrating = 3
	armor_penetration = 70
	shrapnel_chance_multiplier = 1.2
	arterial_bleed_chance_multiplier = 1.2
	distance_falloff = 0.5

// Not used for anything//
/obj/item/projectile/bullet/rifle/shell/apds
	damage = 70
	penetrating = 5
	armor_penetration = 80
	shrapnel_chance_multiplier = 1.5
	arterial_bleed_chance_multiplier = 1.5
//

/* Miscellaneous */
/obj/item/projectile/bullet/rcr
	name ="incendiary shell"
	icon_state= "rod"
	damage_type = BURN
	damage = 95
	armor_penetration = 65 //not 100, because recoilless rifles don't have that high of a velocity
	damage_flags = DAM_EDGE | DAM_DISPERSED | DAM_EXPLODE

	on_hit(var/atom/target, var/blocked = 0)
		explosion(target, 1, 6, 12)
		return 1

/obj/item/ammo_casing/gyrojet
	desc = "A minirocket casing."
	caliber = CALIBER_GYROJET
	projectile_type = /obj/item/projectile/bullet/gyro
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"
/* Practice */

/obj/item/projectile/bullet/pistol/practice
	damage = 5

/obj/item/projectile/bullet/rifle/military/practice
	damage = 5

/obj/item/projectile/bullet/shotgun/practice
	name = "practice"
	damage = 5

/obj/item/projectile/bullet/pistol/cap
	name = "cap"
	invisibility = 101
	fire_sound = null
	damage_type = PAIN
	damage_flags = 0
	damage = 0
	nodamage = 1
	embed = 0

/obj/item/projectile/bullet/pistol/cap/Process()
	qdel(src)
	return PROCESS_KILL

/obj/item/projectile/bullet/rock //spess dust
	name = "micrometeor"
	icon_state = "rock"
	damage = 40
	armor_penetration = 25
	life_span = 255
	distance_falloff = 0

/obj/item/projectile/bullet/rock/New()
	icon_state = "rock[rand(1,3)]"
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	..()
