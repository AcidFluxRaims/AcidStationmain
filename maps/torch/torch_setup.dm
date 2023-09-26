/datum/map/torch/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/torch/get_map_info()
	. = list()
	. += "Congratulations on your employment, rescue, or refuge aboard the IFSS (Independent Force Star Ship) Independence."
	. += "It is a Mako-class vessel outfitted with somewhat aged medical, science, security, habitation, and leisure facilities. A detachment of marines are also stationed aboard to assist."
	. += ""
	. += "It is a re-commissioned science vessel revamped hastily into a military corvette, and undergoing constant refit to fit the vision of its new operators."
	. += ""
	. += "Capable of responding to deal with most minor insurrectionist threats as well as explore any 'forgotten' planets in these sectors while establishing rapport with locals, a good reputation is utmost in this new era."
	. += ""
	. += "The ship plays host to a considerable variety of individuals, though the assignment is less than glorious. Most, if not all crew are cast-offs of NT and its allies."
	. += ""
	. += "A mission exploring uncharted, forgotten areas of space now free of SolGov and NT, the main objective is survival and success despite the overwhelming odds."
	. += ""
	. += "After being consigned to an ignomious, anonymous death, the crew and core of captains have taken full control of the vessel, no longer bound by SolGov or NT laws or restrictions."
	. += ""
	. += "Adjust your expectations and outlook accordingly, crew. Any allegiances to corporations or SolGov are null and void... and further support will do you no good here."
	return jointext(., "<br>")

/datum/map/torch/send_welcome()
	var/welcome_text = "<center><img src = IFSSIndependencelogo.png /><br /><font size = 3><b>IFSS Independence</b> Sensor Readings:</font><br>"
	welcome_text += "Report generated on [stationdate2text()] at [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Current system:<br /><b>[system_name()]</b><br /><br>"

	var/list/space_things = list()
	var/obj/effect/overmap/visitable/torch = map_sectors["1"]

	welcome_text += "Current Coordinates:<br /><b>[torch.x]:[torch.y]</b><br /><br>"
	welcome_text += "Next system targeted for jump:<br /><b>[generate_system_name()]</b><br /><br>"
	welcome_text += "Travel time to Sol:<br /><b>[rand(25,65)] days</b><br /><br>"
	welcome_text += "Time since last port visit:<br /><b>[rand(1,20)] days</b><br /><hr>"
	welcome_text += "Scan results show the following points of interest:<br />"

	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/visitable/O = map_sectors[zlevel]
		if(O.name == torch.name)
			continue
		if(istype(O, /obj/effect/overmap/visitable/ship/landable)) //Don't show shuttles
			continue
		if (O.hide_from_reports)
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/effect/overmap/visitable/O in space_things)
		var/location_desc = " at present co-ordinates."
		if(O.loc != torch.loc)
			var/bearing = round(90 - Atan2(O.x - torch.x, O.y - torch.y),5) //fucking triangles how do they work
			if(bearing < 0)
				bearing += 360
			location_desc = ", bearing [bearing]."
		if(O.has_distress_beacon)
			LAZYADD(distress_calls, "[O.has_distress_beacon][location_desc]")
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

	if(LAZYLEN(distress_calls))
		welcome_text += "<br><b>Distress calls logged:</b><br>[jointext(distress_calls, "<br>")]<br>"
	else
		welcome_text += "<br>No distress calls logged.<br />"
	welcome_text += "<hr>"

	post_comm_message("IFSS Independence Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
