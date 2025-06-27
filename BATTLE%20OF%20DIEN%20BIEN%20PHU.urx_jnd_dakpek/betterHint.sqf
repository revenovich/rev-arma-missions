oft_fnc_better_hint = {
	params ["_eventName"];

	if (_eventName == "p1e1") then {
		hint parseText "<br/>The French artillery ammo bunker at Him Lam hill is hit by a shell and explodes.<br/><img size = '7' image='hintPics\Picture1.jpg'/>";
	};
	if (_eventName == "p1e2") then {
		hint parseText "<br/>Paul Pégot, the commander of the 3rd Battalion at Him Lam hill, is hit by artillery fire. Radio is destroyed. Him Lam hill lost contact with French central subdivision.<br/><img size = '7' image='hintPics\Picture2.jpg'/>";
	};
	if (_eventName == "p1e3") then {
		hint parseText "<br/>312nd Division captured Him Lam hill!.<br/><img size = '7' image='hintPics\Picture3.jpg'/>";
	};
	if (_eventName == "p2e1") then {
		hint parseText "<br/>165th Regiment and 88th Regiment captured Doc Lap Hill!<br/><img size = '7' image='hintPics\Picture3.jpg'/>";
	};
	if (_eventName == "p2e2") then {
		hint parseText "<br/>Charles Piroth, French artillery commander, committed suicide with a grenade in his command bunker.<br/><img size = '7' image='hintPics\Picture4.jpg'/>";
	};
	if (_eventName == "p2e3") then {
		hint parseText "<br/>French troops fled from Ban Keo hill. 36th Regiment captured Ban Keo hill without shooting a single bullet.<br/><img size = '7' image='hintPics\Picture5.jpg'/>";
	};
	if (_eventName == "p2e4") then {
		hint parseText "<br/>America denies participating in the war with air and ground forces.<br/><img size = '7' image='hintPics\Picture6.jpg'/>";
	};
	if (_eventName == "p3e1") then {
		hint parseText "<br/>312nd Division captured A1 hill.<br/><img size = '7' image='hintPics\Picture3.jpg'/>";
	};
	if (_eventName == "p3e2") then {
		hint parseText "<br/>The French army will announce its surrender at 17h30 May 7 1954.<br/><img size = '7' image='hintPics\Picture7.jpg'/>";
	};
	if (_eventName == "p3e3") then {
		hint parseText "<br/>The French army will announce its surrender at 17h30 May 7 1954<br/><img size = '7' image='hintPics\Picture8.jpg'/>";
	};
};

publicVariable "oft_fnc_better_hint";