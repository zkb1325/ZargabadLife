/*
	Author: ZKB1325
	FileName: fn_GetItemNeedFactoryItems.sqf
	Function: ZKB_fnc_GetItemNeedFactoryItems
	Description: Returns the display name of an item based on class name
*/
private ["_classname"];
_classname = param [0,"",[""]];
//([_classname] call ZKB_fnc_GetItemInfo) select 8;
getArray (missionConfigFile >> "Item_Config" >> _classname >> "reqResources");