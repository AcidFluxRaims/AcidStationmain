
/obj/effect/projectile/rail_trail
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "rail_trail"
	alpha = 160

/obj/item/ammo_casing/railslug
	name = "\improper ferromagmentic slug casing"
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "railslug-casing"
	desc = "Casing for a ferromagnetic slug."
	caliber = "railslug"
	projectile_type = /obj/item/projectile/bullet/railslug/HE

/obj/item/ammo_casing/railslug/AP
	name = "\improper AP ferromagmentic slug casing"
	projectile_type = /obj/item/projectile/bullet/railslug

//Standard slug is impact-HE
//Balanced to be somewhat like a magnum round, but with less AP and an accompanying small explosion.
//Lore has two warzone variants: AP and prox HE fuse
/obj/item/projectile/bullet/railslug
	name = "hypervelocity slug"
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "bullet_railslug"
	damage = 50
	armor_penetration = 115
	shield_damage = 210
	kill_count = 125
	penetrating = 1

	tracer_type = /obj/effect/projectile/rail_trail
	tracer_delay_time = 0.75 SECONDS
	steps_between_delays = 6

/obj/item/projectile/bullet/railslug/HE
	damage = 60
	armor_penetration = 60
	shield_damage = 175
	penetrating = 0

/obj/item/projectile/bullet/railslug/HE/on_impact(var/atom/target)
	explosion(get_turf(target), -1, 1, 2, 4,guaranteed_damage = 20,guaranteed_damage_range = 1)
	..()
