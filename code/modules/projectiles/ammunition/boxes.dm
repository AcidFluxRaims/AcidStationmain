/obj/item/ammo_magazine/speedloader
	name = "speed loader, 10mm"
	desc = "A speed loader for revolvers."
	icon_state = "spdloader"
	caliber = CALIBER_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol
	matter = list(MATERIAL_STEEL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/speedloader/xo
	name = "speed loader, custom"
	labels = list("custom")
	ammo_type = /obj/item/ammo_casing/pistol/xo

/obj/item/ammo_magazine/speedloader/rubber
	name = "speed loader, rubber"
	labels = list("rubber")
	ammo_type = /obj/item/ammo_casing/pistol/rubber

/obj/item/ammo_magazine/speedloader/magnum
	name = "speed loader, 15mm"
	icon_state = "spdloader_magnum"
	caliber = CALIBER_PISTOL_MAGNUM
	ammo_type = /obj/item/ammo_casing/pistol/magnum
	matter = list(MATERIAL_STEEL = 1440)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/speedloader/small
	name = "speed loader, 7mm"
	icon_state = "spdloader_small"
	caliber = CALIBER_PISTOL_SMALL
	ammo_type = /obj/item/ammo_casing/pistol/small
	matter = list(MATERIAL_STEEL = 1060)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/speedloader/clip
	name = "stripper clip, 7mmR rifle"
	desc = "A stripper clip for bolt action rifles."
	icon_state = "clip"
	caliber = CALIBER_RIFLE
	ammo_type = /obj/item/ammo_casing/rifle
	matter = list(MATERIAL_STEEL = 1800)
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/shotholder
	name = "shotgun slug holder"
	desc = "A convenient pouch that holds 12 gauge shells."
	icon_state = "shotholder"
	caliber = CALIBER_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_STEEL = 1440)
	max_ammo = 4
	multiple_sprites = 1
	var/marking_color

/obj/item/ammo_magazine/shotholder/on_update_icon()
	..()
	overlays.Cut()
	if(marking_color)
		var/image/I = image(icon, "shotholder-marking")
		I.color = marking_color
		overlays += I

/obj/item/ammo_magazine/shotholder/attack_hand(mob/user)
	if((user.a_intent == I_HURT) && (stored_ammo.len))
		var/obj/item/ammo_casing/C = stored_ammo[stored_ammo.len]
		stored_ammo-=C
		user.put_in_hands(C)
		user.visible_message("\The [user] removes \a [C] from [src].", "<span class='notice'>You remove \a [C] from [src].</span>")
		update_icon()
	else
		..()

/obj/item/ammo_magazine/shotholder/shell
	name = "shotgun shell holder"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	marking_color = COLOR_RED_GRAY

/obj/item/ammo_magazine/shotholder/beanbag
	name = "beanbag shell holder"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	matter = list(MATERIAL_STEEL = 1000)
	marking_color = COLOR_PAKISTAN_GREEN

/obj/item/ammo_magazine/shotholder/flash
	name = "illumination shell holder"
	ammo_type = /obj/item/ammo_casing/shotgun/flash
	matter = list(MATERIAL_STEEL = 600, MATERIAL_GLASS = 360)
	marking_color = COLOR_PALE_YELLOW

/obj/item/ammo_magazine/shotholder/stun
	name = "stun shell holder"
	ammo_type = /obj/item/ammo_casing/shotgun/stunshell
	matter = list(MATERIAL_STEEL = 1700, MATERIAL_GLASS = 2900)
	marking_color = COLOR_MUZZLE_FLASH

/obj/item/ammo_magazine/shotholder/flecchete
	name = "flechette shell holder"
	caliber = CALIBER_SHOTGUN_BIG
	ammo_type = /obj/item/ammo_casing/shotgun/flechette
	matter = list(MATERIAL_STEEL = 1700, MATERIAL_GLASS = 2900)
	marking_color = COLOR_PURPLE

