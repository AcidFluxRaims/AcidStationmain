
//Hand Cannon

/obj/item/weapon/gun/projectile/heavysniper/handgonne
	name = "Handgonne"
	desc = "A very rare sidearm made for some kind of big game hunting. Takes 14.5mm rounds."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "handcannon"
	item_state = "handgonne"
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	caliber = "14.5mmtracerless"
	screen_shake = 1 //extra kickback
	max_shells = 3
	one_hand_penalty = 0
	w_class = ITEM_SIZE_NORMAL
	accuracy = 1

	wielded_item_state = "handgonne"
	hud_bullet_row_num = 3
	hud_bullet_reffile = 'code/modules/halo/icons/hud_display/hud_bullet_7x8.dmi'
	hud_bullet_iconstate = "bigpistol"

	scope_zoom_amount = 0
	min_zoom_amount = 0
	is_scope_variable = 0

	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)
