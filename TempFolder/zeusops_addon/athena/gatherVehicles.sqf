private ["_side", "_vehs", "_vehsF"];
private ["_crew", "_type", "_netid", "_class", "_crewStrings", "_crewNetID", "_crewPosition"];

diag_log "[ZOPS] athena hack: gatherVehicles init";

//Params
_side  = param[0,""];

//Vars
_vehs   = [];
_vehsF  = [];

_vehicle_list = if (missionNamespace getVariable ["ath_all_data", false]) then {
	vehicles;
} else {
	if (!isNull objectParent player) then {
		// If player is in a vehicle, gather data about the vehicle
		[vehicle player];
	} else {
		[];
	};
};

//Iterate through all vehicles
{
	//Check if current vehicle is crewed by units of the specified side
	if((side _x) == _side) then {
		//Get a list of the crew members
		_crew = fullCrew _x;

		//Make sure there are at least 1
		if(count _crew > 0) then {
			_type = typeOf _x;
			_netid = _x call BIS_fnc_netID;

			_class = 1; //car, default
			if (_x isKindOf "tank") then {_class=3;}; //tank
			if (_x isKindOf "tank" && ((configFile >> "cfgVehicles" >> (typeOf _x) >> "transportSoldier") call BIS_fnc_getCfgData) > 6) then {_class=2;}; //apc (an apc may be a tank ... but carries soldiers)
			if (_x isKindOf "helicopter") then {_class=4;}; //chopper
			if (_x isKindOf "plane") then {_class=5;}; //plane
			if (_x isKindOf "uav") then {_class=6;}; //uav (most uavs are planes but not all planes are uavs ... they're probably choppers too now that I think of it)
			if (_x isKindOf "ship") then {_class=7;}; //ship
			if (_x isKindOf "sub") then {_class=8;}; //sub (all subs are ships but not all ships are subs)

			//Compose a delimited string of the crew member details
			_crewStrings = [];
			{
				_crewNetID = (_x select 0) call BIS_fnc_netID;
				_crewPosition = _x select 1;
				_crewStrings pushBack (_crewNetID + ";" + _crewPosition);
			} forEach _crew;

			_vehs pushBack _x;
			_vehsF pushBack (format ['{"netid":"%1","name":"%2","type":"%3","class":"%4","crew":"%5"}', _netid, _x, _type, _class, _crewStrings joinString ","]);
		}
	};
} forEach _vehicle_list;

[_vehs, _vehsF];
