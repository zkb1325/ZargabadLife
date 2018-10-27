/*
	File: fn_GetPlayerFromID.sqf
	Function: ZKB_fnc_GetPlayerFromID
	Author: ZKB1325
	Description: takes a player UID and returns the player unit
	0: String
		Players ID to find player of
*/

private ["_uid","_return"];
_uid = param [0,"",[""]];
_return = ObjNull;

{
if (_uid isEqualTo getplayerUID _x) exitWith {_return = _x;};
}forEach ((call BIS_fnc_listPlayers) - (entities "HeadlessClient_F"));

_return;