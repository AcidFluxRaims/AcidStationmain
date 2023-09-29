
/obj/item/weapon/material/knife/combat_knife
	name = "\improper combat knife"
	desc = "Multipurpose knife for utility use and close quarters combat"
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "Knife"
	item_state = "butterflyknife_open"
	w_class = ITEM_SIZE_SMALL
	sharp = 1
	edge = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	armor_penetration = 70
	unacidable = 1

	force_divisor = 0.5
	thrown_force_divisor = 0.5

	cloak_disrupt = 0

	melee_strikes = list(/datum/melee_strike/precise_strike/fast_attacks,/datum/melee_strike/swipe_strike/harrying_strike)

	executions_allowed = TRUE
	start_execute_messages = list(BP_CHEST = "\The USER steps on \the VICTIM and brandishes \the WEAPON!", BP_HEAD = "\The USER grips \the VICTIM's shoulder and brandishes \the WEAPON!")
	finish_execute_messages = list(BP_CHEST = "\The USER guts VICTIM with \the WEAPON!", BP_HEAD = "\The USER slices clean through \the VICTIM's neck with \the WEAPON!")

/obj/item/weapon/material/machete
	name = "\improper pattern-2 composite sword"
	desc = "A standard issue machete used for hacking things apart. It is very sharp "
	icon= 'code/modules/halo/weapons/icons/machete.dmi'
	icon_state = "machete_obj"
	item_state = "machete"
	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)
	armor_penetration = 50


	w_class = ITEM_SIZE_LARGE
	force_divisor = 0.83
	thrown_force_divisor = 0.83
	slot_flags = SLOT_BELT | SLOT_BACK
	sharp = 1
	edge = 1
	unbreakable = 1
	attack_verb = list("chopped", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	unacidable = 1
	lunge_dist = 2

	melee_strikes = list(/datum/melee_strike/swipe_strike/mixed_combo,/datum/melee_strike/swipe_strike/sword_slashes)

	executions_allowed = TRUE
	start_execute_messages = list(BP_CHEST = "\The USER steps on \the VICTIM and brandishes \the WEAPON!", BP_HEAD = "\The USER grips \the VICTIM's shoulder and brandishes \the WEAPON!")
	finish_execute_messages = list(BP_CHEST = "\The USER guts VICTIM with \the WEAPON!", BP_HEAD = "\The USER slices clean through \the VICTIM's neck with \the WEAPON!")

/obj/item/weapon/material/machete/officersword
	name = "Officer's Sword"
	desc = "A reinforced sword. Lighter than it looks, allowing for longer range lunges."
	icon_state = "COsword_obj"
	item_state = "officer-sword"
	slot_flags = SLOT_BELT | SLOT_BACK
	attack_verb = list("sliced", "torn", "cut", "riposted", "carved", "diced")
	unacidable = 1
	armor_penetration = 70
	applies_material_colour = FALSE
	lunge_dist = 3

//Humbler Baton
/obj/item/weapon/melee/baton/humbler
	name = "humbler stun device"
	desc = "A retractable baton capable of inducing a large amount of pain via electrical shocks."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "humbler stun device"
	item_state = "telebaton_0"
	force = 15
	sharp = 0
	edge = 0
	throwforce = 7
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("beaten")
	stunforce = 0
	agonyforce = 60
	status = 0		//whether the thing is on or not
	hitcost = 10

	melee_strikes = list(/datum/melee_strike/precise_strike)



/obj/item/weapon/melee/baton/humbler/New()
	. = ..()
	bcell = new/obj/item/weapon/cell/high(src)
	update_icon()
	return