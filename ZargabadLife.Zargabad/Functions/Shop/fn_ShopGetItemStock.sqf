/*
	File: fn_ShopGetItemStock.sqf
	Function: ZKB_fnc_ShopGetItemStock
	Author: ZKB1325
	Description: Takes an item and the shop the item can be bought at and returns the current stock and the max stock and stock index [-1,-1,-1] = doesn't use stock system
	
	0: String
		Item to find the stock off
	1: Object
		The shop object
*/
private _item = param [0,"",[""]];
private _shop = param [1,objNull,[objNull]];
if (_item isEqualTo "" or isNull _shop) exitWith {};

private _shopsarray = _shop getVariable "ShopData";
private _shopItemArray = _shopsarray select 4;
if (_shopItemArray isEqualTo []) then
	{
	_shopItemArray = _shopsarray select 5;
	};
private _shopsstock = _shopsarray select 8;
private _shopsmaxstock = _shopsarray select 9;
private _stockindex = _shopItemArray find _item;

if (_stockindex <= -1) then
	{
	[-1, -1, -1];	
	}
	else
	{
	[(_shopsstock select _stockindex), (_shopsmaxstock select _stockindex), _stockindex];	
	};