/*
	File: fn_SearchVehicle.sqf
	Function: ZKB_fnc_SearchVehicle
	Author: ZKB1325
	Description: search the trunk of a vehicle
	
	0: Object
		Vehicle to search the trunk of
*/
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

private _vehicleOwnerUID = _vehicle getVariable ["VehicleOwner",""];
private _vehicleOwner = [_vehicleOwnerUID] call ZKB_fnc_GetPlayerFromID;
if (side _vehicleOwner isEqualTo west) exitWith {}; //Don't bother with cop owned vehicles
private _vehicleTrunkItems = _vehicle getVariable ["VehicleTrunk",[]];

private _illegalValue = 0;

{
if ([_x select 0] call ZKB_fnc_GetItemIsIllegal) then
	{
	_illegalValue = _illegalValue + (([_x select 0] call ZKB_fnc_GetItemSellPrice)*(_x select 1));
	_vehicleTrunkItems set [_forEachIndex,"Remove"];
	};
}forEach _vehicleTrunkItems;

_vehicleTrunkItems = _vehicleTrunkItems - ["Remove"];
_vehicle setVariable ["VehicleTrunk",_vehicleTrunkItems,true];

if (_illegalValue > 0) then
	{
	[_vehicleOwnerUID,"Illegal Items",_illegalValue] call ZKB_fnc_AddWanted;
	["STR_Vehicle_SearchVehFound",[name player, [_illegalValue] call ZKB_fnc_FormatNumber, _vehicle getVariable ["plate",_vehicle]]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	}
	else
	{
	["STR_Vehicle_SearchVehNotFound"] call ZKB_fnc_DynamicText;
	};