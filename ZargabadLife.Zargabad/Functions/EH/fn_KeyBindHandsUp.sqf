/*
	Author: ZKB1325
	FileName: fn_KeyBindHandsUp.sqf
	Function: ZKB_fnc_KeyBindHandsUp
	
	Description: Key bind function to put hands up
*/

if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if ([player] call ZKB_fnc_IsRestrained) exitWith {true;};
if ([player] call ZKB_fnc_IsKnockedOut) exitWith {true;};
if !(isNull objectParent player) exitWith {true;};
[] spawn ZKB_fnc_HandsUp;
true;