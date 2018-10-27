/*
    File: fn_IsRestrained.sqf
	Function: ZKB_fnc_IsRestrained
    Author: ZKB1325

    Description:
	true/false if given player is restrained
*/
private _player = param [0,player,[objNull]];
if (isNull _player) exitWith {};
_player getVariable ["restrained",false];