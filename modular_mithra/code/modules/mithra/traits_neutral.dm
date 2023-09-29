/*
		All neutral traits go here. They are automagically sorted based off their cost, but seperating em this way is easier to search through.
*/

/datum/trait/glowing_eyes
	name = "Glowing Eyes"
	desc = "Your eyes glow in the dark."	//MY VISION IS AUGMENTED

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		for(var/obj/item/organ/external/head/O in H.organs)
			O.glowing_eyes = TRUE

/datum/trait/cold_blooded
	name = "Ectothermy"
	desc = "You have diminished means of internal thermoregulation, forcing you to rely on external heat to stay alive."
	var_changes = list("body_temperature" = 285, "cold_discomfort_level" = 292)
	excludes = list(/datum/trait/hot_blooded)

/datum/trait/hot_blooded
	name = "Hot-blooded"
	desc = "Your body is capable of more vigourous endothermoregulation, causing your average body temperature to be higher than normal."
	var_changes = list("body_temperature" = 320, "heat_discomfort_level" = 350)
	excludes = list(/datum/trait/cold_blooded)

/datum/trait/nitrogen_breath
	name = "Nitrogenous Spirometry"
	desc = "Your metabolic processes causes you to exhale nitrogen rather than carbon dioxide."
	var_changes = list("exhale_type" = "nitrogen")

/datum/trait/nitrogen_breath
	name = "Oxygenous Spirometry"
	desc = "Your metabolic processes causes you to exhale oxygen rather than carbon dioxide."
	var_changes = list("exhale_type" = "oxygen")

/datum/trait/fast_meta
	name = "Faster Metabolism"
	desc = "Your metabolism rate is absurdly high, causing you to get hungry and process chemicals at roughly three times the normal rate."
	var_changes = list("hunger_factor" = DEFAULT_HUNGER_FACTOR * 3.0, "metabolism_mod" = 3.0)
	excludes = list(/datum/trait/slow_meta)

/datum/trait/slow_meta
	name = "Slower Metabolism"
	desc = "Your metabolism rate is absurdly low, causing you to get hungry and process chemicals at half the normal rate."
	var_changes = list("hunger_factor" = DEFAULT_HUNGER_FACTOR * 0.5, "metabolism_mod" = 0.5)
	excludes = list(/datum/trait/fast_meta)

/datum/trait/carnivore
	name = "Carnivore"
	desc = "For one reason or another, you're only capable of eating meat. Vegetables won't kill you, but they won't help you either."
	var_changes = list(reagent_tag = IS_CARNIVORE)

/datum/trait/herbivore
	name = "Herbivore"
	desc = "You're only able to eat plants. Eating meat and other animal protein will poison you."
	var_changes = list(reagent_tag = IS_HERBIVORE)

/datum/trait/melee_attack
	name = "Rending Claws"
	desc = "You have claws. You use them in unarmed combat."
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp))

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		for(var/u_type in S.unarmed_types)
			S.unarmed_attacks += new u_type()

/datum/trait/tailattack
	name = "Powerful Tail"
	desc = "You have a tail that is substantial enough to be used as an improvised weapon."
	var_changes = list("unarmed_types" = list(/datum/unarmed_attack/tail))

	apply(var/datum/species/S,var/mob/living/carbon/human/H)
		..(S,H)
		for(var/u_type in S.unarmed_types)
			S.unarmed_attacks += new u_type()

/datum/trait/glasscannon
	name = "Adrenaline Boost"
	desc = "Your natural strength is boosted, though your propensity to take damage more easily is as well."
	var_changes = list(strength = STR_VHIGH)

/datum/trait/speedy
	name = "Runner"
	desc = "Your natural movement speed is boosted, but you'll find you tire more quickly."
	var_changes = list(slowdown = -1.25)

/datum/trait/fullofblood
	name = "Vital"
	desc = "You have a lot of blood circulating in your body naturally, moreso than average."
	var_changes = list(blood_volume = 1200)



