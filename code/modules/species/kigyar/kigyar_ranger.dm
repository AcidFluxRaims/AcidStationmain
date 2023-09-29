/obj/item/clothing/under/kigyar/ranger_kigyar
	name = "\improper Kig-Yar Vacuum Suit"
	desc = "A Kig-Yar bodysuit for Ruuhtians and T\'vaoans. This variation is airtight and pressure-resistant."
	item_flags = STOPPRESSUREDAMAGE|AIRTIGHT

/obj/item/clothing/suit/armor/special/eva/ranger_kigyar
	name = "Kig-Yar Ranger Armor"
	desc = "A heavy suit of reinforced spaceproof Ranger armor, designed for extended operations in EVA. Its airtight fittings provide the user with immunity to biological contaminants and resistance to radiological hazards. Features a built-in manouvering system for basic movement in zero-gravity, but lacks the stabilization technology of dedicated jetpacks."
	species_restricted = list("Kig-Yar","Tvaoan Kig-Yar")
	icon = 'code/modules/halo/covenant/species/kigyar/ranger_kigyar.dmi'
	icon_state = "ranger_armor_obj"
	item_state = "ranger_armor"
	sprite_sheets = list("Kig-Yar" = 'code/modules/halo/covenant/species/kigyar/ranger_kigyar.dmi',"Tvaoan Kig-Yar" = 'code/modules/halo/covenant/species/kigyar/ranger_tvoan.dmi')
	blood_overlay_type = "armor"
	armor = list(melee = 55, bullet = 50, laser = 55, energy = 50, bomb = 40, bio = 100, rad = 30)
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT
	body_parts_covered = UPPER_TORSO | LOWER_TORSO | ARMS
	flags_inv = HIDETAIL
	cold_protection = UPPER_TORSO | LOWER_TORSO | ARMS
	heat_protection = UPPER_TORSO | LOWER_TORSO | ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	item_icons = list(
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)
	armor_thickness = 20
	armor_thickness_max = 20
	matter = list("nanolaminate" = 1)
	allowed = list(/obj/item/weapon/tank)

	specials = list(/datum/armourspecials/integrated_jetpack)

/obj/item/clothing/suit/armor/special/eva/ranger_kigyar/New()
	..()
	slowdown_per_slot[slot_wear_suit] += 0.02 // Movement speed malus due to the armor's weight.
	pocket_curr = new/obj/item/weapon/storage/internal/pockets(src,2, ITEM_SIZE_SMALL,null,ARMOUR_POCKET_CANHOLD)


/obj/item/clothing/shoes/magboots/ranger_kigyar
	name = "Kig-Yar Ranger Magboots"
	desc = "A heavy pair of Ranger magboots, designed for extended operations in EVA. Its airtight fittings provide the user with immunity to biological contaminants and resistance to radiological hazards."
	species_restricted = list("Kig-Yar","Tvaoan Kig-Yar")
	icon = 'code/modules/halo/covenant/species/kigyar/ranger_kigyar.dmi'
	icon_state = "ranger_boots_obj"
	item_state = "ranger_boots"
	sprite_sheets = list("Kig-Yar" = 'code/modules/halo/covenant/species/kigyar/ranger_kigyar.dmi',"Tvaoan Kig-Yar" = 'code/modules/halo/covenant/species/kigyar/ranger_tvoan.dmi')
	icon_base = null
	stepsound = 'code/modules/halo/sounds/walk_sounds/marine_boots.ogg'
	armor = list(melee = 40, bullet = 40, laser = 5, energy = 30, bomb = 15, bio = 100, rad = 30)
	body_parts_covered = LEGS|FEET
	cold_protection = LEGS|FEET
	heat_protection = LEGS|FEET
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	armor_thickness = 20
	armor_thickness_max = 20
	matter = list("nanolaminate" = 1)

/obj/item/clothing/shoes/magboots/ranger_kigyar/New()
	..()
	slowdown_per_slot[slot_shoes] += 0.02 // Movement speed malus due to the armor's weight.

/obj/item/clothing/head/helmet/ranger_kigyar
	name = "\improper Kig-Yar Ranger Helmet"
	desc = "A heavy Ranger helmet, designed for extended operations in EVA. Its airtight fittings provide the user with immunity to biological contaminants and resistance to radiological hazards."
	icon = 'code/modules/halo/covenant/species/kigyar/ranger_kigyar.dmi'
	icon_state = "Ranger_Helmet_obj"
	item_state = "Ranger_Helmet"
	sprite_sheets = list("Kig-Yar" = 'code/modules/halo/covenant/species/kigyar/ranger_kigyar.dmi',"Tvaoan Kig-Yar" = 'code/modules/halo/covenant/species/kigyar/ranger_tvoan.dmi')
	species_restricted = list("Kig-Yar","Tvaoan Kig-Yar")
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT
	body_parts_covered = HEAD|FACE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	flash_protection = FLASH_PROTECTION_MODERATE
	cold_protection = HEAD
	heat_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	armor = list(melee = 50, bullet = 30, laser = 50,energy = 20, bomb = 25, bio = 100, rad = 30)
	item_icons = list(
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)
	armor_thickness = 20
	armor_thickness_max = 20

	integrated_hud = /obj/item/clothing/glasses/hud/tactical/kigyar_nv
	matter = list("nanolaminate" = 1)

/obj/item/clothing/head/helmet/ranger_kigyar/New()
	..()
	slowdown_per_slot[slot_head] += 0.01 // Movement speed malus due to the armor's weight.