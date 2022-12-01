/datum/map
	var/species_to_job_whitelist = list(/datum/species/vox = list(/datum/job/captain, /datum/job/hop, /datum/job/rd, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/hos,
						/datum/job/liaison, /datum/job/bodyguard, /datum/job/representative, /datum/job/sea, /datum/job/sea/marine, /datum/job/psiadvisor,
						/datum/job/bridgeofficer, /datum/job/pathfinder, /datum/job/nt_pilot, /datum/job/explorer,
						/datum/job/senior_engineer, /datum/job/engineer, /datum/job/engineer_trainee,
						/datum/job/officer, /datum/job/warden, /datum/job/detective, /datum/job/seccadet,
						/datum/job/squad_lead, /datum/job/combat_tech, /datum/job/grunt,
						/datum/job/senior_doctor, /datum/job/biomech, /datum/job/doctor, /datum/job/chemist, /datum/job/medical_trainee,
						/datum/job/psychiatrist, /datum/job/chaplain,
						/datum/job/qm, /datum/job/cargo_tech, /datum/job/mining,
						/datum/job/janitor, /datum/job/chef, /datum/job/bartender,
						/datum/job/senior_scientist, /datum/job/scientist, /datum/job/roboticist, /datum/job/scientist_assistant,
						/datum/job/ai, /datum/job/cyborg,
						/datum/job/crew, /datum/job/assistant,
						/datum/job/merchant, /datum/job/symbiote),
	/datum/species/mantid = list(/datum/job/explorer,/datum/job/engineer, /datum/job/engineer_trainee, /datum/job/seccadet,
						/datum/job/grunt, /datum/job/medical_trainee, /datum/job/cargo_tech, /datum/job/mining,
						/datum/job/janitor, /datum/job/chef, /datum/job/bartender, /datum/job/scientist_assistant,
						/datum/job/ai, /datum/job/cyborg,
						/datum/job/crew, /datum/job/assistant,
						/datum/job/merchant, /datum/job/symbiote))
	var/species_to_job_blacklist = list()

	var/job_to_species_whitelist = list()
	var/job_to_species_blacklist = list()

	var/default_assistant_title = "Assistant"

// The white, and blacklist are type specific, any subtypes (of both species and jobs) have to be added explicitly
/datum/map/proc/is_species_job_restricted(var/datum/species/S, var/datum/job/J)
	if(!istype(S) || !istype(J))
		return TRUE

	var/list/whitelist = species_to_job_whitelist[S.type]
	if(whitelist)
		return !(J.type in whitelist)

	whitelist = job_to_species_whitelist[J.type]
	if(whitelist)
		return !(S.type in whitelist)

	var/list/blacklist = species_to_job_blacklist[S.type]
	if(blacklist)
		return (J.type in blacklist)

	blacklist = job_to_species_blacklist[J.type]
	if(blacklist)
		return (S.type in blacklist)

	return FALSE
