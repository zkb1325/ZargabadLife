/*
	Author: ZKB1325
	FileName: fn_GetItemCanDrop.sqf
	Function: ZKB_fnc_GetItemCanDrop
	Description: Returns if the item can be dropped
*/
private ["_classname"];
_classname = param [0,"",[""]];
//(([_classname] call ZKB_fnc_GetItemInfo) select 6) select 0;
getNumber (missionConfigFile >> "Item_Config" >> _classname >> "canDrop") isEqualTo 1;