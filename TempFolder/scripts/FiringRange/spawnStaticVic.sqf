sleep 0.2;

gClient_TG_VehicleSpawnType = 0;
publicVariable "gClient_TG_VehicleSpawnType";

gClient_TG_VehicleSpawnRange = 100;
publicVariable "gClient_TG_VehicleSpawnRange";

gClient_CheckVicType_Fnc = {
	hint ((gSpawnVicTypeStringArray)#gClient_TG_VehicleSpawnType);
	sleep 3;
	hintSilent "";
};
publicVariable "gClient_CheckVicType_Fnc";

_this#0 addAction ["Spawn test fire vehicle!", 
{
	params ["_target", "_caller", "_actionId", "_arguments"];
	private _pTargetPos = getPosATL _target;
	private _pSpawnDistance = gClient_TG_VehicleSpawnRange;
	private _pSpawnVicClassName = selectRandom ((gSpawnVicArray)#gClient_TG_VehicleSpawnType);
	private _pSide = east;
	private _pRotation = 0;
	private _pSpawnedVic = [[_pTargetPos#0 + _pSpawnDistance, _pTargetPos#1, 0], _pRotation, _pSpawnVicClassName, _pSide] call BIS_fnc_spawnVehicle;
	_pSpawnedVic params ["_pVehicle", "_pCrew", "_pGroup"];
	{
		_x disableAI "all";
	} forEach _pCrew;
}, [], 1.5, true, true, "", "true", 5];

_this#0 addAction ["Change spawn type!", {
	if (gClient_TG_VehicleSpawnType == 0 ) then {
		gClient_TG_VehicleSpawnType = 1;
	} else {
		gClient_TG_VehicleSpawnType = 0;
	};
}, [], 1.5, true, true, "", "true", 5];

_this#0 addAction ["Check spawn type!", {
	call gClient_CheckVicType_Fnc;
}, [], 1.5, true, true, "", "true", 5];