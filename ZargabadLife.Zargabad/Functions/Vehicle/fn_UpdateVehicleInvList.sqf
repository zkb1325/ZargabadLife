#include "..\..\ConfigMacros.hpp"
/*
	File: fn_UpdateVehicleInvList.sqf
	Function: ZKB_fnc_UpdateVehicleInvList
	Author: ZKB1325
	Description: Updates the inv side list for vehicle trunks
*/
disableserialization;

private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

private _vehicleTrunkItems = _vehicle getVariable ["VehicleTrunk",[]];

private _display = uiNameSpace getVariable "ZKB_ListMenu";

private _playerInventory = _display displayCtrl 5020;
lbClear _playerInventory;



{
if (([(_x select 0)] call ZKB_fnc_GetItemCanGive) and ([(_x select 0)] call ZKB_fnc_GetItemCanDrop) and !((_x select 0) in SETTING(getArray,"ZKB_VehicleTrunkBlacklist"))) then
	{
	_index = _playerInventory lbAdd format [localize "STR_Fac_FacStoreList", ([(_x select 0)] call ZKB_fnc_GetItemName), ([(_x select 1)] call ZKB_fnc_FormatNumber), ([([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1)] call ZKB_fnc_FormatNumber)];	
	_playerInventory lbSetData [_index, str _x];
	};
}forEach (player getVariable ["ZKB_Inventory",[]]);