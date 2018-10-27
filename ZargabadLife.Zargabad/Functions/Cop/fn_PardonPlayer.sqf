/*
	File: fn_PardonPlayer.sqf
	Function: ZKB_fnc_PardonPlayer
	Author: ZKB1325
	Description: Pardons a player from the wanted menu
*/
private _player = param [0,"",[objNull,""]];
if (typeName _player isEqualTo typeName "") then {_player = [_player] call ZKB_fnc_GetPlayerFromID};
if (isNull _player) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if !([_player] call ZKB_fnc_IsWanted) exitWith {["STR_Cop_WantedMenuPardonNotWanted",[name _player]] call ZKB_fnc_DynamicText;};
[_player] call ZKB_fnc_Pardon;
["STR_Cop_WantedMenuPardonBy",[name _player,name player]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];