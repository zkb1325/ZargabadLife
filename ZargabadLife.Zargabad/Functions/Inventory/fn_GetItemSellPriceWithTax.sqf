/*
	Author: ZKB1325
	FileName: fn_GetItemSellPriceWithTax.sqf
	Function: ZKB_fnc_GetItemSellPriceWithTax
	Description: Returns the sell price of an item including tax
*/
private ["_classname","_itemtype","_sellprice","_tax"];
_classname = param [0,"",[""]];
_itemtype = [_classname] call ZKB_fnc_GetItemType;
_sellprice = [_classname] call ZKB_fnc_GetItemSellPrice;

_tax = switch _itemtype do
	{
	case "Item": {(ZKB_TaxArray select 0)};
	case "Vehicle": {(ZKB_TaxArray select 1)};
	case "Magazine": {(ZKB_TaxArray select 2)};
	case "Weapon": {(ZKB_TaxArray select 3)};
	default {0;};
	};

((_sellprice * (_tax/100)) + _sellprice);