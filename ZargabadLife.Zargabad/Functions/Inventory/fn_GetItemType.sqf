/*
	Author: ZKB1325
	FileName: fn_GetItemType.sqf
	Function: ZKB_fnc_GetItemType
	Description: Returns the display name of an item based on class name
*/
private _classname = param [0,"",[""]];
//([_classname] call ZKB_fnc_GetItemInfo) select 2;
getText (missionConfigFile >> "Item_Config" >> _classname >> "itemType");