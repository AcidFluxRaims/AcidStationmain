//If anyone asks it was like this when I found it :wink://

/////////
// projectile global lock
/////////
/obj/item/weapon/gun/projectile/free_fire()
	var/my_z = get_z(src)
	if(!GLOB.using_map.station_levels.Find(my_z))
		return TRUE
	return ..()

/////////
// laser global lock
/////////
/obj/item/weapon/gun/energy/free_fire()
	var/my_z = get_z(src)
	if(!GLOB.using_map.station_levels.Find(my_z))
		return TRUE
	return ..()


/////////
// Infantry Kits
/////////

/obj/item/gunbox/infantry
	name = "Standard Kit"
	desc = "A secure box containing a sidearm and primary."

/obj/item/gunbox/infantry/attack_self(mob/living/user)
	var/list/options = list()
	options["Ballistic - Bullpup Rifle"] = list(/obj/item/weapon/gun/projectile/automatic/bullpup_rifle/sec,/obj/item/ammo_magazine/mil_rifle/sec,/obj/item/weapon/gun/projectile/pistol/military/sec,/obj/item/weapon/grenade/frag/shell,/obj/item/weapon/grenade/frag/shell,/obj/item/weapon/grenade/frag/shell)
	options["Energy - Laser Carbine"] = list(/obj/item/weapon/gun/energy/laser/infantry,/obj/item/weapon/gun/projectile/pistol/military/sec,/obj/item/weapon/grenade/frag,/obj/item/weapon/grenade/frag,/obj/item/weapon/grenade/frag)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/weapon/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/obj/item/gunbox/infcom
	name = "Squad Leader Kit"
	desc = "A secure box containing a sidearm and primary."

/obj/item/gunbox/infcom/attack_self(mob/living/user)
	var/list/options = list()
	options["Ballistic - Tectonic"] = list(/obj/item/weapon/gun/projectile/shotgun/sabotgun,
	/obj/item/ammo_magazine/shotholder/sabot,/obj/item/ammo_magazine/shotholder/sabot,/obj/item/ammo_magazine/shotholder/sabot,/obj/item/ammo_magazine/shotholder/sabot,/obj/item/ammo_magazine/shotholder/sabot,/obj/item/ammo_magazine/shotholder/sabot)
	options["Ballistic - Komodo"] = list(/obj/item/weapon/gun/projectile/automatic/bullpup_rifle/sec/lmg,/obj/item/ammo_magazine/mil_rifle/sec/large,/obj/item/ammo_magazine/mil_rifle/sec/large,/obj/item/ammo_magazine/mil_rifle/sec/large,/obj/item/weapon/gun/energy/revolver/secure)
	options["Energy - Laser Carbine (has burst fire)"] = list(/obj/item/weapon/gun/energy/laser/infantry/sl,/obj/item/weapon/gun/energy/revolver/secure)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/weapon/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/obj/item/gunbox/infcom/secondary
	name = "Squad Leader Squad Kit"
	desc = "A secure box containing a secondary set of equipment for the entire squad's benefit."

/obj/item/gunbox/infcom/secondary/attack_self(mob/living/user)
	var/list/options = list()
	options["Tactical Goggles x5"] = list(/obj/item/clothing/glasses/tacgoggles,/obj/item/clothing/glasses/tacgoggles,/obj/item/clothing/glasses/tacgoggles,/obj/item/clothing/glasses/tacgoggles,/obj/item/clothing/glasses/tacgoggles)
	options["Advanced Medical Equipment"] = list(/obj/item/bodybag/cryobag,/obj/item/weapon/reagent_containers/hypospray/vial,/obj/item/weapon/reagent_containers/hypospray/autoinjector/stim,/obj/item/weapon/reagent_containers/hypospray/autoinjector/stim,/obj/item/weapon/reagent_containers/ivbag/nanoblood,/obj/item/weapon/reagent_containers/ivbag/nanoblood)
	options["Demolitions Equipment"] = list(/obj/item/weapon/plastique,/obj/item/weapon/plastique,/obj/item/weapon/plastique,/obj/item/weapon/plastique,/obj/item/weapon/plastique,/obj/item/weapon/reagent_containers/glass/bottle/thermite,/obj/item/weapon/reagent_containers/glass/bottle/thermite,/obj/item/weapon/reagent_containers/spray)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/weapon/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/obj/item/gunbox/inftech
	name = "Technician Kit"
	desc = "A secure box containing a sidearm and primary."

