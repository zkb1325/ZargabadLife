#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_SavePlayer.sqf
	Function: ZKB_fnc_SavePlayer
	
	Description: Handles saving the players stats for the session
*/

switch (playerSide) do
	{
	case west:
		{
		private _saveArray = 
		[
		getUnitLoadout player,
		player getVariable ["ZKB_Inventory",[]],
		player getVariable ["ZKB_Licenses",[]],
		player getVariable ["ZKB_Keys",[]],
		ZKB_BankAccount,
		ZKB_CopsKilled,
		ZKB_CivsKilled,
		ZKB_Suicides,
		ZKB_Deaths,
		ZKB_Hunger,
		player getVariable ["InJail",false],
		missionNamespace getVariable ["JailTime",0],
		player getVariable ["Bail",0]
		];

		diag_log _saveArray;
		missionNamespace setVariable [format ["stats_%1_%2",getPlayerUID player,playerSide],_saveArray,true];
		};
		
	case civilian:
		{
		private _facVarValues = [];
		private _facVarValues2 = [];
		private _facVar = "";
		private _facVarExt = "";
		private _facVarDefault = [];
		
		{
		_facVar = _x;
		_facVarValues2 = [];
		{
		_facVarExt = _x select 0;
		_facVarDefault = _x select 1;
		_facVarValues2 pushBack (missionNamespace getVariable [_facVar+_facVarExt,_facVarDefault]);
		}forEach [["Storage",[]],["Queue",[]],["StorageCompleted",[]],["Workers",0]];
		_facVarValues pushBack _facVarValues2;
		}forEach ZKB_OwnedFactories;
		
		private _saveArray = 
		[
		ZKB_RespawnLoadOut,
		getUnitLoadout player,
		player getVariable ["ZKB_Inventory",[]],
		player getVariable ["ZKB_Licenses",[]],
		player getVariable ["ZKB_Keys",[]],
		ZKB_BankAccount,
		ZKB_CopsKilled,
		ZKB_CivsKilled,
		ZKB_Suicides,
		ZKB_Deaths,
		ZKB_Hunger,
		player getVariable ["InJail",false],
		missionNamespace getVariable ["JailTime",0],
		player getVariable ["Bail",0],
		player getVariable ["Warrants",[]],
		missionNamespace getVariable ["ownedWorkplaces",[]],
		ZKB_OwnedFactories,
		_facVarValues
		];
		diag_log _saveArray;
		missionNamespace setVariable [format ["stats_%1_%2",getPlayerUID player,playerSide],_saveArray,true];
		};
	};
	
private _saveArrayShared = 
[
player getVariable ["ownedSlave",[]]
];
missionNamespace setVariable [format ["stats_%1_Shared",getPlayerUID player],_saveArrayShared,true];