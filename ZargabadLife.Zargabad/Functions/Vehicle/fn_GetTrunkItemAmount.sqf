/*
	Author: ZKB1325
	FileName: fn_GetTrunkItemAmount.sqf
	Function: ZKB_fnc_GetTrunkItemAmount
	Description: Returns the total amount of a given item in the vehicles trunk
*/

private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};
private _item = param [1,"",[""]];
if (_item isEqualTo "") exitWith {};
_return = 0;

private _vehicleTrunkItems = _vehicle getVariable ["VehicleTrunk",[]];

{
if ((_x select 0) == _item) exitWith
	{
	_return = (_x select 1);
	};
}forEach _vehicleTrunkItems;

_return;