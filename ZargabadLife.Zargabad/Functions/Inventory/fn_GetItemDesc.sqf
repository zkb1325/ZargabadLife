/*
	Author: ZKB1325
	FileName: fn_GetItemDesc.sqf
	Function: ZKB_fnc_GetItemDesc
	Description: Returns the display name of an item based on class name
*/
private ["_classname","_return"];
_classname = param [0,"",[""]];
_return = "";
//_return = ([_classname] call ZKB_fnc_GetItemInfo) select 7;
_return = getText (missionConfigFile >> "Item_Config" >> _classname >> "Description");
if (_return == "") then
	{
	_return = ([_classname] call ZKB_fnc_GetItemName);
	}
	else
	{
	if (isLocalized _return) then
		{
		_return = localize _return;
		};
	};
	
_return;