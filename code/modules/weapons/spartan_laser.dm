
/obj/item/weapon/gun/energy/spartanlaser
	name = "M6 Grindell/Galilean Nonlinear Rifle"
	desc = "Also known as the spartan laser, this is the most powerful handheld weapon produced by the UNSC. It can disable most vehicles and infantry in a single hit."
	icon = 'code/modules/halo/weapons/icons/Weapon Sprites.dmi'
	icon_state = "spartanlaser"
	item_state = "spartanlaser"
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE

	item_icons = list(
		slot_l_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_left.dmi',
		slot_r_hand_str = 'code/modules/halo/weapons/icons/Weapon_Inhands_right.dmi',
		)

	one_hand_penalty = -1
	self_recharge = 1
	recharge_time = 200
	max_shots = 4
	is_charged_weapon = TRUE

	arm_time = 25 //Deciseconds
	charge_meter = 0
	force = 10
	screen_shake = 0.5
	fire_delay = 12
	scope_zoom_amount = 3
	is_scope_variable = 1
	overheat_capacity = 4
	overheat_fullclear_delay = 40

	fire_sound = null

	origin_tech = list(TECH_COMBAT = 10, TECH_POWER = 20)
	matter = list(DEFAULT_WALL_MATERIAL = 2000)
	projectile_type = /obj/item/projectile/spartanlaser

	hud_bullet_usebar = 1

	burst = 2
	burst_delay = 2.0

	slowdown_general = 0.5

/obj/item/projectile/spartanlaser
	name = "spartan laser"
	icon_state = "heavylaser"
	pass_flags = PASSTABLE | PASSGRILLE
	damage = 60
	shield_damage = 150 //No shields for you
	armor_penetration = 100
	damage_type = BURN
	sharp = 1 //concentrated burns
	hitscan = 1
	step_delay = 0
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	steps_between_delays = 5

	fire_sound = 'code/modules/halo/sounds/Spartan_Laser_Beam_Shot_Sound_Effect.ogg'

	muzzle_type = /obj/effect/projectile/laser_heavy/muzzle
	tracer_type = /obj/effect/projectile/laser_heavy/tracer
	impact_type = /obj/effect/projectile/laser_heavy/impact
