/*
	Author: ZKB1325
	FileName: fn_KeyBindHandsDown.sqf
	Function: ZKB_fnc_KeyBindHandsDown
	
	Description: Key bind function to put hands down
*/


if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if ([player] call ZKB_fnc_IsRestrained) exitWith {true;};
if !(isNull objectParent player) exitWith {true;};
player setVariable ["surrendering",false,true]; 
true;