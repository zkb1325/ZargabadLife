/*
	Author: ZKB1325
	FileName: fn_GetItemInfo.sqf
	Function: ZKB_fnc_GetItemInfo
	Description: Returns the array of info for given item
*/
private ["_classname"];
_classname = param [0, "", [""]];
missionNameSpace getVariable ["ItemArray_" + _classname, ["NullItem", "NullItem", "NullItem", "", [0, 0, 0], ["", "", ""], [false, false, false], "NullItem", []]];