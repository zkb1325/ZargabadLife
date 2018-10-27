/*
	Author: ZKB1325
	FileName: fn_GetItemCondition.sqf
	Function: ZKB_fnc_GetItemCondition
	Description: Returns the if the condition is met to buy the item
*/
private _classname = param [0,"",[""]];
private _condition = getText (missionConfigFile >> "Item_Config" >> _classname >> "Condition");
if (_condition isEqualTo "") then
	{
	_condition = true;
	}
	else
	{
	_condition = call compile _condition;
	};
_condition;