/obj/item/gunbox/inftech/attack_self(mob/living/user)
	var/list/options = list()
//	options["Rocket Launcher"] = list(/obj/item/weapon/gun/launcher/rocket/recoilless/sec,/obj/item/ammo_casing/rocket/rcr,/obj/item/ammo_casing/rocket/rcr,/obj/item/weapon/gun/projectile/pistol/military/sec)
	options["Ballistic - Bullpup Rifle"] = list(/obj/item/weapon/gun/projectile/automatic/bullpup_rifle/sec,/obj/item/weapon/gun/projectile/pistol/military/sec)
	options["Ballistic - Combat Shotgun"] = list(/obj/item/weapon/gun/projectile/shotgun/pump/combat/infantry,/obj/item/weapon/gun/projectile/pistol/military/sec)
	var/choice = input(user,"What type of equipment?") as null|anything in options
	if(src && choice)
		var/list/things_to_spawn = options[choice]
		for(var/new_type in things_to_spawn)
			var/atom/movable/AM = new new_type(get_turf(src))
			if(istype(AM, /obj/item/weapon/gun/))
				to_chat(user, "You have chosen \the [AM].")
		qdel(src)

/////////
// Suits
/////////
/obj/machinery/suit_cycler/infantry
	name = "Infantry suit cycler"
	model_text = "Infantry"
	req_access = list(access_infantry)
	available_modifications = list(/decl/item_modifier/space_suit/hazard, /decl/item_modifier/space_suit/engineering/alt, /decl/item_modifier/space_suit/security/alt, /decl/item_modifier/space_suit/security)


/obj/item/weapon/rig/military/infantry
	name = "heavy suit control module"
	desc = "A heavy, incredibly sleek suit of military grade armor. \
	The minor ablative coating and composite armor makes it seem incredibly sturdy."
	req_access = list(access_infantry)
	suit_type = "military hardsuit"
	icon_state = "military_rig"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
		)

	allowed = list(/obj/item/device/flashlight, /obj/item/weapon/tank,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/handcuffs,/obj/item/device/t_scanner, /obj/item/weapon/rcd, /obj/item/weapon/crowbar, \
	/obj/item/weapon/screwdriver, /obj/item/weapon/weldingtool, /obj/item/weapon/wirecutters, /obj/item/weapon/wrench, /obj/item/device/multitool, \
	/obj/item/device/radio, /obj/item/device/scanner/gas,/obj/item/weapon/storage/briefcase/inflatable, /obj/item/weapon/melee/baton, /obj/item/weapon/gun, \
	/obj/item/weapon/storage/firstaid, /obj/item/weapon/reagent_containers/hypospray, /obj/item/roller, /obj/item/device/suit_cooling_unit, /obj/item/weapon/storage/)

	initial_modules = list(
		/obj/item/rig_module/cooling_unit,
		/obj/item/rig_module/maneuvering_jets
	)

