/obj/item/weapon/gun/energy/laser
	name = "G40E carbine"
	desc = "A Hephaestus Industries G40E carbine, designed to kill with concentrated energy blasts."
	icon = 'icons/obj/guns/laser_carbine.dmi'
	icon_state = "laser"
	item_state = "laser"
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	force = 10
	one_hand_penalty = 2
	bulk = GUN_BULK_RIFLE
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_STEEL = 2000)
	projectile_type = /obj/item/projectile/beam/midlaser
	wielded_item_state = "laser-wielded"
	base_parry_chance = 20
	self_recharge = 1
	fire_sound = 'sound/weapons/gunshot/acidlaserheavy.ogg'

/obj/item/weapon/gun/energy/laser/mounted
	self_recharge = 1
	use_external_power = 1
	one_hand_penalty = 0 //just in case
	has_safety = FALSE

/obj/item/weapon/gun/energy/laser/practice
	name = "practice laser carbine"
	desc = "A modified version of the HI G40E, this one fires less concentrated energy bolts designed for target practice."
	icon_state = "laserp"
	projectile_type = /obj/item/projectile/beam/practice
	charge_cost = 10 //How much energy is needed to fire.
	self_recharge = 1
	fire_sound = 'sound/weapons/gunshot/acidlaserheavy.ogg'

/obj/item/weapon/gun/energy/laser/practice/proc/hacked()
	return projectile_type != /obj/item/projectile/beam/practice

/obj/item/weapon/gun/energy/laser/practice/emag_act(var/remaining_charges, var/mob/user, var/emag_source)
	if(hacked())
		return NO_EMAG_ACT
	to_chat(user, "<span class='warning'>You disable the safeties on [src] and crank the output to the lethal levels.</span>")
	desc += " Its safeties are disabled and output is set to dangerous levels."
	projectile_type = /obj/item/projectile/beam/midlaser
	charge_cost = 20
	max_shots = rand(3,6) //will melt down after those
	return 1

/obj/item/weapon/gun/energy/laser/practice/handle_post_fire(mob/user, atom/target, var/pointblank=0, var/reflex=0)
	..()
	if(hacked())
		max_shots--
		if(!max_shots) //uh hoh gig is up
			to_chat(user, "<span class='danger'>\The [src] sizzles in your hands, acrid smoke rising from the firing end!</span>")
			desc += " The optical pathway is melted and useless."
			projectile_type = null

/obj/item/weapon/gun/energy/laser/broken
	name = "broken laser carbine"
	desc = "An HI G40E, though this one appears to have a cracked projection lens."
	icon_state = "lasersec"
	projectile_type = /obj/item/projectile/beam/incendiary_laser
	base_parry_chance = 20

obj/item/weapon/gun/energy/retro
	name = "retro laser"
	icon = 'icons/obj/guns/retro_laser.dmi'
	icon_state = "retro"
	item_state = "retro"
	desc = "An older model of the basic lasergun. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	fire_delay = 8 //old technology, and a pistol
	base_parry_chance = 10
	fire_sound = 'sound/weapons/gunshot/bstonepistol.ogg'

/obj/item/weapon/gun/energy/captain
	name = "antique laser gun"
	icon = 'icons/obj/guns/caplaser.dmi'
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "A rare weapon, handcrafted by a now defunct specialty manufacturer on Luna for a small fortune. It's certainly aged well."
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	force = 5
	w_class = ITEM_SIZE_NORMAL
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	max_shots = 15 //to compensate a bit for self-recharging
	one_hand_penalty = 1 //a little bulky
	self_recharge = 1
	base_parry_chance = 10
	fire_sound = 'sound/weapons/gunshot/bstonepistol.ogg'

/obj/item/weapon/gun/energy/lasercannon
	name = "G40 cannon"
	desc = "With the laser cannon, the lasing medium is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core. This incredible technology may help YOU achieve high excitation rates with small laser volumes!"
	icon_state = "lasercannon"
	icon = 'icons/obj/guns/laser_cannon.dmi'
	item_state = null
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	slot_flags = SLOT_BACK
	one_hand_penalty = 6 //large and heavy
	w_class = ITEM_SIZE_HUGE
	projectile_type = /obj/item/projectile/beam/heavylaser
	charge_cost = 40
	max_shots = 6
	accuracy = 2
	fire_delay = 20
	wielded_item_state = "gun_wielded"
	base_parry_chance = 10

/obj/item/weapon/gun/energy/lasercannon/mounted
	name = "mounted laser cannon"
	self_recharge = 1
	use_external_power = 1
	recharge_time = 10
	accuracy = 0 //mounted laser cannons don't need any help, thanks
	one_hand_penalty = 0
	has_safety = FALSE

/obj/item/weapon/gun/energy/xray
	name = "XR2 carbine"
	desc = "A high-power laser rifle capable of emitting concentrated x-ray blasts, that are able to penetrate laser-resistant armor much more readily than standard photonic beams."
	icon = 'icons/obj/guns/xray.dmi'
	icon_state = "xray"
	item_state = "xray"
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ESOTERIC = 2)
	projectile_type = /obj/item/projectile/beam/xray/midlaser
	one_hand_penalty = 2
	w_class = ITEM_SIZE_HUGE
	charge_cost = 15
	max_shots = 10
	wielded_item_state = "gun_wielded"
	combustion = 0
	base_parry_chance = 20
	self_recharge = 1

