/*
	File: fn_OpenVehicleTrunk.sqf
	Function: ZKB_fnc_OpenVehicleTrunk
	Author: ZKB1325
	Description: Opens and displays contents of provided vehicles trunk
	
	0: Object
		Vehicle to display trunk of
	1: Bool
		True/False If it should be ignored that the player might not be in the driver seat
*/

private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};
ZKB_CurVehicleTrunk = _vehicle;
private _forced = param [1,false,[false]];

if (!_forced and (!(driver _vehicle isEqualTo player) or (_vehicle isEqualTo player))) exitWith {["STR_Common_NotInVehDriver"] call ZKB_fnc_DynamicText;};
if (!(_vehicle in (player getVariable ["ZKB_Keys",[]])) and !_forced) exitWith {["STR_Common_VehLockNotYours"] call ZKB_fnc_DynamicText;};

disableserialization;
createDialog "ZKB_ListMenu";

private _display = uiNameSpace getVariable "ZKB_ListMenu";

private _vehFrame = _display displayCtrl 5002;
private _invFrame = _display displayCtrl 5004; 

private _vehTrunkList = _display displayCtrl 5010;
private _invList = _display displayCtrl 5020;

private _takeAmount = _display displayCtrl 5030;
private _storeAmount = _display displayCtrl 5040;

private _takeBtn = _display displayCtrl 5050;
private _storeBtn = _display displayCtrl 5060;


_vehFrame CtrlSetText (localize "STR_Vehicle_VehicleTrunk");
_invFrame CtrlSetText (localize "STR_Inv_Inventory");

_takeBtn ctrlSetText (localize "STR_Fac_TakeItemBase");
_storeBtn ctrlSetText (localize "STR_Fac_StoreItemBase");

[ZKB_CurVehicleTrunk] call ZKB_fnc_UpdateVehicleTrunkList;
[ZKB_CurVehicleTrunk] call ZKB_fnc_UpdateVehicleInvList;

_takeBtn buttonSetAction "[ZKB_CurVehicleTrunk, ""Remove"", (lbData [5010,(lbCurSel 5010)]), (CtrlText 5030)] call ZKB_fnc_UpdateVehicleTrunk; [ZKB_CurVehicleTrunk] call ZKB_fnc_UpdateVehicleTrunkList; [ZKB_CurVehicleTrunk] call ZKB_fnc_UpdateVehicleInvList;";
_storeBtn buttonSetAction "[ZKB_CurVehicleTrunk, ""Add"", (lbData [5020,(lbCurSel 5020)]), (CtrlText 5040)] call ZKB_fnc_UpdateVehicleTrunk; [ZKB_CurVehicleTrunk] call ZKB_fnc_UpdateVehicleTrunkList; [ZKB_CurVehicleTrunk] call ZKB_fnc_UpdateVehicleInvList;";

_vehTrunkList ctrlSetEventHandler ["LBSelChanged", "[((_this select 0) lbData (_this select 1)), (CtrlText 5030)] call ZKB_fnc_UpdateFacTakeSelInfo;"];
_invList ctrlSetEventHandler ["LBSelChanged", "[((_this select 0) lbData (_this select 1)), (CtrlText 5040)] call ZKB_fnc_UpdateFacStoreSelInfo;"];


_takeamounttext = CtrlText _takeAmount;
_storeamounttext = CtrlText _storeAmount;


while {ctrlVisible 5030} do
	{
	
	if !(_takeamounttext == (CtrlText _takeAmount)) then {_takeamounttext = CtrlText _takeAmount; [(_vehTrunkList lbData (lbCurSel _vehTrunkList)), (CtrlText _takeAmount)] call ZKB_fnc_UpdateFacTakeSelInfo;};
	if !(_storeamounttext == (CtrlText _storeAmount)) then {_storeamounttext = CtrlText _storeAmount; [(_invList lbData (lbCurSel _invList)), (CtrlText _storeAmount)] call ZKB_fnc_UpdateFacStoreSelInfo;};
	sleep .1;
	};

