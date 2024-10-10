enableSaving [false, false];	

/*while {true} do 
{
     {
	     if ( side _x == EAST) then 
             {
                     if (_x isKindOf "Man") then
                     {
	     	              _x removeAllEventHandlers "HandleDamage";
		              _x addEventHandler ["HandleDamage",{_damage = (_this select 2)*2; _damage}];
                     };
	     };
     }forEach allUnits;
sleep 300;
};

for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};*/