/*
	File: fn_UpdateShopSellSelInfo.sqf
	Function: ZKB_fnc_UpdateShopSellSelInfo
	Author: ZKB1325
	Description: Updates the sell button with correct info
*/
private ["_selectedItemArr","_selectedItem","_selectedItemPrice","_amountvalue","_display","_sellbtn"];
disableserialization;

if ((_this select 0) == "") exitWith {};
_selectedItemArr = call compile (_this select 0);
_selectedItem = _selectedItemArr select 0;
_selectedItemPrice = _selectedItemArr select 1;
_amountvalue = floor (abs (parseNumber (_this select 1)));
if (_amountvalue < 1) then {_amountvalue = 0;};

_display = uiNameSpace getVariable "ZKB_ListMenu";

_sellbtn = _display displayCtrl 5060;


if (([_selectedItem] call ZKB_fnc_GetConfigByClass) == "VirtualItem") then
	{
	_sellbtn ctrlSetText format [localize "STR_Shop_SellBtnVirtItem", ([_selectedItemPrice*_amountvalue] call ZKB_fnc_FormatNumber), ([(([_selectedItem] call ZKB_fnc_GetItemWeight)*_amountvalue)] call ZKB_fnc_FormatNumber)];		
	}
	else
	{
	_sellbtn ctrlSetText format [localize "STR_Shop_SellBtnGear",([_selectedItemPrice*_amountvalue] call ZKB_fnc_FormatNumber)];	
	};