/obj/item/weapon/gun/launcher
	name = "launcher"
	desc = "A device that launches things."
	icon = 'icons/obj/guns/launchers.dmi'
	icon_state = "riotgun"
	w_class = ITEM_SIZE_HUGE
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK

	var/release_force = 0
	var/throw_distance = 10
	var/load_method = SINGLE_CASING|SPEEDLOADER //1 = Single shells, 2 = box or quick loader, 3 = magazine
	var/allowed_magazines
	var/mag_insert_sound = 'sound/weapons/guns/interaction/pistol_magin.ogg'
	var/mag_remove_sound = 'sound/weapons/guns/interaction/pistol_magout.ogg'
	fire_sound_text = "a launcher firing"

//This normally uses a proc on projectiles and our ammo is not strictly speaking a projectile.
/obj/item/weapon/gun/launcher/can_hit(var/mob/living/target as mob, var/mob/living/user as mob)
	return 1

//Override this to avoid a runtime with suicide handling.
/obj/item/weapon/gun/launcher/handle_suicide(mob/living/user)
	to_chat(user, "<span class='warning'>Shooting yourself with \a [src] is pretty tricky. You can't seem to manage it.</span>")
	return

/obj/item/weapon/gun/launcher/proc/update_release_force(obj/item/projectile)
	return 0

/obj/item/weapon/gun/launcher/process_projectile(obj/item/projectile, mob/user, atom/target, var/target_zone, var/params=null, var/pointblank=0, var/reflex=0)
	update_release_force(projectile)
	projectile.dropInto(user.loc)
	projectile.throw_at(target, throw_distance, release_force, user)
	play_fire_sound(src,projectile)
	return 1