//Vending
/obj/machinery/vending/security/infantry
	name = "InfTech"
	desc = "A munition vendor."
	req_access = list(access_infantry)
	products = list(
		/obj/item/ammo_magazine/mil_rifle/sec = 25,
		/obj/item/ammo_magazine/mil_rifle/sec/large = 6,
		/obj/item/ammo_magazine/mil_rifle = 12,
		/obj/item/ammo_magazine/mil_rifle/practice = 40,
		/obj/item/ammo_magazine/pistol/double = 20,
		/obj/item/ammo_magazine/pistol/double/rubber = 30,
		/obj/item/ammo_magazine/shotholder/shell = 26,
		/obj/item/ammo_magazine/shotholder = 10,
		/obj/item/ammo_magazine/pistol = 20,
		/obj/item/ammo_magazine/pistol/small = 20,
		/obj/item/ammo_magazine/magnum = 8,
		/obj/item/ammo_magazine/machine_pistol = 20,
		/obj/item/ammo_magazine/rifle = 20,
		/obj/item/ammo_magazine/proto_smg = 20,
		/obj/item/ammo_magazine/smg = 20,
		/obj/item/ammo_magazine/smg_top = 20,
		/obj/item/ammo_magazine/speedloader/clip = 40,
		/obj/item/ammo_magazine/speedloader/magnum = 10,
		/obj/item/ammo_magazine/speedloader/large = 5,
		/obj/item/ammo_magazine/box/lewisgun = 10,
		/obj/item/ammo_magazine/pistol/throwback = 15,
		/obj/item/ammo_magazine/pistol/throwback/pistol2 = 15,
		/obj/item/ammo_magazine/pistol/throwback/pistol3 = 15,
		/obj/item/ammo_magazine/pistol/throwback/pistol4 = 15,
		/obj/item/weapon/gun/projectile/automatic/bullpup_rifle/sec/lmg = 5,
		/obj/item/weapon/gun/projectile/automatic/bullpup_rifle/sec = 5,
		/obj/item/weapon/gun/projectile/automatic/assault_rifle = 4,
		/obj/item/weapon/gun/projectile/automatic/brengun = 2,
		/obj/item/weapon/gun/projectile/automatic/machine_pistol = 4,
		/obj/item/weapon/gun/projectile/automatic/owen = 3,
		/obj/item/weapon/gun/projectile/pistol/magnum_pistol = 2,
		/obj/item/weapon/gun/projectile/revolver = 2,
		/obj/item/weapon/gun/projectile/pistol/military = 4,
		/obj/item/weapon/gun/projectile/pistol/military/alt = 4,
		/obj/item/weapon/gun/projectile/pistol/sec = 4,
		/obj/item/weapon/gun/projectile/pistol/holdout = 4,
		/obj/item/weapon/gun/energy/gun/small = 4,
		/obj/item/weapon/gun/energy/gun = 4,
		/obj/item/weapon/gun/energy/revolver/secure/modifiedlaer = 3,
		/obj/item/weapon/gun/projectile/automatic = 4,
		/obj/item/weapon/gun/projectile/automatic/sec_smg = 6,
		/obj/item/weapon/gun/projectile/shotgun/pump = 4,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat = 2,
		/obj/item/weapon/gun/projectile/heavysniper/boltaction = 3,
		/obj/item/weapon/gun/projectile/revolver = 2,
		/obj/item/weapon/gun/projectile/automatic/fal = 3,
		/obj/item/weapon/gun/projectile/heavysniper/enfield4 = 3,
		/obj/item/weapon/gun/projectile/heavysniper/smle = 3,
		/obj/item/weapon/gun/projectile/heavysniper/enfield4scoped = 1,
		/obj/item/weapon/gun/projectile/heavysniper/smlescoped = 1,
		/obj/item/weapon/gun/projectile/heavysniper/junglecarbine = 3,
		/obj/item/weapon/gun/energy/leelaser = 2,
		/obj/item/weapon/gun/energy/laser/infantry/sl = 3,
		/obj/item/weapon/gun/projectile/automatic/lewisgun = 2,
		/obj/item/weapon/gun/projectile/pistol/throwback = 2,
		/obj/item/weapon/gun/projectile/pistol/throwback/pistol2 = 2,
		/obj/item/weapon/gun/projectile/pistol/throwback/pistol3 = 2,
		/obj/item/weapon/gun/projectile/pistol/throwback/pistol4 = 2,
		/obj/item/weapon/gun/projectile/shotgun/sabotgun = 2

		)

/////////
// Pistol
/////////
/obj/item/weapon/gun/projectile/pistol/military/sec
	name = "P10 pistol"
	desc = "The Hephaestus Industries P10 - a mass produced kinetic sidearm in widespread service with the SCGDF. This version has been de-restricted for military use."
	fire_delay = 0
	authorized_modes = list(UNAUTHORIZED)
	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=null),
		)

