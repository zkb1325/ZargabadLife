/*
	Author: ZKB1325
	FileName: fn_ServerSavePlayerStats.sqf
	Function: ZKB_fnc_ServerSavePlayerStats
	
	Description: Takes passed player info and saves it
*/
private _playerVar = param [0,"",[""]];
if (isNil {missionNamespace getVariable _playerVar}) exitWith {};
private _stats = (missionNamespace getVariable _playerVar);
private _keys = _stats select 0;
_stats set [0,[]];
["write",[_playerVar,"Stats",_stats]] call ZKB_PlayerDB;
_stats set [0,_keys];