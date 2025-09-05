oft_fnc_better_text = {
	params ["_eventName"];

	txt5Layer = "txt5" call BIS_fnc_rscLayer;
	txt6Layer = "txt6" call BIS_fnc_rscLayer;

	if (_eventName == "intro1") then {
		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='2' color='#868686ff'>" + "BROKEN PROTOCOL"+"</t><br/><t color='#ffffff' size='0.5'>When a small leak could cause a new world war</t>"; 
		[_texta,/* poz x */ 0,/* poz y */ 0.2,/*durata*/ 10,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;
	};
};

publicVariable "oft_fnc_better_text";