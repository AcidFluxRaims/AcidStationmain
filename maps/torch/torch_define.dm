/datum/map/torch
	name = "Independence"
	full_name = "IFSS Independence"
	path = "torch"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK

	admin_levels = list(7,8,9)
	empty_levels = list(10)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1,"4"=1,"5"=1,"6"=1,"10"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("independence.if.exp", "independence.sec", "freemail.net", "independence.exp")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "IFSS Independence"
	station_short = "Independence"
	dock_name     = "TBD"
	boss_name     = "Independence Colony"
	boss_short    = "Colony"
	company_name  = "Independent Force"
	company_short = "IF"

	map_admin_faxes = list("Free Space Assistance Department")

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/nanotrasen
	use_overmap = 1
	num_exoplanets = 2

	away_site_budget = 5
	//id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'
	id_hud_icons = 'maps/torch/icons/assignment_hud_boh.dmi'
