/obj/item/implant/weapons_auth
	name = "firearms authentication implant"
	desc = "Lets you shoot your guns."
	icon_state = "auth"
	actions_types = null

/obj/item/implant/weapons_auth/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Firearms Authentication Implant<BR>
				<b>Life:</b> 4 hours after death of host<BR>
				<b>Implant Details:</b> <BR>
				<b>Function:</b> Allows operation of implant-locked weaponry, preventing equipment from falling into enemy hands."}
	return dat


/obj/item/implant/adrenalin
	name = "adrenal implant"
	desc = "Removes all stuns."
	icon_state = "adrenal"
	uses = 3

/obj/item/implant/adrenalin/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Cybersun Industries Adrenaline Implant<BR>
				<b>Life:</b> Five days.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Subjects injected with implant can activate an injection of medical cocktails.<BR>
				<b>Function:</b> Removes stuns, increases speed, and has a mild healing effect.<BR>
				<b>Integrity:</b> Implant can only be used three times before reserves are depleted."}
	return dat

/obj/item/implant/adrenalin/activate()
	. = ..()
	uses--
	to_chat(imp_in, span_notice("You feel a sudden surge of energy!"))
	imp_in.SetStun(0)
	imp_in.SetKnockdown(0)
	imp_in.SetUnconscious(0)
	imp_in.SetParalyzed(0)
	imp_in.SetImmobilized(0)
	imp_in.adjustStaminaLoss(-200)
	imp_in.set_resting(FALSE)

	imp_in.reagents.add_reagent(/datum/reagent/medicine/synaptizine, 10)
	imp_in.reagents.add_reagent(/datum/reagent/medicine/omnizine, 10)
	imp_in.reagents.add_reagent(/datum/reagent/medicine/amphetamine, 10)
	if(!uses)
		qdel(src)

/obj/item/implanter/adrenalin
	name = "implanter (adrenalin)"
	imp_type = /obj/item/implant/adrenalin


/obj/item/implant/emp
	name = "emp implant"
	desc = "Triggers an EMP."
	icon_state = "emp"
	uses = 3

/obj/item/implant/emp/activate()
	. = ..()
	uses--
	empulse(imp_in, 3, 5)
	if(!uses)
		qdel(src)

/obj/item/implanter/emp
	name = "implanter (EMP)"
	imp_type = /obj/item/implant/emp


//Health Tracker Implant

/obj/item/implant/health
	name = "health implant"
	actions_types = null
	var/healthstring = ""
	var/list/raw_data = list()

/obj/item/implant/health/proc/sensehealth(get_list = FALSE)
	if (!imp_in)
		return "ERROR"
	else
		if(isliving(imp_in))
			var/mob/living/L = imp_in
			healthstring = "<small>Oxygen Deprivation Damage => [round(L.getOxyLoss())]<br />Fire Damage => [round(L.getFireLoss())]<br />Toxin Damage => [round(L.getToxLoss())]<br />Brute Force Damage => [round(L.getBruteLoss())]</small>"
			raw_data = list() //Reset list
			raw_data["oxy"] = list("[round(L.getOxyLoss())]")		//Suffocation
			raw_data["burn"] = list("[round(L.getFireLoss())]")		//Burn
			raw_data["tox"] = list("[round(L.getToxLoss())]")		//Tox
			raw_data["brute"] = list("[round(L.getBruteLoss())]")	//Brute
		if(!healthstring)											//I have no idea who made it go this order but okay.
			healthstring = "ERROR"
		if(!length(raw_data))
			raw_data = list("ERROR")
		if(!get_list)
			return healthstring
		else
			return raw_data

/obj/item/implant/radio
	name = "internal radio implant"
	actions_types = null
	var/obj/item/radio/radio
	var/radio_key
	var/subspace_transmission = FALSE
	var/radio_silent = TRUE
	icon = 'icons/obj/radio.dmi'
	icon_state = "walkietalkie"

/obj/item/implant/radio/activate()
	. = ..()
	// needs to be GLOB.deep_inventory_state otherwise it won't open
	radio.ui_interact(usr, state = GLOB.deep_inventory_state)

/obj/item/implant/radio/Initialize(mapload)
	. = ..()

	radio = new(src)
	// almost like an internal headset, but without the
	// "must be in ears to hear" restriction.
	radio.name = "internal radio"
	radio.subspace_transmission = subspace_transmission
	radio.canhear_range = -1
	radio.radio_silent = radio_silent
	if(radio_key)
		radio.keyslot = new radio_key
	radio.recalculateChannels()

/obj/item/implant/radio/Destroy()
	QDEL_NULL(radio)
	return ..()

/obj/item/implant/radio/mining
	radio_key = /obj/item/encryptionkey/headset_cargo

/obj/item/implant/radio/syndicate
	desc = "Are you there God? It's me, Syndicate Comms Agent."
	radio_key = /obj/item/encryptionkey/syndicate
	subspace_transmission = TRUE

/obj/item/implant/radio/slime
	name = "slime radio"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "adamantine_resonator"
	radio_key = /obj/item/encryptionkey/headset_sci
	subspace_transmission = TRUE

/obj/item/implant/radio/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Internal Radio Implant<BR>
				<b>Life:</b> 24 hours<BR>
				<b>Implant Details:</b> Allows user to use an internal radio, useful if user expects equipment loss, or cannot equip conventional radios."}
	return dat

/obj/item/implanter/radio
	name = "implanter (internal radio)"
	imp_type = /obj/item/implant/radio

/obj/item/implanter/radio/syndicate
	name = "implanter (internal syndicate radio)"
	imp_type = /obj/item/implant/radio/syndicate
