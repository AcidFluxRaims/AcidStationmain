
/obj/item/ammo_casing/pistol
	name = "Service pistol cartridge"
	desc = "A pistol bullet casing."
	caliber = CALIBER_PISTOL
	projectile_type = /obj/item/projectile/bullet/pistol
	icon_state = "pistolcasing"
	spent_icon = "pistolcasing-spent"

/obj/item/ammo_casing/pistol/xo
	desc = "A rubber pistol bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/xo

/obj/item/ammo_casing/pistol/rubber
	desc = "A rubber pistol bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber
	icon_state = "pistolcasing_r"

/obj/item/ammo_casing/pistol/practice
	desc = "A practice pistol bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/practice
	icon_state = "pistolcasing_p"

/obj/item/ammo_casing/pistol/small
	name = "Small caliber cartridge"
	desc = "A small pistol bullet casing."
	caliber = CALIBER_PISTOL_SMALL
	projectile_type = /obj/item/projectile/bullet/pistol/holdout
	icon_state = "smallcasing"
	spent_icon = "smallcasing-spent"

/obj/item/ammo_casing/pistol/small/rubber
	desc = "A small pistol rubber bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/rubber/holdout
	icon_state = "pistolcasing_r"

/obj/item/ammo_casing/pistol/small/practice
	desc = "A small pistol practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/practice
	icon_state = "pistolcasing_p"

/obj/item/ammo_casing/pistol/magnum
	name = "Small magnum pistol cartridge"
	desc = "A high-power pistol bullet casing."
	caliber = CALIBER_PISTOL_MAGNUM
	projectile_type = /obj/item/projectile/bullet/pistol/strong
	icon_state = "magnumcasing"
	spent_icon = "magnumcasing-spent"

/obj/item/ammo_casing/pistol/magnum/rubber
	desc = "A high-power pistol rubber bullet casing."
	caliber = CALIBER_PISTOL_MAGNUM
	projectile_type = /obj/item/projectile/bullet/pistol/strong/rubber

/obj/item/ammo_casing/pistol/magnum/large
	name = "Large magnum pistol cartridge"
	desc = "A high-power bullet casing."
	caliber = CALIBER_PISTOL_MAGNUM_LARGE
	projectile_type = /obj/item/projectile/bullet/pistol/large

/obj/item/ammo_casing/pistol/throwback
	desc = "An antique pistol bullet casing. Somewhere between 9 and 11 mm in caliber."
	caliber = CALIBER_PISTOL_ANTIQUE

/obj/item/ammo_casing/flechette
	desc = "A flechette casing."
	caliber = CALIBER_PISTOL_FLECHETTE
	projectile_type = /obj/item/projectile/bullet/flechette
	icon_state = "flechette-casing"
	spent_icon = "flechette-casing-spent"

/obj/item/ammo_casing/shotgun
	name = "shotgun slug"
	desc = "A shotgun slug."
	icon_state = "slshell"
	spent_icon = "slshell-spent"
	caliber = CALIBER_SHOTGUN
	projectile_type = /obj/item/projectile/bullet/shotgun
	matter = list(MATERIAL_STEEL = 360)
	fall_sounds = list('sound/weapons/guns/shotgun_fall.ogg')

/obj/item/ammo_casing/shotgun/pellet
	name = "shotgun shell"
	desc = "A shotshell."
	icon_state = "gshell"
	spent_icon = "gshell-spent"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun
	matter = list(MATERIAL_STEEL = 360)

/obj/item/ammo_casing/shotgun/practice
	name = "shotgun shell"
	desc = "A practice shell."
	icon_state = "pshell"
	spent_icon = "pshell-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/practice
	matter = list(MATERIAL_STEEL = 90)

/obj/item/ammo_casing/shotgun/beanbag
	name = "beanbag shell"
	desc = "A beanbag shell."
	icon_state = "bshell"
	spent_icon = "bshell-spent"
	projectile_type = /obj/item/projectile/bullet/shotgun/beanbag
	matter = list(MATERIAL_STEEL = 180)

/obj/item/ammo_casing/shotgun/flechette
	name = "flechette shell"
	desc = "A skrellian flechette shell, this thing is huge"
	icon_state = "fshell"
	spent_icon = "fshell-spent"
	caliber = CALIBER_SHOTGUN_BIG
	projectile_type = /obj/item/projectile/bullet/shotgun/flechette
	matter = list(MATERIAL_STEEL = 360)

/obj/item/ammo_casing/shotgun/birdshot
	name = "rubbershot shell"
	desc = "A rubbershot shell."
	icon = 'icons/boh/ammo.dmi'
	icon_state = "bdshell"
	spent_icon = "bdshell-spent"
	projectile_type = /obj/item/projectile/bullet/pellet/birdshot
	matter = list(MATERIAL_STEEL = 80)

//Can stun in one hit if aimed at the head, but
//is blocked by clothing that stops tasers and is vulnerable to EMP
/obj/item/ammo_casing/shotgun/stunshell
	name = "stun shell"
	desc = "An energy stun cartridge."
	icon_state = "stunshell"
	spent_icon = "stunshell-spent"
	projectile_type = /obj/item/projectile/energy/electrode/stunshot
	leaves_residue = 0
	matter = list(MATERIAL_STEEL = 360, MATERIAL_GLASS = 720)

/obj/item/ammo_casing/shotgun/stunshell/emp_act(severity)
	if(prob(100/severity)) BB = null
	update_icon()

