/*
	Author: ZKB1325
	File: fn_RemoveLicense.sqf
	Function: ZKB_fnc_RemoveLicense
	Description: Handles removing a license
*/
private _licenseVar = param [0,"",[""]];
private _curLicense = player getVariable ["ZKB_Licenses",[]];
_curLicense = _curLicense - [_licenseVar];
player setVariable ["ZKB_Licenses",_curLicense,true];