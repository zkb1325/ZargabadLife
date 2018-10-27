/*
    File: fn_IsSurrending.sqf
	Function: ZKB_fnc_IsSurrending
    Author: ZKB1325

    Description:
	true/false if given player is surrendering/Hands on head
*/
private _player = param [0,player,[objNull]];
if (isNull _player) exitWith {};
_player getVariable ["surrendering",false];