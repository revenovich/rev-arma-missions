_pThisUnit = _this#0;

if (["Lead", roleDescription _pThisUnit] call BIS_fnc_inString) then { 
	[_pThisUnit, "PMC_PltLeader"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_SLeader"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Rifleman"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Medic"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Marksman"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Engineer"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_AT_Rifleman"] call BIS_fnc_addRespawnInventory;
};

if (["CO", roleDescription _pThisUnit] call BIS_fnc_inString) then { 
	[_pThisUnit, "PMC_PltLeader"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_SLeader"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Rifleman"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Medic"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Marksman"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Engineer"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_AT_Rifleman"] call BIS_fnc_addRespawnInventory;
};

if (["Medic", roleDescription _pThisUnit] call BIS_fnc_inString) then {
	[_pThisUnit, "PMC_Medic"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Rifleman"] call BIS_fnc_addRespawnInventory;
};

if (["Rifleman", roleDescription _pThisUnit] call BIS_fnc_inString) then {
	[_pThisUnit, "PMC_Rifleman"] call BIS_fnc_addRespawnInventory;
};

if (["AT", roleDescription _pThisUnit] call BIS_fnc_inString) then {
	[_pThisUnit, "PMC_Rifleman"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_AT_Rifleman"] call BIS_fnc_addRespawnInventory;
};

if (["Engineer", roleDescription _pThisUnit] call BIS_fnc_inString) then { 
	[_pThisUnit, "PMC_Rifleman"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Engineer"] call BIS_fnc_addRespawnInventory;
};

if (["Marks", roleDescription _pThisUnit] call BIS_fnc_inString) then {
	[_pThisUnit, "PMC_Rifleman"] call BIS_fnc_addRespawnInventory;
	[_pThisUnit, "PMC_Marksman"] call BIS_fnc_addRespawnInventory;
};

_pThisUnit addMPEventHandler ["MPRespawn", {
	params ["_unit", "_corpse"];
	if ((_unit getVariable ["isAddedAction", false])) then {
		_unit setVariable ["isAddedAction", false];
	};

	if (["p_", str (_unit)] call BIS_fnc_inString) then {
		_unit allowDammage false;
	};

	deleteVehicle _corpse;
}];