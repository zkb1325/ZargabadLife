/*
	File: fn_ViewTrunk.sqf
	Function: ZKB_fnc_ViewTrunk
	Author: ZKB1325
	Description: Views the trunk of a vehicle
	
	0: Object
		Vehicle to open the trunk of
*/
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

disableSerialization;
createDialog "ZKB_GenList";

private _display = uiNamespace getVariable "ZKB_GenList";
private _frame = _display displayCtrl 1002;
private _list = _display displayCtrl 1010;

_frame ctrlSetText localize "STR_Vehicle_VehicleTrunk";

private _vehicleTrunkItems = _vehicle getVariable ["VehicleTrunk",[]];

{
_index = _list lbAdd format [localize "STR_Fac_FacStoreList", ([(_x select 0)] call ZKB_fnc_GetItemName), ([(_x select 1)] call ZKB_fnc_FormatNumber), ([([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1)]call ZKB_fnc_FormatNumber)];
if ([_x select 0] call ZKB_fnc_GetItemIsIllegal) then {_list lbSetColor [_index, [1,0,0,1]]};
}forEach _vehicleTrunkItems;