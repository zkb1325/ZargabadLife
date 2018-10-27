/*
	Author: ZKB1325
	FileName: fn_GetItemName.sqf
	Function: ZKB_fnc_GetItemName
	Description: Returns the display name of an item based on class name
*/
private _classname = param [0,"",[""]];
//([_classname] call ZKB_fnc_GetItemInfo) select 1;
private _displayName = getText (missionConfigFile >> "Item_Config" >> _classname >> "displayName");
if (isLocalized _displayName) then
	{
	localize _displayName;
	}
	else
	{
	_displayName;
	};