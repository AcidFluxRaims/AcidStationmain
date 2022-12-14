/*
 * Defines the helmets, gloves and shoes for rigs.
 */

/obj/item/clothing/head/helmet/space/rig
	name = "helmet"
	item_flags = ITEM_FLAG_THICKMATERIAL
	flags_inv = 		 HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	heat_protection =    HEAD|FACE|EYES
	cold_protection =    HEAD|FACE|EYES
	brightness_on = 0.5
	sprite_sheets = list(
		SPECIES_SKRELL = 'icons/mob/species/skrell/onmob_head_skrell.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_helmet_unathi.dmi',
		SPECIES_OLDUNATHI = 'icons/mob/species/unathi/onmob_head_helmet_unathi.dmi'
		)
	species_restricted = null

/obj/item/clothing/gloves/rig
	name = "gauntlets"
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_AIRTIGHT
	body_parts_covered = HANDS
	heat_protection =    HANDS
	cold_protection =    HANDS
	species_restricted = null
	gender = PLURAL
	var/obj/item/clothing/gloves/storedgloves = null // To store previous gloves like magboots do with shoes
	var/mob/living/carbon/human/storedwearer = null

/obj/item/clothing/gloves/rig/mob_can_equip(mob/user)
	var/mob/living/carbon/human/H = user

	if(H.gloves)
		storedgloves = H.gloves
		if(!H.unEquip(storedgloves, src))//Remove the old gloves
			storedgloves = null
			return 0

	if(!..())
		if(storedgloves) 	//Put the old gloves back in the check fails
			if(H.equip_to_slot_if_possible(storedgloves, slot_gloves))
				src.storedgloves = null
		return 0

	if(storedgloves)
		to_chat(user, "You slip \the [src] on over \the [storedgloves].")
	storedwearer = H
	return 1

/obj/item/clothing/gloves/rig/dropped()
	..()
	if(!storedwearer)
		return

	var/mob/living/carbon/human/H = storedwearer
	if(storedgloves && istype(H))
		if(!H.equip_to_slot_if_possible(storedgloves, slot_gloves))
			storedgloves.dropInto(loc)
		src.storedgloves = null
	storedwearer = null

/obj/item/clothing/shoes/magboots/rig
	name = "boots"
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_AIRTIGHT | ITEM_FLAG_SILENT
	body_parts_covered = FEET
	cold_protection = FEET
	heat_protection = FEET
	species_restricted = null
	gender = PLURAL
	icon_base = null
	var/footstep = 1

/obj/item/clothing/shoes/magboots/rig/handle_movement(var/turf/walking, var/running)
	if(running)
		if(footstep >= 1)
			footstep = 0
			playsound(src, "sound/machines/rigrun.ogg", 20, 1) // this will get annoying very fast.
		else
			footstep++
	else
		if(footstep >= 1)
			footstep = 0
		playsound(src, "sound/machines/rigwalk.ogg", 7, 1)

/obj/item/clothing/suit/space/rig
	name = "chestpiece"
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	// HIDEJUMPSUIT no longer needed, see "hides_uniform" and "update_component_sealed()" in rig.dm
	flags_inv =          HIDETAIL
	item_flags =         ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_AIRTIGHT
	//will reach 10 breach damage after 25 laser carbine blasts, 3 revolver hits, or ~1 PTR hit. Completely immune to smg or sts hits.
	breach_threshold = 38
	resilience = 0.2
	can_breach = 1
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_suit_unathi.dmi'
		)
	var/list/supporting_limbs = list() //If not-null, automatically splints breaks. Checked when removing the suit.

/obj/item/clothing/suit/space/rig/equipped(mob/M)
	check_limb_support(M)
	..()

/obj/item/clothing/suit/space/rig/dropped(var/mob/user)
	check_limb_support(user)
	..()

// Some space suits are equipped with reactive membranes that support broken limbs
/obj/item/clothing/suit/space/rig/proc/can_support(var/mob/living/carbon/human/user)
	if(user.wear_suit != src)
		return 0 //not wearing the suit
	var/obj/item/weapon/rig/rig = user.back
	if(!istype(rig) || rig.offline || rig.canremove)
		return 0 //not wearing a rig control unit or it's offline or unsealed
	return 1

/obj/item/clothing/suit/space/rig/proc/check_limb_support(var/mob/living/carbon/human/user)

	// If this isn't set, then we don't need to care.
	if(!istype(user) || isnull(supporting_limbs))
		return

	if(can_support(user))
		for(var/obj/item/organ/external/E in user.bad_external_organs)
			if((E.body_part & body_parts_covered) && E.is_broken() && E.apply_splint(src))
				to_chat(user, "<span class='notice'>You feel [src] constrict about your [E.name], supporting it.</span>")
				supporting_limbs |= E
	else
		// Otherwise, remove the splints.
		for(var/obj/item/organ/external/E in supporting_limbs)
			if(E.splinted == src && E.remove_splint(src))
				to_chat(user, "<span class='notice'>\The [src] stops supporting your [E.name].</span>")
		supporting_limbs.Cut()

/obj/item/clothing/suit/space/rig/proc/handle_fracture(var/mob/living/carbon/human/user, var/obj/item/organ/external/E)
	if(!istype(user) || isnull(supporting_limbs) || !can_support(user))
		return
	if((E.body_part & body_parts_covered) && E.is_broken() && E.apply_splint(src))
		to_chat(user, "<span class='notice'>You feel [src] constrict about your [E.name], supporting it.</span>")
		supporting_limbs |= E


/obj/item/clothing/gloves/rig/Touch(var/atom/A, var/proximity)

	if(!A || !proximity)
		return 0

	var/mob/living/carbon/human/H = loc
	if(!istype(H) || !H.back)
		return 0

	var/obj/item/weapon/rig/suit = H.back
	if(!suit || !istype(suit) || !suit.installed_modules.len)
		return 0

	for(var/obj/item/rig_module/module in suit.installed_modules)
		if(module.active && module.activates_on_touch)
			if(module.engage(A))
				return 1
	return 0

//Rig pieces for non-spacesuit based rigs

/obj/item/clothing/head/lightrig
	name = "mask"
	body_parts_covered = HEAD|FACE|EYES
	heat_protection =    HEAD|FACE|EYES
	cold_protection =    HEAD|FACE|EYES
	item_flags =         ITEM_FLAG_THICKMATERIAL|ITEM_FLAG_AIRTIGHT

/obj/item/clothing/suit/lightrig
	name = "suit"
	allowed = list(/obj/item/device/flashlight)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv =          HIDEJUMPSUIT
	item_flags =         ITEM_FLAG_THICKMATERIAL

/obj/item/clothing/shoes/lightrig
	name = "boots"
	body_parts_covered = FEET
	cold_protection = FEET
	heat_protection = FEET
	species_restricted = null
	gender = PLURAL

/obj/item/clothing/gloves/lightrig
	name = "gloves"
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HANDS
	heat_protection =    HANDS
	cold_protection =    HANDS
	species_restricted = null
	gender = PLURAL
