/*
	File: fn_GenerateIDC.sqf
	File: ZKB_fnc_GenerateIDC
	Author: EPOCH Team, Change from uiNamespace to missionNamespace by ZKB1325
	Description: Gets the list of current generated IDC's and generates a new one based on the amount of current ones, does not reuse old IDC's.
*/



private ["_controls","_out"];

_controls = missionNamespace getVariable ["ZKB_Variable_GeneratedIDC",[]];

_out = -90000 - (count _controls);
_controls pushBack _out;
missionNamespace setVariable ["ZKB_Variable_GeneratedIDC",_controls];

_out