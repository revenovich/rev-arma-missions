oft_fnc_better_text = {
	params ["_eventName"];

	txt5Layer = "txt5" call BIS_fnc_rscLayer;
	txt6Layer = "txt6" call BIS_fnc_rscLayer;

	if (_eventName == "intro1") then {
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1.4' color='#F98E05'>" + "MOT CHIEN DICH LICH SU"+"</t>"; 
		[_texta,/* poz x */ 0,/* poz y */ -1,/*durata*/ 3,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;
	};
	if (_eventName == "intro2") then {
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1.4' color='#F98E05'>" + "TUONG NHO CAC ANH HUNG LIET SI"+"</t>"; 
		[_texta,/* poz x */ 0,/* poz y */ -1,/*durata*/ 3,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;
	};
	if (_eventName == "intro3") then {
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1.4' color='#F98E05'>" + "DUOC TAI HIEN BOI 150TH LANGUARD"+"</t>"; 
		[_texta,/* poz x */ 0,/* poz y */ -1,/*durata*/ 7,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;
	};
	if (_eventName == "intro4") then {
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1.4' color='#F98E05'>" + "CHIEN DICH DIEN BIEN PHU"+"</t>"; 
		[_texta,/* poz x */ 0,/* poz y */ -1,/*durata*/ 10,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;
	};
};

publicVariable "oft_fnc_better_text";

oft_fnc_better_text_ex = {
	txt5Layer = "txt5" call BIS_fnc_rscLayer;
	txt6Layer = "txt6" call BIS_fnc_rscLayer;

	_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='1.4' color='#F98E05'>" + "'SAMPLE MISSION TEXT'"+"</t>"; 
	[_texta,/* poz x */ 0,/* poz y */ 0.100,/*durata*/ 10,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;

	txt5aLayer = "txt5a" call BIS_fnc_rscLayer;
	txt6aLayer = "txt6a" call BIS_fnc_rscLayer;

	_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='0.5' color='#Ffffff'>" + "by YouTube Subscriber"+"</t>"; 
	[_texta,/* poz x */ 0,/* poz y */ 0.195,/*durata*/ 7,/* fade in?*/ 1,0,txt5aLayer] spawn BIS_fnc_dynamicText;
};

publicVariable "oft_fnc_better_text_ex";



