/*
	Author: ZKB1325
	FileName: fn_ServerLoadPlayerStats.sqf
	Function: ZKB_fnc_ServerLoadPlayerStats
	
	Description: Takes passed player info and loads it if there is stats to be loaded
*/
private _playerVar = param [0,"",[""]];

private _stats = ["read",[_playerVar,"Stats",[]]] call ZKB_PlayerDB;
missionNamespace setVariable [_playerVar,_stats,true];