/*
    File: fn_Pardon.sqf
	Function: ZKB_fnc_Pardon
    Author: ZKB1325

    Description:
    Updates the wanted list for provided player with crime
	
	0:Object or String
		Player object to add wanted or player UID
*/

private _player = param [0,objNull,[objNull,""]];
if (_player isEqualTo objNull) exitWith {}; //bad player
if (typeName _player isEqualTo typeName "") then
	{
	_player = [_player] call ZKB_fnc_GetPlayerFromID;
	};
if (isNull _player) exitWith {false;}; //bad player

_player setVariable ["Warrants",[],true];
["STR_Admin_PlayerLogsPardonPlayer",name player,name _player] call ZKB_fnc_AdminAddPlayerLog;
true;