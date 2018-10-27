/*
	Author: ZKB1325
	FileName: fn_UpdateFacStoreSelInfo.sqf
	Function: ZKB_fnc_UpdateFacStoreSelInfo
	Description: Handles updating the take button text
*/
private ["_seletedIemArr","_selectedItem","_selectedItemPrice","_amountvalue","_display","_storebtn"];
disableserialization;

if ((_this select 0) == "") exitWith {};
_selectedItemArr = call compile (_this select 0);
_selectedItem = _selectedItemArr select 0;
_selectedItemPrice = _selectedItemArr select 1;
_amountvalue = floor (abs (parseNumber (_this select 1)));

if (_amountvalue < 1) then {_amountvalue = 0;};

_display = uiNameSpace getVariable "ZKB_ListMenu";
_storebtn = _display displayCtrl 5060;


_storebtn ctrlSetText format [localize "STR_Fac_StoreItem", ([_selectedItem] call ZKB_fnc_GetItemName), ([(([_selectedItem] call ZKB_fnc_GetItemWeight)*_amountvalue)] call ZKB_fnc_FormatNumber)];	