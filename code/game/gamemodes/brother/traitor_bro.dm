/datum/game_mode
	var/list/datum/mind/brothers = list()
	var/list/datum/team/brother_team/brother_teams = list()

/datum/game_mode/traitor/bros
	name = "traitor+brothers"
	config_tag = "traitorbro"
	restricted_jobs = list(JOB_NAME_AI, JOB_NAME_CYBORG)

	announce_span = "danger"
	announce_text = "There are Syndicate agents and Blood Brothers on the station!\n \
	" + span_danger("Traitors") + ": Accomplish your objectives.\n \
	" + span_danger("Blood Brothers") + ": Accomplish your objectives.\n \
	" + span_notice("Crew") + ": Do not let the traitors or brothers succeed!"

	var/list/datum/team/brother_team/pre_brother_teams = list()
	var/const/team_amount = 2 //hard limit on brother teams if scaling is turned off
	var/const/min_team_size = 2
	num_modifier = -4 //Takes out the average number of default traitors to prevent an excessive number of antags at low pops
	traitors_required = FALSE //Only teams are possible

/datum/game_mode/traitor/bros/pre_setup()
	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		restricted_jobs += protected_jobs
	if(CONFIG_GET(flag/protect_assistant_from_antagonist))
		restricted_jobs += JOB_NAME_ASSISTANT
	if(CONFIG_GET(flag/protect_heads_from_antagonist))
		restricted_jobs += SSdepartment.get_jobs_by_dept_id(DEPT_NAME_COMMAND)

	var/list/datum/mind/possible_brothers = get_players_for_role(/datum/antagonist/brother, /datum/role_preference/antagonist/blood_brother)

	var/num_teams = team_amount
	var/bsc = CONFIG_GET(number/brother_scaling_coeff)
	if(bsc)
		num_teams = max(1, round(num_players() / bsc))

	for(var/j = 1 to num_teams)
		if(possible_brothers.len < min_team_size || antag_candidates.len <= required_enemies)
			break
		var/datum/team/brother_team/team = new
		var/team_size = prob(10) ? min(3, possible_brothers.len) : 2
		for(var/k = 1 to team_size)
			var/datum/mind/bro = antag_pick(possible_brothers, /datum/role_preference/antagonist/blood_brother)
			possible_brothers -= bro
			antag_candidates -= bro
			team.add_member(bro)
			bro.special_role = "brother"
			bro.restricted_roles = restricted_jobs
			log_game("[key_name(bro)] has been selected as a Brother")
		pre_brother_teams += team
	. = ..()
	if(.)	//To ensure the game mode is going ahead
		for(var/teams in pre_brother_teams)
			for(var/antag in teams)
				GLOB.pre_setup_antags += antag
	return

/datum/game_mode/traitor/bros/post_setup()
	for(var/datum/team/brother_team/team in pre_brother_teams)
		team.pick_meeting_area()
		team.forge_brother_objectives()
		for(var/datum/mind/M in team.members)
			M.add_antag_datum(/datum/antagonist/brother, team)
			GLOB.pre_setup_antags -= M
		team.update_name()
	brother_teams += pre_brother_teams
	return ..()

/datum/game_mode/traitor/bros/generate_report()
	return "It's Syndicate recruiting season. Be alert for potential Syndicate infiltrators, but also watch out for disgruntled employees trying to defect. Unlike Nanotrasen, the Syndicate prides itself in teamwork and will only recruit pairs that share a brotherly trust."

/datum/game_mode/proc/update_brother_icons_added(datum/mind/brother_mind)
	var/datum/atom_hud/antag/brotherhud = GLOB.huds[ANTAG_HUD_BROTHER]
	brotherhud.join_hud(brother_mind.current)
	set_antag_hud(brother_mind.current, "brother")

/datum/game_mode/proc/update_brother_icons_removed(datum/mind/brother_mind)
	var/datum/atom_hud/antag/brotherhud = GLOB.huds[ANTAG_HUD_BROTHER]
	brotherhud.leave_hud(brother_mind.current)
	set_antag_hud(brother_mind.current, null)