/obj/item/weapon/gun/energy/xray/pistol
	name = "XR1 pistol"
	desc = "A high-power laser pistol capable of emitting concentrated x-ray blasts, that are able to penetrate laser-resistant armor much more readily than standard photonic beams."
	icon = 'icons/obj/guns/xray_pistol.dmi'
	icon_state = "oldxray"
	item_state = "oldxray"
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ESOTERIC = 2)
	projectile_type = /obj/item/projectile/beam/xray
	one_hand_penalty = 1
	w_class = ITEM_SIZE_NORMAL
	fire_delay = 10
	base_parry_chance = 10
	fire_sound = 'sound/weapons/gunshot/bstonepistol.ogg'

/obj/item/weapon/gun/energy/sniperrifle
	name = "HI DMR 9E Marauder"
	desc = "The HI DMR 9E is an older design of Hephaestus Industries. A designated marksman rifle capable of shooting powerful ionized beams, this is a weapon to kill from a distance."
	icon = 'icons/obj/guns/laser_sniper.dmi'
	icon_state = "sniper"
	item_state = "laser"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/sniper
	one_hand_penalty = 5 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.
	slot_flags = SLOT_BACK
	charge_cost = 40
	max_shots = 4
	fire_delay = 35
	force = 10
	w_class = ITEM_SIZE_HUGE
	accuracy = -2 //shooting at the hip
	scoped_accuracy = 8
	scope_zoom = 1
	wielded_item_state = "gun_wielded"
	base_parry_chance = 10
	self_recharge = 1

/obj/item/weapon/gun/energy/sniperrifle/armcannonenergysniper
	name = "Internal Energy-based Sniper Cannon"
	desc = "A prototype internal energy cannon, mounted within a mechanical arm."
	icon = 'icons/obj/guns/armcannon.dmi'
	icon_state = "armcannonenergysniper"
	item_state = "armcannon"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/pulse/destroy
	one_hand_penalty = 0
	slot_flags = null
	charge_cost = 40
	max_shots = 5
	fire_delay = 20
	force = 10
	w_class = ITEM_SIZE_HUGE
	accuracy = 5 //shooting at the hip
	scoped_accuracy = 8
	scope_zoom = 1
	base_parry_chance = 10
	self_recharge = 1
	wielded_item_state = null
	has_safety = 0
	recharge_time = 10
	fire_sound = 'sound/weapons/gunshot/acidarmcannon3.ogg'

/obj/item/weapon/gun/energy/leelaser
	name = "N4N4 Lee-Enfield Laser Conversion"
	desc = "An android's take on a classic weapon. Fires concentrated energy blasts rather than projectiles at high accuracy. Considerably more heavy than the original."
	icon = 'icons/obj/guns/leerifles.dmi'
	icon_state = "LaserLEE"
	item_state = "LaserLEE"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 5, TECH_POWER = 4)
	projectile_type = /obj/item/projectile/beam/sniper
	one_hand_penalty = 10 // The weapon itself is heavy, and the long barrel makes it hard to hold steady with just one hand.
	slot_flags = SLOT_BACK
	charge_cost = 50
	max_shots = 5
	fire_delay = 20
	force = 10
	w_class = ITEM_SIZE_HUGE
	accuracy = 15
	wielded_item_state = "Laser LEE"
	base_parry_chance = 10
	self_recharge = 1

/obj/item/weapon/gun/energy/sniperrifle/on_update_icon()
	..()
	item_state_slots[slot_back_str] = icon_state //so that the on-back overlay uses the different charged states

////////Laser Tag////////////////////

/obj/item/weapon/gun/energy/lasertag
	name = "laser tag gun"
	icon = 'icons/obj/guns/lasertag.dmi'
	icon_state = "bluetag"
	item_state = "laser"
	desc = "Standard issue weapon of the Imperial Guard."
	origin_tech = list(TECH_COMBAT = 1, TECH_MAGNET = 2)
	self_recharge = 1
	matter = list(MATERIAL_STEEL = 2000)
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	var/required_vest

/obj/item/weapon/gun/energy/lasertag/special_check(var/mob/living/carbon/human/M)
	if(ishuman(M))
		if(!istype(M.wear_suit, required_vest))
			to_chat(M, "<span class='warning'>You need to be wearing your laser tag vest!</span>")
			return 0
	return ..()

/obj/item/weapon/gun/energy/lasertag/blue
	icon_state = "bluetag"
	item_state = "bluetag"
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	required_vest = /obj/item/clothing/suit/bluetag

/obj/item/weapon/gun/energy/lasertag/red
	icon_state = "redtag"
	item_state = "redtag"
	projectile_type = /obj/item/projectile/beam/lastertag/red
	required_vest = /obj/item/clothing/suit/redtag
