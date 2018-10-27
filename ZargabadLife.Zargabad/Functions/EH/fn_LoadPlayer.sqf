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
		player setUnitLoadout [(_stats select 0),false];
		player setVariable ["ZKB_Inventory",(_stats select 1),true];
		player setVariable ["ZKB_Licenses",(_stats select 2),true];
		player setVariable ["ZKB_Keys",(_stats select 3),true];
		ZKB_BankAccount = (_stats select 4);
		ZKB_CopsKilled = (_stats select 5);
		ZKB_CivSkilled = (_stats select 6);
		ZKB_Suicides = (_stats select 7);
		ZKB_Deaths = (_stats select 8);
		ZKB_Hunger = (_stats select 9);
		player setVariable ["InJail",(_stats select 10),true];
		missionNamespace setVariable ["Jailtime",(_stats select 11)];
		player setVariable ["Bail",(_stats select 12)];
		};
		
	case civilian:
		{
		private _stats = missionNamespace getVariable format ["stats_%1_%2",getPlayerUID player,playerSide];
		ZKB_RespawnLoadOut = (_stats select 0);
		player setUnitLoadout [(_stats select 1),false];
		player setVariable ["ZKB_Inventory",(_stats select 2),true];
		player setVariable ["ZKB_Licenses",(_stats select 3),true];
		player setVariable ["ZKB_Keys",(_stats select 4),true];
		ZKB_BankAccount = (_stats select 5);
		ZKB_CopsKilled = (_stats select 6);
		ZKB_CivSkilled = (_stats select 7);
		ZKB_Suicides = (_stats select 8);
		ZKB_Deaths = (_stats select 9);
		ZKB_Hunger = (_stats select 10);
		player setVariable ["InJail",(_stats select 11),true];
		missionNamespace setVariable ["Jailtime",(_stats select 12)];
		player setVariable ["Bail",(_stats select 13)];
		player setVariable ["Warrants",(_stats select 14),true];
		missionNamespace setVariable ["ownedWorkplaces",(_stats select 15)];
		ZKB_OwnedFactories = (_stats select 16);
		private _facVars = (_stats select 17);
		
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