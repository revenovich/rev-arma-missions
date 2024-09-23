/*
	Flag Interact for Arma 3
	
	Author: Matthew Warner (Warnerm14)
	Site: www.twitter.com/Warnerm14
			
	Permission: 
		You may use the FlagInteract.pbo on your server without receiving permission from the Author.
		You may redistribute the FlagInteract.pbo as long as you give proper credit to the Author.
		You may not remove any code from the FlagInteract.pbo to use in your own mods/mission/projects without permission from the Author.
		You may repack the FlagInteract.pbo with edits made to the code as long as you do not modify the comment blocks.
		
	File Desc: This file is ran on player init via postInit, it sets up variable and add actions.
*/


[] spawn {
	waitUntil {!(isNull player) && ((vehicle player) isEqualTo player) && !(isNull (findDisplay 46))};
	uiSleep 2;
	
	flagTarget = objNull;
	flagArray = [];

	player setVariable ["canInteractWithFlags",true,true];
	_interactDistance = 3;

	_vanillaFlags = ["Flag_AAF_F","Flag_AltisColonial_F","Flag_Altis_F","Flag_ARMEX_F","Flag_BI_F","Flag_Blue_F","Flag_Blueking_F","Flag_Blueking_inverted_F","Flag_Burstkoke_F","Flag_Burstkoke_inverted_F","Flag_CSAT_F","Flag_CTRG_F","Flag_FD_Blue_F","Flag_FD_Green_F","Flag_FD_Orange_F","Flag_FD_Purple_F","Flag_FD_Red_F","Flag_FIA_F","Flag_Fuel_F","Flag_Fuel_inverted_F","Flag_Gendarmerie_F","Flag_Green_F","Flag_HorizonIslands_F","Flag_IDAP_F","Flag_ION_F","Flag_Larkin_F","Flag_EAF_F","Flag_Enoch_F","Flag_NATO_F","Flag_POWMIA_F","Flag_Quontrol_F","Flag_RedCrystal_F","Flag_Red_F","Flag_Redburger_F","Flag_Redstone_F","Flag_Suatmm_F","Flag_Syndikat_F","Flag_UK_F","Flag_UNO_F","Flag_US_F","Flag_Viper_F","Flag_Vrana_F","Flag_White_F"];
	_globMobFlags = ["gm_flag_BU","gm_flag_CA","gm_flag_CS","gm_flag_DK","gm_flag_GC","gm_flag_FI","gm_flag_HU","gm_flag_IC","gm_flag_IT","gm_flag_LU","gm_flag_NL","gm_flag_NO","gm_flag_PL","gm_flag_PO","gm_flag_RO","gm_flag_SP","gm_flag_SE","gm_flag_TU","gm_flag_UR","gm_flag_GE"];
	_cupFlags = ["FlagCarrierArmex_EP1","FlagCarrierBIS_EP1","FlagCarrierBLUFOR_EP1","FlagCarrierCDFEnsign_EP1","FlagCarrierINS","FlagCarrierCDF_EP1","FlagCarrierCDF","FlagCarrierCzechRepublic_EP1","FlagCarrierGermany_EP1","FlagCarrierBAF","FlagCarrierINDFOR_EP1","FlagCarrierTakistanKingdom_EP1","FlagCarrierGUE","FlagCarrierNATO_EP1","FlagCarrierOPFOR_EP1","FlagCarrierPOWMIA_EP1","FlagCarrierSouth","FlagCarrierRedCrescent_EP1","FlagCarrierRedCross_EP1","FlagCarrierRedCrystal_EP1","FlagCarrierRU","FlagCarrierNorth","FlagCarrierTakistan_EP1","FlagCarrierTFKnight_EP1","FlagCarrierTKMilitia_EP1","FlagCarrierUNO_EP1","FlagCarrierUSArmy_EP1","FlagCarrierWest","FlagCarrierUSA","FlagCarrierUSA_EP1","FlagCarrierWhite_EP1"];
	_euFlags = ["KPFS_Flag_Albania","KPFS_Flag_Belarus","KPFS_Flag_Belgium","KPFS_Flag_Bosnia","KPFS_Flag_Bulgaria","KPFS_Flag_Bel_SSR","KPFS_Flag_Croatia","KPFS_Flag_CSSR","KPFS_Flag_OVKS","KPFS_Flag_Czech","KPFS_Flag_denmark","KPFS_Flag_Estonia","KPFS_Flag_Est_SSR","KPFS_Flag_EG","KPFS_Flag_EU","KPFS_Flag_Finland","KPFS_Flag_France","KPFS_Flag_Greece","KPFS_Flag_Hungary","KPFS_Flag_Ireland","KPFS_Flag_Italy","KPFS_Flag_Kosovo","KPFS_Flag_Latvia","KPFS_Flag_Lat_SSR","KPFS_Flag_Lithuania","KPFS_Flag_Lit_SSR","KPFS_Flag_Luxemburg","KPFS_Flag_Mazedonia","KPFS_Flag_Moldavia","KPFS_Flag_Mol_SSR","KPFS_Flag_Montenegro","KPFS_Flag_Netherlands","KPFS_Flag_Norway","KPFS_Flag_Poland","KPFS_Flag_portugal","KPFS_Flag_PR_Albania","KPFS_Flag_PR_Bulgaria","KPFS_Flag_PR_Poland","KPFS_Flag_PR_Romania","KPFS_Flag_Romania","KPFS_Flag_Russia","KPFS_Flag_Rus_SSR","KPFS_Flag_Serbia","KPFS_Flag_Slovakia","KPFS_Flag_Slovenia","KPFS_Flag_USSR","KPFS_Flag_Spain","KPFS_Flag_Sweden","KPFS_Flag_Turkey","KPFS_Flag_Ukraine","KPFS_Flag_Ukr_SSR","KPFS_Flag_WP","KPFS_Flag_YUG"];
	_undersiegeFlags = ["USP_FLAG_AFGHANISTAN","USP_FLAG_AFRICAN_UNION","USP_FLAG_ALBANIA","USP_FLAG_ALGERIA","USP_FLAG_ANDORRA","USP_FLAG_ANGOLA","USP_FLAG_ANTIGUA_BARBUDA","USP_FLAG_ARABIC_UNION","USP_FLAG_ARGENTINA","USP_FLAG_ARMENIA","USP_FLAG_ASIAN_UNION","USP_FLAG_AUSTRALIA","USP_FLAG_AUSTRIA","USP_FLAG_AZERBAIJAN","USP_FLAG_BANGLADESH","USP_FLAG_BARBADOS","USP_FLAG_BELARUS","USP_FLAG_BELGIUM","USP_FLAG_BELIZE","USP_FLAG_BENIN","USP_FLAG_BHUTAN","USP_FLAG_BOLIVIA","USP_FLAG_BOSNIA_HERZEGOVINA","USP_FLAG_BOTSWANA","USP_FLAG_BRAZIL","USP_FLAG_BRUNEI","USP_FLAG_BULGARIA","USP_FLAG_BURKINA_FASO","USP_FLAG_BURUNDI","USP_FLAG_CAMBODIA","USP_FLAG_CAMEROON","USP_FLAG_CANADA","USP_FLAG_CAPE_VERDE","USP_FLAG_CENTRAL_AFRICA","USP_FLAG_CHAD","USP_FLAG_CHILE","USP_FLAG_CHINA","USP_FLAG_COLOMBIA","USP_FLAG_COMOROS","USP_FLAG_COSTA_RICA","USP_FLAG_COTE_DIVOIRE","USP_FLAG_CROATIA","USP_FLAG_CUBA","USP_FLAG_CZECH_REPUBLIC","USP_FLAG_DEMOCRATIC_CONGO","USP_FLAG_DENMARK","USP_FLAG_DJIBOUTI","USP_FLAG_DOMINICA","USP_FLAG_DOMINICAN_REPUBLIC","USP_FLAG_EAST_TIMOR","USP_FLAG_ECUADOR","USP_FLAG_EGYPT","USP_FLAG_EL_SALVADOR","USP_FLAG_EQUATORIAL_GUINEA","USP_FLAG_ERITREA","USP_FLAG_ESTONIA","USP_FLAG_ETHIOPIA","USP_FLAG_EUROPEAN_UNION","USP_FLAG_FEDERATED_MICRONESIA","USP_FLAG_FIJI","USP_FLAG_FINLAND","USP_FLAG_FRANCE","USP_FLAG_GABON","USP_FLAG_GEORGIA_REPUBLIC","USP_FLAG_GERMANY","USP_FLAG_GHANA","USP_FLAG_GREECE","USP_FLAG_GREENLAND","USP_FLAG_GRENADA","USP_FLAG_GUADELOUPE","USP_FLAG_GUATEMALA","USP_FLAG_GUINEA","USP_FLAG_GUINEA_BISSAU","USP_FLAG_GUYANA","USP_FLAG_HAITI","USP_FLAG_HONDURAS","USP_FLAG_HUNGARY","USP_FLAG_ICELAND","USP_FLAG_INDEPENDENT_SAMOA","USP_FLAG_INDIA","USP_FLAG_INDONESIA","USP_FLAG_IRAN","USP_FLAG_IRAQ","USP_FLAG_IRELAND","USP_FLAG_ISRAEL","USP_FLAG_ITALY","USP_FLAG_JAMAICA","USP_FLAG_JAPAN","USP_FLAG_JORDAN","USP_FLAG_KAZAKHSTAN","USP_FLAG_KENYA","USP_FLAG_KINGDOM_BAHRAIN","USP_FLAG_KINGDOM_TONGA","USP_FLAG_KUWAIT","USP_FLAG_KYRGYZSTAN","USP_FLAG_LAOS","USP_FLAG_LATVIA","USP_FLAG_LEBANON","USP_FLAG_LESOTHO","USP_FLAG_LIBERIA","USP_FLAG_LIBYA","USP_FLAG_LIECHTENSTEIN","USP_FLAG_LITHUANIA","USP_FLAG_LUXEMBOURG","USP_FLAG_MACEDONIA","USP_FLAG_MADAGASCAR","USP_FLAG_MALAWI","USP_FLAG_MALAYSIA","USP_FLAG_MALDIVES","USP_FLAG_MALI","USP_FLAG_MARSHALL_ISLANDS","USP_FLAG_MAURITANIA","USP_FLAG_MAURITIUS","USP_FLAG_MEXICO","USP_FLAG_MOLDOVA","USP_FLAG_MONACO","USP_FLAG_MONGOLIA","USP_FLAG_MONTENEGRO","USP_FLAG_MOROCCO","USP_FLAG_MOZAMBIQUE","USP_FLAG_MYANMAR","USP_FLAG_NAGORNO_KARABAKH_REPUBLIC","USP_FLAG_NAMIBIA","USP_FLAG_NATO","USP_FLAG_NEPAL","USP_FLAG_NETHERLANDS","USP_FLAG_NEW_ZEALAND","USP_FLAG_NICARAGUA","USP_FLAG_NIGER","USP_FLAG_NIGERIA","USP_FLAG_NORTH_AMERICAN_UNION","USP_FLAG_NORTH_KOREA","USP_FLAG_NORWAY","USP_FLAG_OMAN","USP_FLAG_PAKISTAN","USP_FLAG_PANAMA","USP_FLAG_PAPUA_NEW_GUINEA","USP_FLAG_PARAGUAY","USP_FLAG_PERU","USP_FLAG_PHILIPPINES","USP_FLAG_POLAND","USP_FLAG_PORTUGAL","USP_FLAG_QATAR","USP_FLAG_REPUBLIC_ABKHAZIA","USP_FLAG_REPUBLIC_CYPRUS","USP_FLAG_REPUBLIC_KIRIBATI","USP_FLAG_REPUBLIC_KOSOVO","USP_FLAG_REPUBLIC_MALTA","USP_FLAG_REPUBLIC_NAURU","USP_FLAG_REPUBLIC_PALAU","USP_FLAG_REPUBLIC_SAN_MARINO","USP_FLAG_REPUBLIC_SERBIA","USP_FLAG_REPUBLIC_SOUTH_OSSETIA","USP_FLAG_REPUBLIC_CONGO","USP_FLAG_REPUBLIC_TRANSNISTRIA","USP_FLAG_ROMANIA","USP_FLAG_RUSSIA","USP_FLAG_RWANDA","USP_FLAG_SAINT_KITTS_NEVIS","USP_FLAG_SAINT_LUCIA","USP_FLAG_SAINT_VINCENT_GRENADINES","USP_FLAG_SAO_TOME","USP_FLAG_SAUDI_ARABIA","USP_FLAG_SENEGAL","USP_FLAG_SEYCHELLES","USP_FLAG_SIERRA_LEONE","USP_FLAG_SINGAPORE","USP_FLAG_SLOVAKIA","USP_FLAG_SLOVENIA","USP_FLAG_SOLOMON_ISLANDS","USP_FLAG_SOMALIA","USP_FLAG_SOUTH_AFRICA","USP_FLAG_SOUTH_AMERICAN_UNION","USP_FLAG_SOUTH_KOREA","USP_FLAG_SOUTH_SUDAN","USP_FLAG_SPAIN","USP_FLAG_SRI_LANKA","USP_FLAG_STATE_PALESTINE","USP_FLAG_SUDAN","USP_FLAG_SURINAME","USP_FLAG_SWAZILAND","USP_FLAG_SWEDEN","USP_FLAG_SWITZERLAND","USP_FLAG_SYRIA","USP_FLAG_TAIWAN","USP_FLAG_TAJIKISTAN","USP_FLAG_TANZANIA","USP_FLAG_THAILAND","USP_FLAG_THE_BAHAMAS","USP_FLAG_THE_GAMBIA","USP_FLAG_TOGO","USP_FLAG_TRINIDAD_TOBAGO","USP_FLAG_TUNISIA","USP_FLAG_TURKEY","USP_FLAG_TURKISH_NORTH_CYPRUS","USP_FLAG_TURKMENISTAN","USP_FLAG_TUVALU","USP_FLAG_UGANDA","USP_FLAG_UKRAINE","USP_FLAG_UNITED_ARAB_EMIRATES","USP_FLAG_UNITED_KINGDOM","USP_FLAG_UNITED_NATIONS","USP_FLAG_UNITED_STATES","USP_FLAG_URUGUAY","USP_FLAG_UZBEKISTAN","USP_FLAG_VANUATU","USP_FLAG_VATICAN_CITY","USP_FLAG_VENEZUELA","USP_FLAG_VIETNAM","USP_FLAG_YEMEN","USP_FLAG_ZIMBABWE","USP_FLAG_ZAMBIA"];
	_otherFlags = ["Spain_Flags_Spain_F"];
	_vnwFlags = ["vn_flag_pavn"];
	
	flagArray append _vanillaFlags;
	flagArray append _globMobFlags;
	flagArray append _cupFlags;
	flagArray append _euFlags;
	flagArray append _undersiegeFlags;
	flagArray append _otherFlags;
	flagArray append _vnwFlags;

	player addAction [
		"Raise Flag",
		{
			_flag = flagTarget;
			_flag setVariable ["animState",true,true];
			if (flagAnimationPhase _flag == 0) then {_flag forceFlagTexture "textures\vietnam-flag.jpg";};
			[_flag, 1] call BIS_fnc_animateFlag;
			
			waitUntil {(flagAnimationPhase _flag) == 1};
			_flag setVariable ["animState",false,true];
		},
		[""],
		0.1,
		false,
		true,
		"",
		"!(isNull flagTarget) && vehicle player == player && alive player && player getVariable 'canInteractWithFlags' && (flagAnimationPhase flagTarget) < 1 && !(flagTarget getVariable ""animState"") "
	];
	player addAction ["Raise Flag to Half Mast",{_flag = flagTarget; _flag setVariable ["animState",true,true]; if (flagAnimationPhase _flag == 0) then {_flag forceFlagTexture "textures\vietnam-flag.jpg";}; [_flag, 0.5] call BIS_fnc_animateFlag; waitUntil {(flagAnimationPhase _flag) == 0.5}; _flag setVariable ["animState",false,true];},[""],0.1,false,true,"","!(isNull flagTarget) && vehicle player == player && alive player && player getVariable 'canInteractWithFlags' && (flagAnimationPhase flagTarget) < 0.5 && !(flagTarget getVariable ""animState"") "];
	player addAction ["Lower Flag to Half Mast",{_flag = flagTarget; _flag setVariable ["animState",true,true]; [_flag, 0.5] call BIS_fnc_animateFlag; waitUntil {(flagAnimationPhase _flag) == 0.5}; _flag setVariable ["animState",false,true];},[""],0.1,false,true,"","!(isNull flagTarget) && vehicle player == player && alive player && player getVariable 'canInteractWithFlags' && (flagAnimationPhase flagTarget) > 0.5 && !(flagTarget getVariable ""animState"")  "];
	player addAction ["Lower Flag",{_flag = flagTarget; _flag setVariable ["animState",true,true]; [_flag, 0] call BIS_fnc_animateFlag; _flag setVariable ["flagTxt",(flagTexture _flag),true]; waitUntil {(flagAnimationPhase _flag) == 0}; _flag forceFlagTexture "textures\flagBlank.paa"; _flag setVariable ["animState",false,true];},[""],0.1,false,true,"","!(isNull flagTarget) && vehicle player == player && alive player && player getVariable 'canInteractWithFlags' && (flagAnimationPhase flagTarget) > 0 && !(flagTarget getVariable ""animState"") "];

	_arry = [];
	while {true} do {
		_arry = nearestObjects [player,flagArray,10];
		
		{
			if ((_x getVariable ["animState","UNDEF"]) isEqualTo "UNDEF") then {
				_x setVariable ["animState",false,true];
			};
		} forEach _arry;
		
		if ((count _arry) != 0 && (((_arry select 0) getRelPos [-0.35,0]) distance2D player) <= _interactDistance && alive (_arry select 0)) then {
			flagTarget = (_arry select 0);
		} else {
			flagTarget = objNull;
		};
		sleep 0.1;
	};
};