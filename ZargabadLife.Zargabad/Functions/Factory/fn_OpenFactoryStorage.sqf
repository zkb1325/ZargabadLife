/*
	Author: ZKB1325
	FileName: fn_OpenFactoryStorage.sqf
	Function: ZKB_fnc_OpenFactoryStorage
	Description: Handles filling the dialog for the factory storage
*/
private ["_actionarr","_facname","_facstoragevar","_display","_facstorageframe","_invframe","_facstoragelist","_invlist","_takeamount","_storelamount","_takebtn","_storebtn"];
disableserialization;
createDialog "ZKB_ListMenu";
ZKB_OpenFactory = _this select 0;

_display = uiNameSpace getVariable "ZKB_ListMenu";

_facstorageframe = _display displayCtrl 5002;
_invframe = _display displayCtrl 5004; 

_facstoragelist = _display displayCtrl 5010;
_invlist = _display displayCtrl 5020;

_takeamount = _display displayCtrl 5030;
_storelamount = _display displayCtrl 5040;

_takebtn = _display displayCtrl 5050;
_storebtn = _display displayCtrl 5060;


_facstorageframe CtrlSetText (localize "STR_Fac_FactoryStorage");
_invframe CtrlSetText (localize "STR_Inv_Inventory");

_takebtn ctrlSetText (localize "STR_Fac_TakeItemBase");
_storebtn ctrlSetText (localize "STR_Fac_StoreItemBase");

call ZKB_fnc_UpdateFacStorageList;
call ZKB_fnc_UpdateFacInvList;

_takebtn buttonSetAction "[ZKB_OpenFactory, ""Remove"", (lbData [5010,(lbCurSel 5010)]), (CtrlText 5030)] call ZKB_fnc_UpdateFacStorage; call ZKB_fnc_UpdateFacStorageList; call ZKB_fnc_UpdateFacInvList;";
_storebtn buttonSetAction "[ZKB_OpenFactory, ""Add"", (lbData [5020,(lbCurSel 5020)]), (CtrlText 5040)] call ZKB_fnc_UpdateFacStorage; call ZKB_fnc_UpdateFacStorageList; call ZKB_fnc_UpdateFacInvList;";

_facstoragelist ctrlSetEventHandler ["LBSelChanged", "[((_this select 0) lbData (_this select 1)), (CtrlText 5030)] call ZKB_fnc_UpdateFacTakeSelInfo;"];
_invlist ctrlSetEventHandler ["LBSelChanged", "[((_this select 0) lbData (_this select 1)), (CtrlText 5040)] call ZKB_fnc_UpdateFacStoreSelInfo;"];


_takeamounttext = CtrlText _takeamount;
_storeamounttext = CtrlText _storelamount;


while {ctrlVisible 5030} do
	{
	
	if !(_takeamounttext == (CtrlText _takeamount)) then {_takeamounttext = CtrlText _takeamount; [(_facstoragelist lbData (lbCurSel _facstoragelist)), (CtrlText _takeamount)] call ZKB_fnc_UpdateFacTakeSelInfo;};
	if !(_storeamounttext == (CtrlText _storelamount)) then {_storeamounttext = CtrlText _storelamount; [(_invlist lbData (lbCurSel _invlist)), (CtrlText _storelamount)] call ZKB_fnc_UpdateFacStoreSelInfo;};
	sleep .1;
	};
