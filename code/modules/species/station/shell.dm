/datum/species/shell
	name = SPECIES_SHELL
	name_plural = "shells"

	description = "A relatively new generation of Integrated Positronic Chassis, Shell IPCs fill the niche for convincing mimicry of \
	humans at a glance. Mass-produced models are known to be similar to their predecessors in acting, with human-like articulation \
	but robotic personalities. Some high-end or custom made models (both of which are of ludicrous value), are nearly indistingishable \
	from humans in most regards, however still share the same ''logical'' thinking of a machine at their core."
	cyborg_noun = null

	preview_icon = 'icons/mob/human_races/species/human/preview.dmi'

	unarmed_types = list(/datum/unarmed_attack/punch, /datum/unarmed_attack/kick, /datum/unarmed_attack/stomp)
	rarity_value = 2
	strength = STR_HIGH

	min_age = 18
	max_age = 90

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = SYNTH_COLD_LEVEL_1
	cold_level_2 = SYNTH_COLD_LEVEL_2
	cold_level_3 = SYNTH_COLD_LEVEL_3

	heat_level_1 = SYNTH_HEAT_LEVEL_1		// Gives them about 35 seconds in space before taking damage
	heat_level_2 = SYNTH_HEAT_LEVEL_2
	heat_level_3 = SYNTH_HEAT_LEVEL_3

	body_temperature = 330.5 //Warmer than a normal human, but not 80C like a standard IPC

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_POISON
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_NO_FBP_CONSTRUCTION // | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_TONE_NORMAL | HAS_LIPS

	blood_color = "#75c6f4"
	flesh_color = "#575757"

	has_organ = list(
		BP_POSIBRAIN = /obj/item/organ/internal/posibrain,
		BP_EYES = /obj/item/organ/internal/eyes/robot
		)

	heat_discomfort_level = 373.15
	heat_discomfort_strings = list(
		"Your CPU temperature probes warn you that you are approaching critical heat levels!"
		)
	genders = list(MALE, FEMALE)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_POSITRONICS_GENERIC,
			CULTURE_POSITRONICS
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_ROOT,
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_VENUS,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_POSITRONICS,
			FACTION_SOL_CENTRAL,
			FACTION_INDIE_CONFED,
			FACTION_NANOTRASEN,
			FACTION_FREETRADE,
			FACTION_XYNERGY,
			FACTION_EXPEDITIONARY,
			FACTION_SAARE,
			FACTION_OTHER
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_POSITRONICS_GENERIC,
		TAG_HOMEWORLD = HOME_SYSTEM_ROOT,
		TAG_FACTION = FACTION_POSITRONICS
	)

	brute_mod =      1.2 //Not quite as durable as an IPC
	burn_mod =       1.6 //Lasers will unmake you

/datum/species/shell/handle_death(var/mob/living/carbon/human/H)
	..()
	if(istype(H.wear_mask,/obj/item/clothing/mask/monitor))
		var/obj/item/clothing/mask/monitor/M = H.wear_mask
		M.monitor_state_index = "blank"
		M.update_icon()

/datum/species/shell/post_organ_rejuvenate(var/obj/item/organ/org, var/mob/living/carbon/human/H)
	var/obj/item/organ/external/E = org
	if(istype(E) && !BP_IS_ROBOTIC(E))
		E.robotize("Zeng Hu Shell Chassis MK3")

/datum/species/shell/get_blood_name()
	return "coolant"

/datum/species/shell/disfigure_msg(var/mob/living/carbon/human/H)
	var/datum/gender/T = gender_datums[H.get_gender()]
	return "<span class='danger'>[T.His] faceplate is dented and ruined!</span>\n"
