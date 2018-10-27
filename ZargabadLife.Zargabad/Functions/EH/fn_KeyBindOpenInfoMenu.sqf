/*
	Author: ZKB1325
	FileName: fn_KeyBindOpenInfoMenu.sqf
	Function: ZKB_fnc_KeyBindOpenInfoMenu
	
	Description: Key bind function to open info menu
*/

if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if (dialog) exitWith {closeDialog 0; true;};
[] spawn ZKB_fnc_OpenInfoMenu;
true;