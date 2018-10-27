/*
	Author: ZKB1325
	FileName: fn_GetItemCanGive.sqf
	Function: ZKB_fnc_GetItemCanGive
	Description: Returns the display name of an item based on class name
*/
private ["_classname"];
_classname = param [0,"",[""]];
//(([_classname] call ZKB_fnc_GetItemInfo) select 6) select 1;
getNumber (missionConfigFile >> "Item_Config" >> _classname >> "canGive") isEqualTo 1;