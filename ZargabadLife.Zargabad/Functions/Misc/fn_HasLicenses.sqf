/*
	File: fn_HasLicenses.sqf
	Function: ZKB_fnc_HasLicenses
	Author: ZKB1325
	Description: Returns true/false if player has given license
*/
private _license = param [0,"",[""]];

_license in (player getVariable ["ZKB_Licenses",[]]);