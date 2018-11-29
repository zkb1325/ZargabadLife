/*
	File: fn_CfgGetPicture.sqf
	Function: ZKB_fnc_CfgGetPicture
	Author: ZKB1325
	Description: Gets the cfg picture of an item based off classname.
	Array or String
		Array or String containing class name
*/
private _class = param [0,"",[""]];
private _cfgClass = (_class call ZKB_fnc_GetConfigByClass);
if (_cfgClass isEqualTo "VirtualItem") exitWith {getText (missionConfigFile >> "Item_Config" >> _x >> "picture");};

getText (configFile >> _cfgClass >> _class >> "picture");