//Does not stun, only blinds, but has area of effect.
/obj/item/ammo_casing/shotgun/flash
	name = "flash shell"
	desc = "A chemical shell used to signal distress or provide illumination."
	icon_state = "fshell"
	spent_icon = "fshell-spent"
	projectile_type = /obj/item/projectile/energy/flash/flare
	matter = list(MATERIAL_STEEL = 90, MATERIAL_GLASS = 90)

/obj/item/ammo_casing/sabot
	name = "sabot shell"
	desc = "APFSDS in a neat little package. It's prone to over penetrating, and as such does little damage to targets without armor." //even though it does little damage overall, being a niche round.
	icon = 'icons/boh/ammo.dmi'
	icon_state = "sabshell"
	spent_icon = "sabshell-spent"
	caliber = CALIBER_SABOT
	projectile_type = /obj/item/projectile/bullet/sabot
	matter = list(MATERIAL_STEEL = 420)

/obj/item/ammo_casing/rifle
	name = "7mmR rifle cartridge"
	desc = "A rifle bullet casing."
	caliber = CALIBER_RIFLE
	projectile_type = /obj/item/projectile/bullet/rifle
	icon_state = "riflecasing"
	spent_icon = "riflecasing-spent"

/obj/item/ammo_casing/shell
	name = "shell casing"
	desc = "An antimaterial shell casing."
	icon_state = "lcasing"
	spent_icon = "lcasing-spent"
	caliber = CALIBER_ANTIMATERIAL
	projectile_type = /obj/item/projectile/bullet/rifle/shell
	matter = list(MATERIAL_STEEL = 1250)

/obj/item/ammo_casing/shell/apds
	name = "\improper APDS shell casing"
	desc = "An Armour Piercing Discarding Sabot shell."
	projectile_type = /obj/item/projectile/bullet/rifle/shell/apds
	matter = list(MATERIAL_STEEL = 2450)

/obj/item/ammo_casing/rifle/military
	desc = "A military rifle bullet casing."
	caliber = CALIBER_RIFLE_MILITARY
	projectile_type = /obj/item/projectile/bullet/rifle/military
	icon_state = "rifle_mil"
	spent_icon = "rifle_mil-spent"

/obj/item/ammo_casing/rifle/military/large
	desc = "A military sniper rifle bullet casing."
	caliber = CALIBER_RIFLE_MILITARY_LARGE
	projectile_type = /obj/item/projectile/bullet/rifle/military/large
	icon_state = "rifle_mil"
	spent_icon = "rifle_mil-spent"

/obj/item/ammo_casing/rifle/military/practice
	desc = "A military rifle practice bullet casing."
	projectile_type = /obj/item/projectile/bullet/rifle/military/practice
	icon_state = "rifle_mil_p"

/obj/item/ammo_casing/rifle/military/low
	desc = "A frangible bullet casing."
	caliber = CALIBER_RIFLE_MILITARY
	projectile_type = /obj/item/projectile/bullet/rifle/military/sec

/obj/item/ammo_casing/rocket
	name = "rocket shell"
	desc = "A high explosive designed to be fired from a launcher."
	icon_state = "rocketshell"
	projectile_type = /obj/item/missile
	caliber = "rocket"

/obj/item/ammo_casing/cap
	name = "cap"
	desc = "A cap for children's toys."
	caliber = CALIBER_CAPS
	color = "#ff0000"
	projectile_type = /obj/item/projectile/bullet/pistol/cap

// EMP ammo.
/obj/item/ammo_casing/pistol/emp
	name = "haywire round"
	desc = "A pistol bullet casing fitted with a single-use ion pulse generator."
	projectile_type = /obj/item/projectile/ion/small
	icon_state = "pistolcasing_h"
	matter = list(MATERIAL_STEEL = 130, MATERIAL_URANIUM = 100)

/obj/item/ammo_casing/pistol/small/emp
	name = "small haywire round"
	desc = "A small bullet casing fitted with a single-use ion pulse generator."
	projectile_type = /obj/item/projectile/ion/tiny
	icon_state = "smallcasing_h"

/obj/item/ammo_casing/shotgun/emp
	name = "haywire slug"
	desc = "A 12-gauge shotgun slug fitted with a single-use ion pulse generator."
	icon_state = "empshell"
	spent_icon = "empshell-spent"
	projectile_type  = /obj/item/projectile/ion
	matter = list(MATERIAL_STEEL = 260, MATERIAL_URANIUM = 200)

/obj/item/ammo_casing/rocket/rcr
	name = "incendiary shell"
	desc = "A high explosive designed to be fired from a launcher. This one is marked with various warnings. As if anyone reads them, pfft. \
	It does mention something about being an incredibly localized explosive, however, and only to be used against non-organic targets. Whatever that means."
	icon = 'icons/boh/ammo.dmi'
	icon_state = "rcrshell"
	matter = list(MATERIAL_STEEL = 50000) //Same as the RCD, retardedly high, for good reason.
	projectile_type = /obj/item/projectile/bullet/rcr

/obj/item/projectile/bullet/gyro
	name = "minirocket"
	fire_sound = 'sound/effects/Explosion1.ogg'
	var/gyro_devastation = -1
	var/gyro_heavy_impact = 0
	var/gyro_light_impact = 2

/obj/item/projectile/bullet/gyro/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target))
		explosion(target, gyro_devastation, gyro_heavy_impact, gyro_light_impact)
	..()