/obj/item/ammo_magazine/shotholder/sabot
	name = "sabot shell holder"
	caliber = CALIBER_SABOT
	ammo_type = /obj/item/ammo_casing/sabot
	matter = list(MATERIAL_STEEL = 1240)
	marking_color = COLOR_GUNMETAL

/obj/item/ammo_magazine/shotholder/empty
	name = "shotgun ammunition holder"
	matter = list(MATERIAL_STEEL = 250)
	initial_ammo = 0

/obj/item/ammo_magazine/shotholder/birdshot
	name = "rubbershot shell holder"
	ammo_type = /obj/item/ammo_casing/shotgun/birdshot
	matter = list(MATERIAL_STEEL = 620)
	marking_color = COLOR_PALE_YELLOW

/obj/item/ammo_magazine/machine_pistol
	name = "Vesper stick magazine"
	icon_state = "machine_pistol"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/pistol
	matter = list(MATERIAL_STEEL = 1200)
	caliber = CALIBER_PISTOL
	max_ammo = 25
	multiple_sprites = 1

/obj/item/ammo_magazine/machine_pistol/empty
	initial_ammo = 0

/obj/item/ammo_magazine/smg_top
	name = "550 SMG top-mounted magazine, standard"
	icon_state = "smg_top"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/pistol/small
	matter = list(MATERIAL_STEEL = 1200)
	caliber = CALIBER_PISTOL_SMALL
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/smg_top/empty
	initial_ammo = 0

/obj/item/ammo_magazine/smg_top/rubber
	name = "550 SMG top-mounted magazine, rubber"
	labels = list("rubber")
	ammo_type = /obj/item/ammo_casing/pistol/small/rubber

/obj/item/ammo_magazine/smg_top/practice
	name = "550 SMG top-mounted magazine, practice"
	labels = list("practice")
	ammo_type = /obj/item/ammo_casing/pistol/small/practice

/obj/item/ammo_magazine/smg
	name = "box magazine"
	icon_state = "smg"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL
	matter = list(MATERIAL_STEEL = 1500)
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/smg/empty
	initial_ammo = 0

/obj/item/ammo_magazine/pistol
	name = "single-stack 10mm pistol magazine, standard"
	icon_state = "pistol"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL
	matter = list(MATERIAL_STEEL = 750)
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/pistol/empty
	name = "single-stack 10mm pistol magazine, empty"
	initial_ammo = 0

/obj/item/ammo_magazine/pistol/rubber
	name = "single-stack 10mm pistol magazine, rubber"
	labels = list("rubber")
	ammo_type = /obj/item/ammo_casing/pistol/rubber

/obj/item/ammo_magazine/pistol/double
	name = "double-stack 10mm pistol magazine"
	icon_state = "pistol"
	matter = list(MATERIAL_STEEL = 1050)
	max_ammo = 18

/obj/item/ammo_magazine/pistol/double/rubber
	name = "double-stack 10mm pistol magazine, rubber"
	labels = list("rubber")
	ammo_type = /obj/item/ammo_casing/pistol/rubber

/obj/item/ammo_magazine/pistol/double/practice
	name = "double-stack 10mm pistol magazine, practice"
	labels = list("practice")
	ammo_type = /obj/item/ammo_casing/pistol/practice

/obj/item/ammo_magazine/pistol/small
	name = "7mm pistol magazine"
	icon_state = "holdout"
	matter = list(MATERIAL_STEEL = 480)
	caliber = CALIBER_PISTOL_SMALL
	ammo_type = /obj/item/ammo_casing/pistol/small
	max_ammo = 12

/obj/item/ammo_magazine/pistol/small/empty
	name = "7mm pistol magazine, empty"
	initial_ammo = 0

/obj/item/ammo_magazine/magnum
	name = "15mm magnum magazine, standard"
	icon_state = "magnum"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL_MAGNUM
	matter = list(MATERIAL_STEEL = 1680)
	ammo_type = /obj/item/ammo_casing/pistol/magnum
	max_ammo = 9
	multiple_sprites = 1

/obj/item/ammo_magazine/magnum/empty
	initial_ammo = 0

