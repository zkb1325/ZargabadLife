#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_GetLicenseDisplayName.sqf
	Function: ZKB_fnc_GetLicenseDisplayName
	Description: Handles buying a license
	
	_this: String
		License name
*/
private ["_license","_return"];
_license = _this;
_return = "";

{
if ((_x select 0) == _license) exitWith
	{
	_return = (_x select 1);	
	};
}forEach SETTING(getArray,"ZKB_LicenseArray");

_return;