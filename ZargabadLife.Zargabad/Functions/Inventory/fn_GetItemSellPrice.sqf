/*
	Author: ZKB1325
	FileName: fn_GetItemSellPrice.sqf
	Function: ZKB_fnc_GetItemSellPrice
	Description: Returns the display name of an item based on class name
*/
private ["_classname","_return"];
_classname = param [0,"",[""]];
_return = 0;

//_return = (([_classname] call ZKB_fnc_GetItemInfo) select 4) select 1;
_return = getNumber (missionConfigFile >> "Item_Config" >> _classname >> "sellPirce");

if (_return == -1) then
	{
	_return = round(([_classname] call ZKB_fnc_GetItemBuyPrice)/2);	
	};
	
_return;