/////////
// Sec Bullpup
/////////
/obj/item/weapon/gun/projectile/automatic/bullpup_rifle/sec
	name = "Z9 Pitbull"
	desc = "The Hephaestus Industries Z9 Pitbull is a newer generation bullpup carbine. This version is the standard issue of SCGDF marines. \
	Still has the kickass grenade launcher, though! The aforementioned forced munition is a highly specialized frangible bullet. Designed to minimize crossfire damage, alongside civilian casualties."
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	ammo_type = /obj/item/ammo_casing/rifle/military/low
	magazine_type = /obj/item/ammo_magazine/mil_rifle/sec
	allowed_magazines = list(/obj/item/ammo_magazine/mil_rifle/sec, /obj/item/ammo_magazine/mil_rifle/, /obj/item/ammo_magazine/mil_rifle/sec/large)
	auto_eject = 1
	starts_loaded = 1
	one_hand_penalty = 6 //lower power rounds
	jam_chance = 3
	authorized_modes = list(UNAUTHORIZED)
	firemodes = list(
		list(mode_name="semi auto",       burst=1,    fire_delay=null,    move_delay=null, use_launcher=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		list(mode_name="Three round burst", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=8, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    one_hand_penalty=10, burst_accuracy=null, dispersion=null)
		)

//sec proper
/obj/item/weapon/gun/projectile/automatic/bullpup_rifle/sec/b
	name = "Z9B Pitbull"
	desc = "The Hephaestus Industries Z9B Pitbull is an experimental design of the standard Z9. Having an enforced fire-rate for use aboard civilian heavy areas, it does away with some of the use. \
	Because of the limited fire-rate, and how the mechanism functions, it has a much lower jam rate."
	jam_chance = 1
	firemodes = list(
		list(mode_name="semi auto",       burst=1,    fire_delay=null,    move_delay=null, use_launcher=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    one_hand_penalty=10, burst_accuracy=null, dispersion=null)
		)

//rifle
/obj/item/weapon/gun/projectile/automatic/bullpup_rifle/sec/lmg
	name = "Z6 Komodo"
	desc = "The Hephaestus Industries Z6 Komodo is an old bullpup carbine conversion. \
	It adds the possibility of automatic fire, though at the cost of likely jams."
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	auto_eject = 1
	one_hand_penalty = 8
	jam_chance = 6 //frangible rounds might shatter if they're chambered improperly. Especially so with such a high firerate.
	firemodes = list(
		list(mode_name="semi auto", burst=1, fire_delay=null, move_delay=null, use_launcher=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		list(mode_name="burst fire",  burst=5, fire_delay=null, move_delay=2, one_hand_penalty=10, burst_accuracy=list(0,-1,-1,-2,-2), dispersion=list(0.0, 0.3, 0.5, 0.7, 1.0)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    one_hand_penalty=10, burst_accuracy=null, dispersion=null)
		)

//combat shotgun
/obj/item/weapon/gun/projectile/shotgun/pump/combat/infantry
	desc = "Built for close quarters combat, the Hephaestus Industries KS-40 is widely regarded as a weapon of choice for repelling boarders. \
	It appears to have a firing restrictor installed, to prevent firing without authorization aboard the Independence."
	authorized_modes = list(UNAUTHORIZED)

/////////
// Laser Carbine
/////////
/obj/item/weapon/gun/energy/laser/infantry
	name = "G40B carbine"
	desc = "A Hephaestus Industries G40B carbine, designed to kill with concentrated energy blasts. Fitted with safety chips to make sure discharge aboard a 'safe zone' is impossible.\
	Additionally, it features a higher capacity."
	charge_cost = 10
	max_shots = 20
	fire_delay = 2
	authorized_modes = list(UNAUTHORIZED)
	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null),
		list(mode_name="burst fire", burst=2, fire_delay=1, move_delay=1, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		)

//Squad Leaders carbine
/obj/item/weapon/gun/energy/laser/infantry/sl
	name = "G40C carbine"
	desc = "A Hephaestus Industries G40C carbine, designed to kill with concentrated energy blasts. In comparison to its slighty older cousin, this features better handling."
	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=null),
		list(mode_name="burst fire", burst=4, fire_delay=1, move_delay=1, one_hand_penalty=6, burst_accuracy=null, dispersion=null)
		)

///obj/item/weapon/gun/energy/laser/infantry/owen - Waiting on Bowie to finish this.
//	name = "Owen Laser Conversion"
//	desc = "An Owen-design laser conversion, light, fast, and effective... but with a limited energy capacity."
//	icon = 'icons/obj/guns/laser_carbine.dmi'
//	icon_state = "owenlaser"
//	item_state = "owenlaser"
//	slot_flags = SLOT_BACK, SLOT_BELT
//	w_class = ITEM_SIZE_NORMAL
//	force = 5
//	fire_delay = 3
//	one_hand_penalty = 0
//	bulk = null
//	firemodes = list(
//		list(mode_name="fire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=null, burst_accuracy=null, dispersion=null),
//		list(mode_name="burst fire", burst=4, fire_delay=1, move_delay=1, one_hand_penalty=3, burst_accuracy=null, dispersion=null)
//		)