/obj/item/ammo_magazine/magnum/rubber
	name = "15mm magnum magazine, rubber"
	ammo_type = /obj/item/ammo_casing/pistol/magnum/rubber

/obj/item/ammo_magazine/box/smallpistol
	name = "ammunition box, 7mm"
	icon_state = "smallpistol"
	origin_tech = list(TECH_COMBAT = 2)
	matter = list(MATERIAL_STEEL = 1800)
	caliber = CALIBER_PISTOL_SMALL
	ammo_type = /obj/item/ammo_casing/pistol/small
	max_ammo = 50

/obj/item/ammo_magazine/box/pistol
	name = "ammunition box, 10mm"
	icon_state = "smallpistol"
	origin_tech = list(TECH_COMBAT = 2)
	caliber = CALIBER_PISTOL
	matter = list(MATERIAL_STEEL = 2250)
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 50

/obj/item/ammo_magazine/box/pistol/empty
	initial_ammo = 0

/obj/item/ammo_magazine/pistol/throwback
	name = "Colt 1911 magazine, .45 ACP"
	caliber = CALIBER_PISTOL_ANTIQUE
	ammo_type = /obj/item/ammo_casing/pistol/throwback
	max_ammo = 7

/obj/item/ammo_magazine/pistol/throwback/pistol2
	name = "SIG P220 magazine, .45 ACP"
	caliber = CALIBER_PISTOL_ANTIQUE
	ammo_type = /obj/item/ammo_casing/pistol/throwback
	max_ammo = 12

/obj/item/ammo_magazine/pistol/throwback/pistol3
	name = "CZ75 magazine, 9mm NATO"
	caliber = CALIBER_PISTOL_ANTIQUE
	ammo_type = /obj/item/ammo_casing/pistol/throwback
	max_ammo = 16

/obj/item/ammo_magazine/pistol/throwback/pistol4
	name = "Beretta 92 magazine, 9mm NATO"
	caliber = CALIBER_PISTOL_ANTIQUE
	ammo_type = /obj/item/ammo_casing/pistol/throwback
	max_ammo = 15

/obj/item/ammo_magazine/gyrojet
	name = "microrocket magazine"
	icon_state = "gyrojet"
	mag_type = MAGAZINE
	caliber = CALIBER_GYROJET
	ammo_type = /obj/item/ammo_casing/gyrojet
	multiple_sprites = 1
	max_ammo = 4

/obj/item/ammo_magazine/rocket
	name = "Internal Rocket Storage"
	icon_state = "gyrojet"
	mag_type = MAGAZINE
	caliber = CALIBER_ROCKET
	ammo_type = /obj/item/ammo_casing/rocket
	multiple_sprites = 1
	max_ammo = 20

/obj/item/ammo_magazine/gyrojet/empty
	initial_ammo = 0

/obj/item/ammo_magazine/box/emp/pistol
	name = "ammunition box, 10mm EMP"
	desc = "A box containing loose rounds of standard EMP ammo."
	labels = list("haywire")
	ammo_type = /obj/item/ammo_casing/pistol/emp
	caliber = CALIBER_PISTOL
	max_ammo = 20

/obj/item/ammo_magazine/box/emp/smallpistol
	name = "ammunition box, 7mm EMP"
	desc = "A box containing loose rounds of small EMP ammo."
	labels = list("haywire")
	ammo_type = /obj/item/ammo_casing/pistol/small/emp
	caliber = CALIBER_PISTOL_SMALL
	max_ammo = 20

/obj/item/ammo_magazine/proto_smg
	name = "Sabre submachine gun magazine"
	icon_state = CALIBER_PISTOL_FLECHETTE
	origin_tech = list(TECH_COMBAT = 4)
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL_FLECHETTE
	matter = list(MATERIAL_STEEL = 2000)
	ammo_type = /obj/item/ammo_casing/flechette
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/box/machinegun
	name = "MG box magazine"
	icon_state = "machinegun"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE
	matter = list(MATERIAL_STEEL = 4500)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 100
	multiple_sprites = 1

