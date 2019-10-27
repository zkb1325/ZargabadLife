/*
	File: fn_UpdateShopStock.sqf
	Function: ZKB_fnc_UpdateShopStock
	Author: ZKB1325
	Description: takes shop object, item index, amount, and if it should add or remove and updates the shops stock
	
	0: Object
		Object of the shop
	1: Number
		Index that should be updated
	2: Number
		Amount to add or remove to the stock
	3: Bool
		True/False if the amount should be added. True = Add to the stock, False = Remove from the stock
*/
private _shopobject = param [0,objNull,[objNull]];
private _itemindex = param [1,0,[0]];
private _amount = param [2,0,[0]];
private _doaddamount = param [3,true,[true]];

if (isNull _shopobject) exitWith {};
if (_itemindex isEqualTo -1) exitWith {};

private _updateshoparray = (_shopobject getVariable "ShopData");
private _shopstockarray = _updateshoparray select 8;
private _shopmaxstockarray = _updateshoparray select 9;

	
if (_doaddamount) then
	{
	if (((_shopstockarray select _itemindex) + _amount) > (_shopmaxstockarray select _itemindex)) exitWith {};
	private _newamount = ((_shopstockarray select _itemindex) + _amount);
	_shopstockarray set [_itemindex, _newamount];
	_updateshoparray set [8, _shopstockarray];
	_shopobject setVariable ["ShopData", _updateshoparray, true];	
	}
	else
	{
	if (((_shopstockarray select _itemindex) - _amount) < 0) exitWith {};
	private _newamount = ((_shopstockarray select _itemindex) - _amount);
	_shopstockarray set [_itemindex, _newamount];
	_updateshoparray set [8, _shopstockarray];
	_shopobject setVariable ["ShopData", _updateshoparray, true];
	};