/*
	File: fn_UpdateVehicleTrunkList.sqf
	Function: ZKB_fnc_UpdateVehicleTrunkList
	Author: ZKB1325
	Description: Updates the trunk side of the vehicle trunk dialog
*/
disableserialization;

private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

private _vehicleTrunkItems = _vehicle getVariable ["VehicleTrunk",[]];

private _display = uiNameSpace getVariable "ZKB_ListMenu";

private _vehicleTrunkList = _display displayCtrl 5010;
lbClear _vehicleTrunkList;
private _vehicleCurWeight = _display displayCtrl 5090;

private _trunkWeight = 0;

{
_index = _vehicleTrunkList lbAdd format [localize "STR_Fac_FacStoreList", ([(_x select 0)] call ZKB_fnc_GetItemName), ([(_x select 1)] call ZKB_fnc_FormatNumber), ([([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1)]call ZKB_fnc_FormatNumber)];	
_vehicleTrunkList lbSetData [_index, str _x];
_trunkWeight = _trunkWeight + (([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1));
}forEach _vehicleTrunkItems;

_vehicleCurWeight ctrlSetText format [localize "STR_Vehicle_VehicleStorage",_trunkWeight,[typeOf _vehicle] call ZKB_fnc_GetItemTrunkSpace];