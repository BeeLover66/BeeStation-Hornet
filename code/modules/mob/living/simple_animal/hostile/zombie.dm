/mob/living/simple_animal/hostile/zombie
	name = "Shambling Corpse"
	desc = "When there is no more room in hell, the dead will walk in outer space."
	icon = 'icons/mob/simple_human.dmi'
	icon_state = "zombie"
	icon_living = "zombie"
	mob_biotypes = list(MOB_ORGANIC, MOB_HUMANOID)
	speak_chance = 0
	stat_attack = HARD_CRIT //braains
	maxHealth = 100
	health = 100
	melee_damage = 21
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	combat_mode = TRUE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	spacewalk = FALSE
	status_flags = CANPUSH
	del_on_death = TRUE
	var/zombiejob = JOB_NAME_MEDICALDOCTOR
	var/infection_chance = 0
	var/obj/effect/mob_spawn/human/corpse/delayed/corpse
	mobchatspan = "bartender"
	discovery_points = 3000

/mob/living/simple_animal/hostile/zombie/Initialize(mapload)
	. = ..()
	setup_visuals()

/mob/living/simple_animal/hostile/zombie/proc/setup_visuals()
	var/datum/job/job = SSjob.GetJob(zombiejob)

	var/datum/outfit/outfit = new job.outfit
	outfit.l_hand = null
	outfit.r_hand = null

	var/mob/living/carbon/human/dummy/dummy = new
	dummy.equipOutfit(outfit)
	dummy.set_species(/datum/species/zombie)
	COMPILE_OVERLAYS(dummy)
	icon = getFlatIcon(dummy)
	qdel(dummy)

	corpse = new(src)
	corpse.outfit = outfit
	corpse.mob_species = /datum/species/zombie
	corpse.mob_name = name

/mob/living/simple_animal/hostile/zombie/AttackingTarget()
	. = ..()
	if(. && ishuman(target) && prob(infection_chance))
		try_to_zombie_infect(target)

/mob/living/simple_animal/hostile/zombie/drop_loot()
	. = ..()
	corpse.forceMove(drop_location())
	corpse.create()
