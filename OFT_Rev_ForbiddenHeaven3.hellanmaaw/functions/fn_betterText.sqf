oft_fnc_better_text = {
	[] spawn {
		txt5Layer = "txt5" call BIS_fnc_rscLayer;
		txt6Layer = "txt6" call BIS_fnc_rscLayer;
		txt7Layer = "txt7" call BIS_fnc_rscLayer;

		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='2' color='#841313'>" + "FORBIDDEN HEAVEN"+"</t>"; 
		[_texta,/* poz x */ 0,/* poz y */ 0.2,/*durata*/ 5,/* fade in?*/ 1,0,txt5Layer] spawn BIS_fnc_dynamicText;
		
		sleep 7;

		_texta = "<t font ='EtelkaMonospaceProBold' align = 'center' size='2' color='#841313'>" + "Part 3"+"</t>"; 
		[_texta,/* poz x */ 0,/* poz y */ 0.2,/*durata*/ 5,/* fade in?*/ 1,0,txt6Layer] spawn BIS_fnc_dynamicText;
	};
};

publicVariable "oft_fnc_better_text";