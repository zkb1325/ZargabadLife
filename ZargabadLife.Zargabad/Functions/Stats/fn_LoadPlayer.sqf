#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_LoadPlayer.sqf
	Function: ZKB_fnc_LoadPlayer
	
	Description: Handles loading the players stats from the current session
*/

switch (playerSide) do
	{
	case west:
		{
		private _stats = missionNamespace getVariable format ["stats_%1_%2",getPlayerUID player,playerSide];
		player setVariable ["ZKB_Keys",(_stats select 0),true];
		player setUnitLoadout [(_stats select 1),false];
		if (SETTING(getNumber,"ZKB_SavePlayerPos") isEqualTo 1) then {player setPosATL (_stats select 2)};
		player setVariable ["ZKB_Inventory",(_stats select 3),true];
		player setVariable ["ZKB_Licenses",(_stats select 4),true];
		ZKB_BankAccount = (_stats select 5);
		player setVariable ["BankAccount",ZKB_BankAccount,true];
		ZKB_CopsKilled = (_stats select 6);
		player setVariable ["CopKills",ZKB_CopsKilled,true];
		ZKB_CivSkilled = (_stats select 7);
		player setVariable ["CivKills",ZKB_CivsKilled,true];
		ZKB_Suicides = (_stats select 8);
		player setVariable ["Suicides",ZKB_Suicides,true];
		ZKB_Deaths = (_stats select 9);
		player setVariable ["Deaths",ZKB_Deaths,true];
		ZKB_Hunger = (_stats select 10);
		player setVariable ["Hunger",ZKB_Hunger,true];
		player setVariable ["InJail",(_stats select 11),true];
		missionNamespace setVariable ["Jailtime",(_stats select 12)];
		player setVariable ["Bail",(_stats select 13)];
		player setVariable ["respawning",(_stats select 14)];
		};
		
	case civilian:
		{
		private _stats = missionNamespace getVariable format ["stats_%1_%2",getPlayerUID player,playerSide];
		player setVariable ["ZKB_Keys",(_stats select 0),true];
		ZKB_RespawnLoadOut = (_stats select 1);
		player setUnitLoadout [(_stats select 2),false];
		if (SETTING(getNumber,"ZKB_SavePlayerPos") isEqualTo 1) then {player setPosATL (_stats select 3)};
		player setVariable ["ZKB_Inventory",(_stats select 4),true];
		player setVariable ["ZKB_Licenses",(_stats select 5),true];
		ZKB_BankAccount = (_stats select 6);
		player setVariable ["BankAccount",ZKB_BankAccount,true];
		ZKB_CopsKilled = (_stats select 7);
		player setVariable ["CopKills",ZKB_CopsKilled,true];
		ZKB_CivSkilled = (_stats select 8);
		player setVariable ["CivKills",ZKB_CivsKilled,true];
		ZKB_Suicides = (_stats select 9);
		player setVariable ["Suicides",ZKB_Suicides,true];
		ZKB_Deaths = (_stats select 10);
		player setVariable ["Deaths",ZKB_Deaths,true];
		ZKB_Hunger = (_stats select 11);
		player setVariable ["Hunger",ZKB_Hunger,true];
		player setVariable ["InJail",(_stats select 12),true];
		missionNamespace setVariable ["Jailtime",(_stats select 13)];
		player setVariable ["Bail",(_stats select 14)];
		player setVariable ["Warrants",(_stats select 15),true];
		missionNamespace setVariable ["ownedWorkplaces",(_stats select 16)];
		ZKB_OwnedFactories = (_stats select 17);
		private _facVars = (_stats select 18);
		player setVariable ["respawning",(_stats select 19)];
		
		private _facVar = "";
		private _facVarExt = "";
		private _facVarIndex = 0;
		
		{
		_facVar = _x;
		_facVarIndex = _forEachIndex;
		
		{
		_facVarExt = _x;
		missionNamespace setVariable [_facVar+_facVarExt,((_facVars select _facVarIndex) select _forEachIndex)]
		}forEach ["Storage","Queue","StorageCompleted","Workers"];
		
		}forEach ZKB_OwnedFactories;
		};
	};
	
if (player getVariable ["respawning",false]) then
	{
	[player] spawn ZKB_fnc_RespawnEH;
	};