/obj/item/weapon/gun/energy/laser/infantry/sl/armcannonlaser
	name = "Internal Automatic Laser System"
	desc = "A prototype medium-duty laser cannon, housed within a mechanical arm."
	icon = 'icons/obj/guns/armcannon.dmi'
	icon_state = "armcannonlaser"
	item_state = "armcannon"
	has_safety = 0
	wielded_item_state = null
	self_recharge = 1
	max_shots = 30
	recharge_time = 2
	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="burst fire", burst=5, fire_delay=0, move_delay=0, one_hand_penalty=0, burst_accuracy=null, dispersion=null)
		)

/////////
// LMG
/////////
/obj/item/weapon/gun/projectile/automatic/l6_saw/sec
	name = "L7 SAW"
	desc = "A rather traditionally made L7 SAW with a pleasantly lacquered wooden pistol grip. Has 'Aussec Armoury- 2561' engraved on the reciever. \
	It appears to have a firing restrictor installed, to prevent firing without authorization aboard the Independence."
	authorized_modes = list(UNAUTHORIZED)
	firemodes = list(
		list(mode_name="semi auto", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=6, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=5, fire_delay=null, move_delay=4, one_hand_penalty=8, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0))
		)

/////////
// Recoilless Rifle
/////////
/obj/item/weapon/gun/launcher/rocket/recoilless
	name = "TVP-2"
	desc = "A TVP-2 anti-armor recoilless rifle. Truly an anachronism of another time. \
	This specific model was designed to fire incendiary charges. Said charges have a minor explosive charge, with an incredibly powerful, though small, incendiary powder of sorts. \
	Hopefully it's still working after all this time, because, by god, this looks like an old relic. \
	What doesn't look like a relic, however, is the rather large optic mounted atop the rifle."
	icon = 'icons/boh/items/launchers.dmi'
	icon_state = "recoilless"
	item_state = "recoilless"
	wielded_item_state = "gun_wielded"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	base_parry_chance = 10
	authorized_modes = list(UNAUTHORIZED) //can't be registered, but that doesn't matter as this prevents firing regardless

	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=12, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/launcher/rocket/recoilless/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket/rcr))
		if(rockets.len < max_rockets)
			if(!user.unEquip(I, src))
				return
			rockets += I
			to_chat(user, "<span class='notice'>you carefully slide the shell into the [src].</span>")
			to_chat(user, "<span class='notice'>[rockets.len] / [max_rockets] shells.</span>")
		else
			to_chat(usr, "<span class='warning'>\The [src] cannot hold more than one shell, for obvious reasons.</span>")


/obj/item/weapon/gun/launcher/rocket/recoilless/free_fire()
	var/my_z = get_z(src)
	if(!GLOB.using_map.station_levels.Find(my_z))
		return TRUE
	return ..()

/////////
// SL Shotgun
/////////
/obj/item/weapon/gun/projectile/shotgun/sabotgun
	name = "GS-95 Tectonic"
	desc = "The Hephaestus Industries GS-95 Tectonic is a shotgun for frontline support infantry. It features a built in magazine, but must be loaded by hand."
	icon = 'icons/boh/items/shotguns.dmi'
	icon_state = "sexyshotgun"
	item_state = "sexyshotgun"
	wielded_item_state = "sexyshotgun-wielded"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = EJECT_CASINGS
	max_shells = 12
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	caliber = CALIBER_SHOTGUN
	authorized_modes = list(UNAUTHORIZED)
	jam_chance = 12 //big ol' gun. Purely for balance.
	base_parry_chance = 20
	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/shotgun/sabotgun/armcannonshotgun
	name = "Internal Scattergun System"
	desc = "A prototype shotgun system, mounted within a mechanical arm."
	icon = 'icons/obj/guns/armcannon.dmi'
	icon_state = "armcannonshotgun"
	item_state = "armcannon"
	w_class = ITEM_SIZE_HUGE
	slot_flags = null
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = EJECT_CASINGS
	has_safety = 0
	max_shells = 100
	one_hand_penalty = 0
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	caliber = CALIBER_SHOTGUN
	authorized_modes = null
	wielded_item_state = null
	jam_chance = 0 //big ol' gun. Purely for balance.
	base_parry_chance = 20
	fire_sound = 'sound/weapons/gunshot/acidarmcannon4.ogg'
	firemodes = list(
		list(mode_name="fire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=0,    one_hand_penalty=0, burst_accuracy=list(0,0,-1,-1),       dispersion=list(0.0, 0.0, 0.2, 0.4)),
		)
