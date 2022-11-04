/obj/item/organ/internal/augment/active/polytool/innerweapons
	name = "Integrated Weaponry Suite"
	action_button_name = "Deploy Weapon"
	icon_state = "armcannon"
	desc = "An experimental set of integrated weaponry intended for use by synthetic individuals, though feasibly could be used by those with enough tech implanted into their meatsuits."
	paths = list(
		/obj/item/weapon/gun/projectile/automatic/armcannonsmg,
		/obj/item/weapon/gun/projectile/automatic/armcannonmg,
		/obj/item/weapon/gun/projectile/heavysniper/armcannonsniper,
		/obj/item/weapon/gun/projectile/shotgun/sabotgun/armcannonshotgun,
		///obj/item/weapon/gun/energy/incendiary_laser/armcannonshotgun,
		/obj/item/weapon/gun/energy/laser/infantry/sl/armcannonlaser,
		/obj/item/weapon/gun/energy/sniperrifle/armcannonenergysniper,
		/obj/item/weapon/gun/energy/stunrevolver/rifle/armcannonelec,
		/obj/item/weapon/gun/launcher/rocket/armcannonlauncher
	)

/obj/item/organ/internal/augment/active/polytool/innerweapons/left
	allowed_organs = list(BP_AUGMENT_L_ARM)

/obj/item/organ/internal/augment/active/polytool/innerweapons/right
	allowed_organs = list(BP_AUGMENT_R_ARM)
