/*
	Author: ZKB1325
	FileName: fn_GetItemFunction.sqf
	Function: ZKB_fnc_GetItemFunction
	Description: Returns the function that gets ran when an item is used
*/
private ["_classname"];
_classname = param [0,"",[""]];
//call compile ([_classname] call ZKB_fnc_GetItemInfo) select 3;
private _function = getText (missionConfigFile >> "Item_Config" >> _classname >> "Function");
if !(_function isEqualTo "") then
	{
	_function = call compile _function;
	};
_function;