/obj/item/organ/internal/augment/active/polytool/innerweaponslight
	name = "Integrated Exploration Equipment"
	action_button_name = "Deploy Weapon or Equipment"
	icon_state = "armcannon"
	desc = "An experimental set of integrated equipment intended for use by synthetic individuals, though feasibly could be used by those with enough tech implanted into their meatsuits."
	paths = list(
		/obj/item/weapon/gun/projectile/automatic/armcannonsmg,
		/obj/item/weapon/material/hatchet/machete,
		/obj/item/weapon/gun/energy/laser/infantry/sl/armcannonlaser,
		/obj/item/weapon/gun/energy/stunrevolver/rifle/armcannonelec
	)

/obj/item/organ/internal/augment/active/polytool/innerweaponslight/left
	allowed_organs = list(BP_AUGMENT_L_ARM)

/obj/item/organ/internal/augment/active/polytool/innerweaponslight/right
	allowed_organs = list(BP_AUGMENT_R_ARM)