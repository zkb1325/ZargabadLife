/*
	File: fn_UpdateFacStorageList.sqf
	Function: ZKB_fnc_UpdateFacStorageList
	Author: ZKB1325
	Description: Updates the store side list for factories
*/
private ["_facinfo","_display","_facstoragelist"];
disableserialization;

_facinfo = ZKB_OpenFactory getVariable "FactoryInfo";
_facstorage = missionNameSpace getVariable [(_facinfo select 6)+"Storage", []];


_display = uiNameSpace getVariable "ZKB_ListMenu";

_facstoragelist = _display displayCtrl 5010;
lbClear _facstoragelist;



{
_index = _facstoragelist lbAdd format [localize "STR_Fac_FacStoreList", ([(_x select 0)] call ZKB_fnc_GetItemName), ([(_x select 1)] call ZKB_fnc_FormatNumber), ([([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1)]call ZKB_fnc_FormatNumber)];	
_facstoragelist lbSetData [_index, str _x];
}forEach _facstorage;