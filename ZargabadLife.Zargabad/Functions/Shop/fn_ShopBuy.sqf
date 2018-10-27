#include "..\..\ConfigMacros.hpp"
/*
	File: fn_ShopBuy.sqf
	Function: ZKB_fnc_ShopBuy
	Author: ZKB1325
	Description: Runs when ever a player buys an item
*/
private ["_boughtItemArr","_boughtItem","_boughtItemPrice","_boughtItemIndex","_boughtamount","_shopData","_boughtitemstock","_boughttype","_requiredlicense","_vehspawnpoint","_gearbox"];

if ((_this select 0) == "") exitWith {};
_boughtItemArr = call compile (_this select 0);
_boughtItem = _boughtItemArr select 0;
_boughtItemPrice = _boughtItemArr select 1;
private _boughtItemClass = getText (missionConfigFile >> "Item_Config" >> _boughtItem >> "className");
_boughtItemIndex = ([_boughtItem, ZKB_shopobject] call ZKB_fnc_ShopGetItemStock) select 2;
_boughtamount = floor (abs (parseNumber (_this select 1)));
private _paidTaxes = param [2,0,[0]];

if !([_boughtItem] call ZKB_fnc_GetItemCondition) exitWith {["STR_Shop_FalseCondition",[[_boughtItem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};

_shopData = ZKB_shopobject getVariable "ShopData";
_boughtitemstock = ([_boughtItem, ZKB_shopobject] call ZKB_fnc_ShopGetItemStock) select 0;
_boughttype = ([_boughtItemClass] call ZKB_fnc_GetConfigByClass);

if !(_boughttype == "VirtualItem") then
	{
	if (_boughttype == "CfgVehicles" and ((_boughtItemClass call ZKB_fnc_GetGearType) == 0)) then {_boughtamount = 1;}else{_boughttype = "CfgBackpack";};
	};


if (_boughtamount < 1) exitWith {};
if ((["Money"] call ZKB_fnc_GetInvItemAmount) < (_boughtItemPrice*_boughtamount)) exitWith {["STR_Shop_NotEnoughMoney"] call ZKB_fnc_DynamicText;};
if (!([_boughtItem] call ZKB_fnc_HasRequiredLicenses) and (_shopData select 6)) exitWith 
	{
	_requiredlicense = "";
	switch true do
		{
		case (IsCop): {_requiredlicense = _requiredlicense + (([_boughtItem] call ZKB_fnc_GetItemLicenseCop) call ZKB_fnc_GetLicenseDisplayName);};	
		case (IsCiv): {_requiredlicense = _requiredlicense + (([_boughtItem] call ZKB_fnc_GetItemLicenseCiv) call ZKB_fnc_GetLicenseDisplayName);};	
		};
		
	_requiredlicense = _requiredlicense + ", " + (([_boughtItem] call ZKB_fnc_GetItemLicenseBoth) call ZKB_fnc_GetLicenseDisplayName);	
	["STR_Shop_NoLicense", [_requiredlicense]] call ZKB_fnc_DynamicText;
	};
if (!(_boughtitemstock <= -1) and (_boughtamount > _boughtitemstock)) exitWith {["STR_Shop_OutOfStock"] call ZKB_fnc_DynamicText;};


switch _boughttype do
	{
	case "VirtualItem":
		{
		if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_boughtItem] call ZKB_fnc_GetItemWeight)*_boughtamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};	
		[_boughtItem, _boughtamount] call ZKB_fnc_InvAddItem;
		["Money", (_boughtItemPrice*_boughtamount)] call ZKB_fnc_InvRemoveItem;
		["STR_Shop_BoughtItem", [([_boughtamount] call ZKB_fnc_FormatNumber), ([_boughtItem] call ZKB_fnc_GetItemName), ([(_boughtItemPrice*_boughtamount)] call ZKB_fnc_FormatNumber)]] call ZKB_fnc_DynamicText;
		if !(_boughtitemstock <= -1) then {[ZKB_shopobject, _boughtItemIndex, _boughtamount, false] call ZKB_fnc_UpdateShopStock;};
		ZKB_shopobject setVariable ["curTax",(ZKB_shopobject getVariable ["curTax",0]) + (_paidTaxes*_boughtamount),true];
		};
		
	case "CfgVehicles":
		{
		_vehspawnpoint = (_shopData select 3);
		if(count (nearestobjects [getpos _vehspawnpoint,["motorcycle","Car","Tank","Ship","Air"], 3]) > 0) exitWith {["STR_Shop_VehSpawnBlocked"] call ZKB_fnc_DynamicText;};
		[_boughtItemClass,_vehspawnpoint,-1,player] spawn ZKB_fnc_CreateVehicle;
		["Money", (_boughtItemPrice*_boughtamount)] call ZKB_fnc_InvRemoveItem;
		["STR_Shop_BoughtVeh", [([_boughtItem] call ZKB_fnc_GetItemName), ([(_boughtItemPrice*_boughtamount)] call ZKB_fnc_FormatNumber)]] call ZKB_fnc_DynamicText;
		if !(_boughtitemstock <= -1) then {[ZKB_shopobject, _boughtItemIndex, _boughtamount, false] call ZKB_fnc_UpdateShopStock;};
		ZKB_shopobject setVariable ["curTax",(ZKB_shopobject getVariable ["curTax",0]) + (_paidTaxes*_boughtamount),true];
		closeDialog 0;
		};
	default
		{
		_gearbox = (_shopData select 2);	
		_geartype = _boughtItemClass call ZKB_fnc_GetGearType;
		switch _geartype do 
			{	
			case 1:{
					_gearbox addWeaponCargoGlobal [_boughtItemClass, _boughtamount];
					};
			case 2:{
					_gearbox addMagazineCargoGlobal [_boughtItemClass, _boughtamount];
					};
			case 3:{
					_gearbox addItemCargoGlobal [_boughtItemClass, _boughtamount];
					};
			case 4:{ 
					_gearbox addBackpackCargoGlobal [_boughtItemClass, _boughtamount];
					};
			};
		["Money", (_boughtItemPrice*_boughtamount)] call ZKB_fnc_InvRemoveItem;
		["STR_Shop_BoughtItem", [([_boughtamount] call ZKB_fnc_FormatNumber), ([_boughtItem] call ZKB_fnc_GetItemName), ([(_boughtItemPrice*_boughtamount)] call ZKB_fnc_FormatNumber)]] call ZKB_fnc_DynamicText;
		if !(_boughtitemstock <= -1) then {[ZKB_shopobject, _boughtItemIndex, _boughtamount, false] call ZKB_fnc_UpdateShopStock;};
		ZKB_shopobject setVariable ["curTax",(ZKB_shopobject getVariable ["curTax",0]) + (_paidTaxes*_boughtamount),true];
		};
	};
	
call ZKB_fnc_UpdateShopBuyList;
call ZKB_fnc_UpdateShopSellList;