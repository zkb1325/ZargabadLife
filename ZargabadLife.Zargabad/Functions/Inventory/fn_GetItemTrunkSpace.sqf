/*
	Author: ZKB1325
	FileName: fn_GetItemTrunkSpace.sqf
	Function: ZKB_fnc_GetItemTrunkSpace
	Description: Returns the trunk space of a vehicle
*/
private ["_classname"];
_classname = param [0,"",[""]];
//(([_classname] call ZKB_fnc_GetItemInfo) select 4) select 3;
getNumber (missionConfigFile >> "Item_Config" >> _classname >> "trunkSpace");