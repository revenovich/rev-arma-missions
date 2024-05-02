sleep 0.2;

gClient_ChangeSpawnRange = {
	params ["_toChangeRange"];
	gClient_TG_VehicleSpawnRange = gClient_TG_VehicleSpawnRange + _toChangeRange;
	if (gClient_TG_VehicleSpawnRange < 10) then {
		gClient_TG_VehicleSpawnRange = 10;
	};
	hint format ["Spawn range is %1 meters", gClient_TG_VehicleSpawnRange];
	sleep 3;
	hintSilent "";
};
publicVariable "gClient_ChangeSpawnRange";

gClient_CheckSpawnRange = {
	hint format ["Spawn range is %1 meters", gClient_TG_VehicleSpawnRange];
	sleep 3;
	hintSilent "";
};
publicVariable "gClient_CheckSpawnRange";

_this#0 addAction ["Check spawn range!", {
	call gClient_CheckSpawnRange;
}, [], 1.5, true, true, "", "true", 5];

_pNumberOfRange_Array = [1, 5, 10, 100, -1, -5, -10, -100];

publicVariable "gClient_TitleName_ChangeRangeAction1";
publicVariable "gClient_TitleName_ChangeRangeAction2";
publicVariable "gClient_TitleName_ChangeRangeAction3";

{
	// Current result is saved in variable _x
	if (_x < 0) then {
		gClient_TitleName_ChangeRangeAction1 = "Decrease range";
		gClient_TitleName_ChangeRangeAction2 = "-";
		gClient_TitleName_ChangeRangeAction3 = abs _x;
	} else {
		gClient_TitleName_ChangeRangeAction1 = "Increase range";
		gClient_TitleName_ChangeRangeAction2 = "+";
		gClient_TitleName_ChangeRangeAction3 = abs _x;
	};

	_this#0 addAction [format ["%1 %2 %3!", gClient_TitleName_ChangeRangeAction1, gClient_TitleName_ChangeRangeAction2, gClient_TitleName_ChangeRangeAction3], {
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_arguments#0] call gClient_ChangeSpawnRange;
	}, [_x], 1.5, true, true, "", "true", 5];

} forEach _pNumberOfRange_Array;