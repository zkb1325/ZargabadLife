/*
    File: fn_IsKnockedOut.sqf
	Function: ZKB_fnc_IsKnockedOut
    Author: ZKB1325

    Description:
	true/false if given player is knocked out
*/
private _player = param [0,player,[objNull]];
if (isNull _player) exitWith {};
_player getVariable ["knockedOut",false];