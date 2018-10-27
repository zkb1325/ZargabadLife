/*
	File: fn_UpdateShopBuySelInfo.sqf
	Function: ZKB_fnc_UpdateShopBuySelInfo
	Author: ZKB1325
	Description: Updates the buy button with correct info
*/
private ["_selectedItemArr","_selectedItem","_selectedItemPrice","_amountvalue","_display","_buybtn"];
disableserialization;

if ((_this select 0) == "") exitWith {};
_selectedItemArr = call compile (_this select 0);
_selectedItem = _selectedItemArr select 0;
_selectedItemPrice = _selectedItemArr select 1;
_amountvalue = floor (abs (parseNumber (_this select 1)));

if (_amountvalue < 1) then {_amountvalue = 0;};

_display = uiNameSpace getVariable "ZKB_ListMenu";

_buybtn = _display displayCtrl 5050;


if (([_selectedItem] call ZKB_fnc_GetConfigByClass) == "VirtualItem") then
	{
	_buybtn ctrlSetText format [localize "STR_Shop_BuyBtnVirtItem", ([_selectedItemPrice*_amountvalue] call ZKB_fnc_FormatNumber), ([(([_selectedItem] call ZKB_fnc_GetItemWeight)*_amountvalue)] call ZKB_fnc_FormatNumber)];		
	}
	else
	{
	_buybtn ctrlSetText format [localize "STR_Shop_BuyBtnGear",([_selectedItemPrice*_amountvalue] call ZKB_fnc_FormatNumber)];	
	};