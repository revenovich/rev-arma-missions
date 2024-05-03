private ["_side", "_groups", "_groupsF"];
private ["_id", "_leaderNetId", "_groupNetId", "_wpx", "_wpy"];

diag_log "[ZOPS] athena hack: gatherGroups init";

//Params
_side  = param[0,""];

//Vars
_groups   = [];
_groupsF  = [];

_group_list = if (missionNamespace getVariable ["ath_all_data", false]) then {
	allGroups;
} else {
	// Don't iterate any groups, will fall back to player's group
	[];
};

//Iterate through all known groups
{
	//Check to see if groups are on player side
	if((side _x) == _side) then {
		_id = groupid _x;
		_leaderNetId = (leader _x) call BIS_fnc_netID;
		_groupNetId = _x call BIS_fnc_netID;
		_wpx = "";
		_wpy = "";

		//Get coordinates of next waypoint
		if((currentWaypoint _x) < (count waypoints _x)) then {
			_wpx = getWPPos[_x, currentWaypoint _x] select 0;
			_wpy = getWPPos[_x, currentWaypoint _x] select 1;
		};

		_groups pushBack _x;
		_groupsF pushBack (format ['{"leaderNetID":"%1","groupNetId":"%2","name":"%3","id":"%4","side":"%5","wpx":"%6","wpy":"%7"}', _leaderNetId, _groupNetId, _x, _id, _side, _wpx, _wpy]);
	};
} forEach _group_list;

if(isNil("_groups") || (count _groups) == 0) then {
	_groups  = [];
	_groupsF = [];

	_group = group player;
	_id = groupid _group;
	_groupNetId = _group call BIS_fnc_netID;
	_leaderNetId = (leader _group) call BIS_fnc_netID;
	if (isNil("_leaderNetId") || _leaderNetId == "") then { _leaderNetId = player call BIS_fnc_netID; };

	_wpx = "";
	_wpy = "";
	if((currentWaypoint _group) < (count waypoints _group)) then {
		_wpx = getWPPos[_group, currentWaypoint _group] select 0;
		_wpy = getWPPos[_group, currentWaypoint _group] select 1;
	};

	_groups pushBack (group player);
	_groupsF pushBack (format ['{"leaderNetID":"%1","groupNetId":"%2","name":"%3","id":"%4","side":"%5","wpx":"%6","wpy":"%7"}', _leaderNetId, _groupNetId, _group, _id, _side, _wpx, _wpy]);
};

[_groups, _groupsF];
