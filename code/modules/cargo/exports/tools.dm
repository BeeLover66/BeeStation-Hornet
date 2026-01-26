/datum/export/singulo //failsafe in case someone decides to ship a live singularity to CentCom without the corresponding bounty
	cost = 1
	unit_name = "singularity"
	export_types = list(
		/obj/anomaly/singularity = TRUE,
	)
	include_subtypes = FALSE

/datum/export/singulo/items_sold(datum/export_report/ex, notes = TRUE)
	. = ..()
	if(. && notes)
		.[1] += " (ERROR: Invalid object detected)"

/datum/export/singulo/tesla //see above
	unit_name = "energy ball"
	export_types = list(
		/obj/anomaly/energy_ball = TRUE,
	)

/datum/export/singulo/tesla/items_sold(datum/export_report/report, notes)
	. = ..()
	if(. && notes)
		.[1] += " (ERROR: Unscheduled energy ball delivery detected)"
