#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_SetUpLicenses.sqf
	Function: ZKB_fnc_SetUpLicenses
	Description: Goes through the array of licenses and add an addaction to each object the license needs to attach to
*/
private ["_licensename","_licensedisplayname","_cost","_objects","_condition"];

{
_licensename = _x select 0;
_licensedisplayname = _x select 1;
_cost = _x select 2;
_objects = _x select 3;
_condition = _x select 4;

{
GMVAR(_x,objNull) addAction [format ["%1 ($%2)",_licensedisplayname,[_cost] call ZKB_fnc_FormatNumber], ZKB_fnc_BuyLicense, [_licensename,_licensedisplayname,_cost], 1, true, true, "", _condition + format [" and !((""%1"") in (player getVariable [""ZKB_Licenses"",[]]))",_licensename], 7];
}forEach _objects;
}forEach SETTING(getArray,"ZKB_LicenseArray");