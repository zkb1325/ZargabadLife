/*
	Author: ZKB1325
	FileName: fn_GetItemWeight.sqf
	Function: ZKB_fnc_GetItemWeight
	Description: Returns the weight of an item
*/
private ["_classname"];
_classname = param [0,"",[""]];
//(([_classname] call ZKB_fnc_GetItemInfo) select 4) select 2;
getNumber (missionConfigFile >> "Item_Config" >> _classname >> "Weight");