/*
	File: fn_knockoutAction.sqf
	Function: ZKB_fnc_knockoutAction
	Author: ZKB1325
	Description: Runs on who is doing the knocking out to be passed to who got knocked out
*/
private _knockedOut = param [0,objNull,[objNull]];
if (isNull _knockedOut) exitWith {};

missionNamespace setVariable ["knockingOut",true];
private _animation = if (currentWeapon player isEqualTo primaryWeapon player) then {"AwopPercMstpSgthWrflDnon_End1";}else{"AwopPercMstpSgthWpstDnon_Part3";};
[player,_animation] remoteExecCall ["ZKB_fnc_AnimSync",0];
sleep 0.08;
[name player] remoteExec ["ZKB_fnc_KnockedOut",_knockedOut];

sleep 3;
missionNamespace setVariable ["knockingOut",false];