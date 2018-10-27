/*
	File: fn_CfgGetDisplayName.sqf
	Function: ZKB_fnc_CfgGetDisplayName
	Author: ZKB1325
	Description: Gets the cfg Display Name of an item based off classname.
	Array or String
		Array or String containing class name
*/
private ["_return","_class"];
_return = "";
_class = if (typeName _this == "Array") then {(_this select 0)}else{_this};


_return = getText(configFile >> (_class call ZKB_fnc_GetConfigByClass) >> _class >> "displayName");
_return;