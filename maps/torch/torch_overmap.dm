/obj/effect/overmap/visitable/ship/torch
	name = "IFSS Independence"
	desc = "A bluespace-capable corvette bearing markings of an independent star ship."
	fore_dir = WEST
	vessel_mass = 100000
	burn_delay = 2 SECONDS
	sector_flags = OVERMAP_SECTOR_KNOWN|OVERMAP_SECTOR_IN_SPACE|OVERMAP_SECTOR_BASE
	known_ships = list(/obj/effect/overmap/visitable/ship/landable/exploration_shuttle, /obj/effect/overmap/visitable/ship/landable/guppy)
	contact_class = /decl/ship_contact_class/dagon

	initial_restricted_waypoints = list(
		"IFEV Gaunt" = list("nav_hangar_calypso"), 	//can't have random shuttles popping inside the ship
		"IFRP Garuda" = list("nav_hangar_guppy"),
		"IFSC Byakhee" = list("nav_hangar_aquila")
	)

	initial_generic_waypoints = list(
		//start Bridge Deck
		"nav_merc_deck5",
		"nav_ninja_deck5",
		"nav_skipjack_deck5",
		"nav_ert_deck5",
		"nav_bridge_calypso",
		"nav_bridge_guppy",
		"nav_bridge_aquila",

		//start First Deck
		"nav_merc_deck1",
		"nav_ninja_deck1",
		"nav_skipjack_deck1",
		"nav_ert_deck4",
		"nav_deck4_calypso",
		"nav_deck4_guppy",
		"nav_deck4_aquila",

		//start Second Deck
		"nav_merc_deck2",
		"nav_ninja_deck2",
		"nav_skipjack_deck2",
		"nav_ert_deck3",
		"nav_deck3_calypso",
		"nav_deck3_guppy",
		"nav_deck3_aquila",

		//start Third Deck
		"nav_merc_deck3",
		"nav_ninja_deck3",
		"nav_skipjack_deck3",
		"nav_ert_deck2",
		"nav_deck2_calypso",
		"nav_deck2_guppy",
		"nav_deck2_aquila",

		//start Forth Deck
		"nav_merc_deck4",
		"nav_ninja_deck4",
		"nav_skipjack_deck4",
		"nav_ert_deck1",
		"nav_deck1_calypso",
		"nav_deck1_guppy",
		"nav_deck1_aquila",

		//start Hanger Deck
		"nav_merc_hanger",
		"nav_ninja_hanger",
		"nav_skipjack_hanger",
		"nav_ert_hanger",

		"nav_skrellscoutsh_altdock",
		"nav_ert_dock"
	)

/decl/ship_contact_class/dagon
	class_short = "MAKO"
	class_long = "Mako-Class Corvette"
	max_ship_mass = 100000

/obj/effect/overmap/visitable/ship/landable/exploration_shuttle
	name = "IFEV Gaunt"
	desc = "A medium-sized long-range shuttle. It bears markings of the NanoTrasen Surveyor Corps, now scratched and defiled."
	shuttle = "IFEV Gaunt"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	fore_dir = NORTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_SMALL

/obj/effect/overmap/visitable/ship/landable/aquila
	name = "IFSC Byakhee"
	desc = "A vessel escort gunship. It bears markings of the NanoTrasen Surveyor Corps, now scratched off and defiled."
	shuttle = "IFSC Byakhee"
	vessel_mass = 20000
	max_speed = 1/(1 SECONDS)
	burn_delay = 0.5 SECONDS //spammable, but expensive
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL

/obj/effect/overmap/visitable/ship/landable/guppy
	name = "IFRP Garuda"
	desc = "A small recovery pod. It's capable of limited independent space travel. It's marked as 'IFRP Garuda'."
	shuttle = "IFRP Garuda"
	max_speed = 1/(3 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 3000 //very inefficient pod
	fore_dir = SOUTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_TINY

/obj/machinery/computer/shuttle_control/explore/aquila
	name = "Byakhee control console"
	shuttle_tag = "IFSC Byakhee"
	req_access = list(access_aquila_helm)

/obj/machinery/computer/shuttle_control/explore/exploration_shuttle
	name = "shuttle control console"
	shuttle_tag = "IFEV Gaunt"
	req_access = list(access_expedition_shuttle_helm)

/obj/machinery/computer/shuttle_control/explore/guppy
	name = "Garuda control console"
	shuttle_tag = "IFRP Garuda"
	req_access = list(access_guppy_helm)