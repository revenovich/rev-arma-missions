params ["_flag"];

_flag forceFlagTexture "vnflag1.paa";

_flag addAction [
	"Get Flag",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		_target setFlagOwner _caller;

		waitUntil {(flagOwner _target) isEqualTo _caller};
		flag _caller setFlagTexture "vnflag1.paa";
		_caller setVariable ["carryingFlag", true, true];
		_caller setVariable ["flag", _target, true];
		_target setPosATL [0,0,0];
	},
	[_flag],
	6,
	false,
	true,
	"",
	"!(_this getVariable ['carryingFlag', false])",
	5
];