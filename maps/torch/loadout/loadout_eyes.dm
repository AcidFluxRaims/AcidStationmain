/datum/gear/eyes/eyepatch

/datum/gear/eyes/fashionglasses
	//allowed_branches = CASUAL_BRANCHES

/datum/gear/eyes/sciencegoggles/New()
	//allowed_roles = RESEARCH_ROLES | EXPLORATION_ROLES
	..()

/datum/gear/eyes/security
	allowed_roles = SECURITY_ROLES

/datum/gear/eyes/medical
	allowed_roles = MEDICAL_ROLES

/datum/gear/eyes/meson
	allowed_roles = list(/datum/job/chief_engineer, /datum/job/senior_engineer, /datum/job/engineer, /datum/job/mining, /datum/job/scientist_assistant, /datum/job/pathfinder, /datum/job/explorer, /datum/job/scientist, /datum/job/rd, /datum/job/senior_scientist, /datum/job/bridgeofficer)

/datum/gear/eyes/material
	allowed_roles = list(/datum/job/chief_engineer, /datum/job/senior_engineer, /datum/job/engineer, /datum/job/mining, /datum/job/scientist_assistant)

/datum/gear/eyes/nanaeyes
	display_name = "Upgraded Optical Sensors"
	path = /obj/item/clothing/glasses/nanaeyes
	allowed_roles = COMMAND_ROLES

/datum/gear/eyes/ipclightamp
	display_name = "Light Amplification Module, IPC"
	path = /obj/item/clothing/glasses/ipclightamp
	allowed_roles = EXPLORATION_ROLES