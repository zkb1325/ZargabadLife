/*
	Author: ZKB1325
	FileName: fn_KeyBindOpenTrunk.sqf
	Function: ZKB_fnc_KeyBindOpenTrunk
	
	Description: Key bind function for Opening a vehicle trunk
*/
if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if (dialog) exitWith {true;};
if ([player] call ZKB_fnc_IsRestrained) exitWith {true;};
[(vehicle player)] spawn ZKB_fnc_OpenVehicleTrunk;
true;