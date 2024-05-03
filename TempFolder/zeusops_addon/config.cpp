#include "CfgEventHandlers.hpp"

class CfgPatches
{
	class zeusops_addon
	{
		requiredVersion=1;
		author="Zeus Operations";
		authorUrl="https://www.zeusops.com/";
		units[]=
		{
			"zeusops_ModuleBodybagAndRespawnPlayer",
			"zeusops_ModuleBodybagPlayer",
			"zeusops_ModuleForceRespawnWave",
			"zeusops_ModuleMoveRespawnPosition",
			"zeusops_ModuleSpawnArsenalBox",
			"zeusops_ModuleSpawnFortificationBoxSmall",
			"zeusops_ModuleSpawnFortificationBoxLarge",
			"zeusops_ModuleSpawnRearmBox",
			"zeusops_ModuleToggleRespawn"
		};
		requiredAddons[]=
		{
			"A3_Modules_F",
			"A3_Modules_F_Curator",
			"cba_common"
		};
	};
};

class CfgFunctions
{
	class zeusops
	{
		class functions
		{
			file="\zeusops_addon\functions";
			class dynamicGroups;
			class dynamicGroupsDisplay;
			class earplugs;
			class getUnitUnderCursor;
			class moduleBodybagAndRespawnPlayer;
			class moduleBodybagPlayer;
			class moduleForceRespawnWave;
			class moduleMoveRespawnPosition;
			class moduleSpawnArsenalBox;
			class moduleSpawnFortificationBoxLarge;
			class moduleSpawnFortificationBoxSmall;
			class moduleSpawnRearmBox;
			class moduleToggleRespawn;
			class respawnPlayer;
			class showCuratorMessage;
		};
	};
};
class CfgFactionClasses
{
	class zeusops_modules
	{
		displayName="Zeusops";
	};
};
class CfgVehicles
{
	class Logic;
	class Module_F: Logic {};
	class zeusops_ModuleBase : Module_F
	{
		category="zeusops_modules";
		scope=1; // not visible in editor
		scopeCurator = 2; // visible in zeus
		isGlobal=2; // ran globally
		functionPriority=1;
		isTriggerActivated=0;
		isDisposable=1;
		is3DEN=0;
		icon="\zeusops_addon\icons\icon_logo_zeusops.paa";
	};
	class zeusops_ModuleBodybagAndRespawnPlayer: zeusops_ModuleBase
	{
		displayName="Bodybag & respawn player";
		function="zeusops_fnc_moduleBodybagAndRespawnPlayer";
		icon="\zeusops_addon\icons\icon_reaper.paa";
		curatorCanAttach = 1;
	};
	class zeusops_ModuleBodybagPlayer: zeusops_ModuleBase
	{
		displayName="Bodybag player";
		function="zeusops_fnc_moduleBodybagPlayer";
		icon="\zeusops_addon\icons\icon_reaper.paa";
		curatorCanAttach = 1;
	};
	class zeusops_ModuleForceRespawnWave: zeusops_ModuleBase
	{
		displayName="Force respawn wave";
		function="zeusops_fnc_moduleForceRespawnWave";
		icon="\zeusops_addon\icons\icon_respawn.paa";
	};
	class zeusops_ModuleMoveRespawnPosition: zeusops_ModuleBase
	{
		displayName="Move respawn position";
		function="zeusops_fnc_moduleMoveRespawnPosition";
		icon="\zeusops_addon\icons\icon_respawn.paa";
		curatorCanAttach = 1;
	};
	class zeusops_ModuleSpawnArsenalBox: zeusops_ModuleBase
	{
		displayName="Spawn Arsenal Box";
		function="zeusops_fnc_moduleSpawnArsenalBox";
		icon="\zeusops_addon\icons\icon_ammobox.paa";
		scope=2; // visible in editor
		curatorCanAttach = 1;
	};
	class zeusops_ModuleSpawnFortificationBoxLarge: zeusops_ModuleBase
	{
		displayName="Spawn Fortification Box Large";
		function="zeusops_fnc_ModuleSpawnFortificationBoxLarge";
		icon="\zeusops_addon\icons\icon_ammobox.paa";
		scope=2; // visible in editor
		curatorCanAttach = 1;
	};
	class zeusops_ModuleSpawnFortificationBoxSmall: zeusops_ModuleBase
	{
		displayName="Spawn Fortification Box Small";
		function="zeusops_fnc_ModuleSpawnFortificationBoxSmall";
		icon="\zeusops_addon\icons\icon_ammobox.paa";
		scope=2; // visible in editor
		curatorCanAttach = 1;
	};
	class zeusops_ModuleSpawnRearmBox: zeusops_ModuleBase
	{
		displayName="Spawn Rearm Box";
		function="zeusops_fnc_moduleSpawnRearmBox";
		icon="\zeusops_addon\icons\icon_ammobox.paa";
		scope=2; // visible in editor
		curatorCanAttach = 1;
	};
	class zeusops_ModuleToggleRespawn: zeusops_ModuleBase
	{
		displayName="Toggle respawn";
		function="zeusops_fnc_moduleToggleRespawn";
		icon="\zeusops_addon\icons\icon_respawn.paa";
	};
};
