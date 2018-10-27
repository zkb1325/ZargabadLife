/*
	Author: ZKB1325
	FileName: fn_GetItemBuyPriceWithTax.sqf
	Function: ZKB_fnc_GetItemBuyPriceWithTax
	Description: Returns the buy price of an item including tax
*/
private ["_classname","_itemtype","_buyprice","_tax"];
_classname = param [0,"",[""]];
_itemtype = [_classname] call ZKB_fnc_GetItemType;
_buyprice = [_classname] call ZKB_fnc_GetItemBuyPrice;

_tax = switch _itemtype do
	{
	case "Item": {(ZKB_TaxArray select 0);};
	case "Vehicle": {(ZKB_TaxArray select 1);};
	case "Magazine": {(ZKB_TaxArray select 2);};
	case "Weapon": {(ZKB_TaxArray select 3);};
	default {0;};
	};


((_buyprice * (_tax/100)) + _buyprice);