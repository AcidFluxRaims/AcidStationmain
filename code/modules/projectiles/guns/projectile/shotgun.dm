/obj/item/weapon/gun/projectile/shotgun/pump
	name = "W-T Remmington 29x"
	desc = "The mass-produced W-T Remmington 29x shotgun is a favourite of police and security forces on many worlds. Useful for sweeping alleys."
	icon = 'icons/obj/guns/shotguns.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	max_shells = 6
	w_class = ITEM_SIZE_HUGE
	force = 10
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	caliber = CALIBER_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = HOLD_CASINGS
	one_hand_penalty = 8
	bulk = 6
	var/recentpump = 0 // to prevent spammage
	wielded_item_state = "shotgun-wielded"
	load_sound = 'sound/weapons/guns/interaction/shotgun_instert.ogg'
	fire_sound = 'sound/weapons/gunshot/acidshotgun.ogg'

/obj/item/weapon/gun/projectile/shotgun/on_update_icon()
	..()
	if(length(loaded))
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-empty"

/obj/item/weapon/gun/projectile/shotgun/pump/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/shotgun/pump/attack_self(mob/living/user as mob)
	if(world.time >= recentpump + 10)
		pump(user)
		recentpump = world.time

/obj/item/weapon/gun/projectile/shotgun/pump/handle_post_fire(mob/user, atom/target, var/pointblank=0, var/reflex=0)
	..()
	if(user && user.skill_check(SKILL_WEAPONS, SKILL_SPEC))
		to_chat(user, "<span class='notice'>You pump the shotgun with a reflexive motion, ejecting [chambered]!</span>")
		pump()

/obj/item/weapon/gun/projectile/shotgun/pump/proc/pump(mob/M as mob)
	playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)

	if(chambered)//We have a shell in the chamber
		chambered.dropInto(loc)//Eject casing
		if(LAZYLEN(chambered.fall_sounds))
			playsound(loc, pick(chambered.fall_sounds), 50, 1)
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	update_icon()

/obj/item/weapon/gun/projectile/shotgun/pump/combat
	name = "KS-40"
	desc = "Built for close quarters combat, the Hephaestus Industries KS-40 is widely regarded as a weapon of choice for repelling boarders."
	icon_state = "cshotgun"
	item_state = "cshotgun"
	wielded_item_state = "cshotgun-wielded"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	max_shells = 7 //match the ammo box capacity, also it can hold a round in the chamber anyways, for a total of 8.
	ammo_type = /obj/item/ammo_casing/shotgun
	one_hand_penalty = 8

/obj/item/weapon/gun/projectile/shotgun/pump/combat/on_update_icon()
	..()
	if(length(loaded) > 3)
		for(var/i = 0 to length(loaded) - 4)
			var/image/I = image(icon, "shell")
			I.pixel_x = i * 2
			overlays += I


/obj/item/weapon/gun/projectile/shotgun/pump/skrell
	name = "QX-2 shotgun"
	desc = "Modeled after VT-3, the Qerr Xira-2 or refered to in Sol as QX-2, is a pulse shotgun capable of delivering devastating blast of flechettes with minimal spread."
	icon_state = "skrell_shotgun"
	item_state = "skrell_shotgun"
	wielded_item_state = "skrell_shotgun-wielded"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	max_shells = 9
	ammo_type = /obj/item/ammo_casing/shotgun
	one_hand_penalty = 10
	base_parry_chance = 20

/obj/item/weapon/gun/projectile/shotgun/pump/skrell/on_update_icon()
	..()
	if(length(loaded) > 3)
		for(var/i = 0 to length(loaded) - 4)
			var/image/I = image(icon, "shell")
			I.pixel_x = i * 2
			overlays += I

/obj/item/weapon/gun/projectile/shotgun/pump/beanbag
	name = "KS-40b"
	desc = "Built for close quarters combat, the Hephaestus Industries KS-40 is widely regarded as a weapon of choice for repelling boarders. \
	This one appears to be modified to fire nothing but beanbags, and has an orange paintjob on the slide. Trying to fire lethals doesn't seem like a good idea."
	icon = 'icons/boh/items/shotguns.dmi'
	icon_state = "bshotgun"
	item_state = "bshotgun"
	wielded_item_state = "cshotgun-wielded"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	one_hand_penalty = 8
	var/explosion_chance = 100

/obj/item/weapon/gun/projectile/shotgun/pump/beanbag/on_update_icon()
	..()
	if(length(loaded) > 3)
		for(var/i = 0 to length(loaded) - 4)
			var/image/I = image(icon, "bshell")
			I.pixel_x = i * 2
			overlays += I

