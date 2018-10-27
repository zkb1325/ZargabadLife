/*
	Author: ZKB1325
	FileName: fn_KeyBindOpenInventory.sqf
	Function: ZKB_fnc_KeyBindOpenInventory
	
	Description: Key bind function to open inventory
*/

if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if (dialog) exitWith {closeDialog 0; true;};
if ([player] call ZKB_fnc_IsRestrained) exitWith {true;};
if ([player] call ZKB_fnc_IsSurrending) exitWith {true;};
if ([player] call ZKB_fnc_IsKnockedOut) exitWith {true;};
call ZKB_fnc_OpenInventory;
true;