/obj/item/ammo_magazine/armcannonmg
	name = "Internal ammo stowage, MG"
	icon_state = "machinegun"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE_MILITARY
	matter = list(MATERIAL_STEEL = 4500)
	ammo_type = /obj/item/ammo_casing/rifle/military
	max_ammo = 1000

/obj/item/ammo_magazine/armcannonsmg
	name = "Internal ammo stowage, SMG"
	icon_state = CALIBER_PISTOL_FLECHETTE
	origin_tech = list(TECH_COMBAT = 4)
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL_FLECHETTE
	matter = list(MATERIAL_STEEL = 2000)
	ammo_type = /obj/item/ammo_casing/flechette
	max_ammo = 2500

/obj/item/ammo_magazine/armcannonsniper
	name = "Internal ammo stowage, sniper"
	icon_state = CALIBER_ANTIMATERIAL
	origin_tech = list(TECH_COMBAT = 4)
	mag_type = MAGAZINE
	caliber = CALIBER_ANTIMATERIAL
	matter = list(MATERIAL_STEEL = 2000)
	ammo_type = /obj/item/ammo_casing/shell
	max_ammo = 30

/obj/item/ammo_magazine/box/lewisgun
	name = "Lewis Gun magazine"
	icon = 'icons/obj/guns/ww1equipment.dmi'
	icon_state = "lewismag"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE
	matter = list(MATERIAL_STEEL = 2500)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 47
	multiple_sprites = 0

/obj/item/ammo_magazine/box/machinegun/empty
	initial_ammo = 0

/obj/item/ammo_magazine/box/lewisgun/empty
	initial_ammo = 0

/obj/item/ammo_magazine/rifle
	name = "STS-35 assault rifle magazine"
	icon_state = "assault_rifle"
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE
	matter = list(MATERIAL_STEEL = 1800)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/aks74u
	name = "AKS-74U magazine"
	icon_state = "aks74u"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE_MILITARY
	matter = list(MATERIAL_PLASTIC = 1800)
	ammo_type = /obj/item/ammo_casing/rifle/military
	max_ammo = 30
	multiple_sprites = 0

/obj/item/ammo_magazine/mil_rifle
	name = "Z9 assault rifle magazine, standard"
	icon_state = "bullup"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE_MILITARY
	matter = list(MATERIAL_STEEL = 1800)
	ammo_type = /obj/item/ammo_casing/rifle/military
	max_ammo = 20 //if we lived in a world where normal mags had 30 rounds, this would be a 20 round mag
	multiple_sprites = 1

/obj/item/ammo_magazine/mil_rifle/sec
	name = "Z9 frangible munitions rifle magazine"
	ammo_type = /obj/item/ammo_casing/rifle/military/low
	allowed_round = list(/obj/item/ammo_casing/rifle/military/low)

//bigger mag
/obj/item/ammo_magazine/mil_rifle/sec/large
	name = "Z9 high-cap frangible munitions rifle magazine"
	icon_state = "assault_rifle"
	ammo_type = /obj/item/ammo_casing/rifle/military/low
	max_ammo = 40

/obj/item/ammo_magazine/mil_rifle/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mil_rifle/practice
	name = "Z9 magazine, practice ammunition"
	labels = list("practice")
	ammo_type = /obj/item/ammo_casing/rifle/military/practice

/obj/item/ammo_magazine/caps
	name = "speed loader, cap gun"
	desc = "A cheap plastic speed loader for some kind of revolver."
	icon_state = "T38"
	caliber = CALIBER_CAPS
	ammo_type = /obj/item/ammo_casing/cap
	matter = list(MATERIAL_STEEL = 600)
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/speedloader/large
	name = "heavy speed loader"
	icon_state = "spdloader_magnum"
	caliber = CALIBER_PISTOL_MAGNUM_LARGE
	ammo_type = /obj/item/ammo_casing/pistol/magnum/large
	matter = list(MATERIAL_STEEL = 50000) //Same as the RCD, retardedly high, for good reason.
	max_ammo = 6
	multiple_sprites = 1
