
/datum/gear/uniform
	//allowed_branches = CASUAL_BRANCHES

/datum/gear/uniform/utility
	display_name = "Contractor Utility Uniform"
	path = /obj/item/clothing/under/solgov/utility

/datum/gear/uniform/shortjumpskirt
	//allowed_roles = CASUAL_ROLES

/datum/gear/uniform/blackjumpshorts
	//allowed_roles = CASUAL_ROLES

/datum/gear/uniform/roboticist_skirt
	//allowed_roles = list(/datum/job/roboticist)

/datum/gear/uniform/suit
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/scrubs
	//allowed_roles = STERILE_ROLES
	//allowed_branches = null

/datum/gear/uniform/dress
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/kimono
	display_name = "kimono, colour select"
	path = /obj/item/clothing/under/kimono
	flags = GEAR_HAS_COLOR_SELECTION
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/cheongsam
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/abaya
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/skirt
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/skirt_c
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/skirt_c/dress
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/casual_pants
	//allowed_roles = SEMIFORMAL_ROLES

/datum/gear/uniform/formal_pants
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/formal_pants/custom
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/formal_pants/baggycustom
	//allowed_roles = FORMAL_ROLES

/datum/gear/uniform/shorts
	//allowed_roles = CASUAL_ROLES

/datum/gear/uniform/shorts/custom
	//allowed_roles = CASUAL_ROLES

/datum/gear/uniform/turtleneck
	//allowed_roles = SEMIFORMAL_ROLES

/datum/gear/tactical/tacticool
	//allowed_roles = CASUAL_ROLES

/datum/gear/uniform/sterile
	//allowed_roles = MEDICAL_ROLES

/datum/gear/uniform/hazard
	//allowed_roles = ENGINEERING_ROLES

/datum/gear/uniform/corp_overalls
	//allowed_roles = list(/datum/job/mining, /datum/job/scientist_assistant)

/datum/gear/uniform/corp_flight
	//allowed_roles = list(/datum/job/nt_pilot)

/datum/gear/uniform/corp_exec
	//allowed_roles = list(/datum/job/liaison)

/datum/gear/uniform/corp_exec_jacket
	//allowed_roles = list(/datum/job/liaison, /datum/job/bodyguard)

/datum/gear/uniform/aussie
	display_name = "Australian Fatigues"
	description = "An ancient set of fatigues from a long-lost era."
	path = /obj/item/clothing/under/ozuni

/datum/gear/uniform/latexcorset
	display_name = "Standard Posture-Adjuster"
	description = "This is a normal posture assistant aid."
	path = /obj/item/clothing/under/latexcorset

/datum/gear/uniform/nanadress
	display_name = "N4N4 prototype casual uniform"
	description = "A prototype piece of clothing to replace a gear harness."
	path = /obj/item/clothing/under/nanadress
	allowed_roles = COMMAND_ROLES