/obj/item/weapon/gun/projectile/shotgun/pump/beanbag/special_check()
	if(chambered && chambered.BB && prob(explosion_chance))
		var/damage = chambered.BB.get_structure_damage()
		if(istype(chambered.BB, /obj/item/projectile/bullet/pellet))
			var/obj/item/projectile/bullet/pellet/PP = chambered.BB
			damage = PP.damage*PP.pellets
		if(damage > 30)
			var/mob/living/carbon/C = loc
			if(istype(loc))
				C.visible_message("<span class='danger'>[src] explodes in [C]'s hands!</span>", "<span class='danger'>[src] explodes in your face!</span>")
				C.drop_from_inventory(src)
				for(var/zone in list(BP_L_HAND, BP_R_HAND, BP_HEAD))
					C.apply_damage(rand(10,20), def_zone=zone)
			else
				visible_message("<span class='danger'>[src] explodes!</span>")
			explosion(get_turf(src), -1, -1, 1)
			qdel(src)
			return FALSE
	return ..()

/obj/item/weapon/gun/projectile/shotgun/doublebarrel
	name = "double-barreled shotgun"
	desc = "A true classic."
	icon = 'icons/obj/guns/shotguns.dmi'
	icon_state = "dshotgun"
	item_state = "dshotgun"
	wielded_item_state = "dshotgun-wielded"
	//SPEEDLOADER because rapid unloading.
	//In principle someone could make a speedloader for it, so it makes sense.
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = CYCLE_CASINGS
	max_shells = 2
	w_class = ITEM_SIZE_HUGE
	force = 10
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	caliber = CALIBER_SHOTGUN
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	one_hand_penalty = 2
	wielded_item_state = "gun_wielded"
	base_parry_chance = 20
	fire_sound = 'sound/weapons/gunshot/acidheavypistol.ogg'

	burst_delay = 0
	firemodes = list(
		list(mode_name="fire one barrel at a time", burst=1),
		list(mode_name="fire both barrels at once", burst=2),
		)

/obj/item/weapon/gun/projectile/shotgun/doublebarrel/pellet
	ammo_type = /obj/item/ammo_casing/shotgun/pellet

/obj/item/weapon/gun/projectile/shotgun/doublebarrel/flare
	name = "signal shotgun"
	desc = "A double-barreled shotgun meant to fire signal flash shells."
	ammo_type = /obj/item/ammo_casing/shotgun/flash

/obj/item/weapon/gun/projectile/shotgun/doublebarrel/unload_ammo(user, allow_dump)
	..(user, allow_dump=1)

//this is largely hacky and bad :(	-Pete
/obj/item/weapon/gun/projectile/shotgun/doublebarrel/attackby(var/obj/item/A as obj, mob/user as mob)
	if(w_class > 3 && (istype(A, /obj/item/weapon/circular_saw) || istype(A, /obj/item/weapon/melee/energy) || istype(A, /obj/item/weapon/gun/energy/plasmacutter)))
		if(istype(A, /obj/item/weapon/gun/energy/plasmacutter))
			var/obj/item/weapon/gun/energy/plasmacutter/cutter = A
			if(!cutter.slice(user))
				return ..()
		to_chat(user, "<span class='notice'>You begin to shorten the barrel of \the [src].</span>")
		if(loaded.len)
			for(var/i in 1 to max_shells)
				Fire(user, user)	//will this work? //it will. we call it twice, for twice the FUN
			user.visible_message("<span class='danger'>The shotgun goes off!</span>", "<span class='danger'>The shotgun goes off in your face!</span>")
			return
		if(do_after(user, 30, src))	//SHIT IS STEALTHY EYYYYY
			user.unEquip(src)
			var/obj/item/weapon/gun/projectile/shotgun/doublebarrel/sawn/empty/buddy = new(loc)
			transfer_fingerprints_to(buddy)
			qdel(src)
			to_chat(user, "<span class='warning'>You shorten the barrel of \the [src]!</span>")
	else
		..()

/obj/item/weapon/gun/projectile/shotgun/doublebarrel/sawn
	name = "sawn-off shotgun"
	desc = "Omar's coming!"
	icon_state = "sawnshotgun"
	item_state = "sawnshotgun"
	wielded_item_state = "sawnshotgun-wielded"
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	w_class = ITEM_SIZE_NORMAL
	force = 5
	one_hand_penalty = 2
	bulk = 2
	base_parry_chance = 10

/obj/item/weapon/gun/projectile/shotgun/doublebarrel/sawn/empty
	starts_loaded = FALSE

/obj/item/weapon/gun/projectile/shotgun/skrell
	name = "QX-2 shotgun"
	desc = "Modeled after VT-3, the Qerr Xira-2 or refered to in Sol as QX-2, is a pulse shotgun capable of delivering devastating blast of flechettes with minimal spread."
	icon = 'icons/obj/guns/skrell_shotgun.dmi'
	icon_state = "skrellshotgun"
	item_state = "skrellshotgun"
	wielded_item_state = "skrellshotgun-wielded"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/shotgun/flechette
	one_hand_penalty = 10
	base_parry_chance = 20
	fire_delay = 8
	load_method = SINGLE_CASING
	handle_casings = EJECT_CASINGS
	caliber = CALIBER_SHOTGUN_BIG
	fire_sound = 'sound/weapons/gunshot/acidsniper.ogg'
