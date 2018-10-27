/*
	Author: ZKB1325
	FileName: fn_KeyBindOpenGangMenu.sqf
	Function: ZKB_fnc_KeyBindOpenGangMenu
	
	Description: Key bind function to open gang menu
*/


if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if (IsCiv) then
	{
	if (dialog) exitWith {closeDialog 0; true;};
	if ([player] call ZKB_fnc_IsRestrained) exitWith {true;};
	if ([player] call ZKB_fnc_IsSurrending) exitWith {true;};
	if ([player] call ZKB_fnc_IsKnockedOut) exitWith {true;};
	
	call ZKB_fnc_OpenGangMenu;
	};
true;