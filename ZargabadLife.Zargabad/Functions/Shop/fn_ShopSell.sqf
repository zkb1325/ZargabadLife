/*
	File: fn_ShopSell.sqf
	Function: ZKB_fnc_ShopSell
	Author: ZKB1325
	Description: Runs when ever a player sell an item
*/
private ["_soldItemArr","_soldItem","_soldItemPrice","_soldItemIndex","_soldamount","_solditemstock","_soldtype","_vehtosell","_playersgearitems","_gearitemamount"];

if ((_this select 0) == "") exitWith {};
_soldItemArr = call compile (_this select 0);
_soldItem = _soldItemArr select 0;
_soldItemPrice = _soldItemArr select 1;
private _soldItemClass = getText (missionConfigFile >> "Item_Config" >> _soldItem >> "className");
_soldItemIndex = ([_soldItem, ZKB_shopobject] call ZKB_fnc_ShopGetItemStock) select 2;
_soldamount = floor (abs (parseNumber (_this select 1)));

_solditemstock = ([_soldItem, ZKB_shopobject] call ZKB_fnc_ShopGetItemStock) select 0;
_solditemmaxstock = ([_soldItem, ZKB_shopobject] call ZKB_fnc_ShopGetItemStock) select 1;
_soldtype = ([_soldItemClass] call ZKB_fnc_GetConfigByClass);

if ((([_soldItemClass] call BIS_fnc_itemType) select 1) isEqualTo "Backpack") then {_soldtype = "Backpack";};
if (_soldtype == "CfgVehicles") then {_soldamount = 1;};

if (_soldamount < 1) exitWith {};

if (!(_solditemstock <= -1) and ((_soldamount + _solditemstock) > _solditemmaxstock)) then 
	{
	["STR_Shop_MaxedStock"] call ZKB_fnc_DynamicText;
	_soldamount = (_solditemmaxstock - _solditemstock);
	};

if (_soldamount < 1) exitWith {};


switch _soldtype do
	{
	case "VirtualItem":
		{
		if (([_soldItem] call ZKB_fnc_GetInvItemAmount) < _soldamount) exitWith {["STR_Shop_NotEnoughItems"] call ZKB_fnc_DynamicText;};
		[_soldItem, _soldamount] call ZKB_fnc_InvRemoveItem; 
		["Money", (_soldItemPrice*_soldamount)] call ZKB_fnc_InvAddItem;
		["STR_Shop_SellItem", [([_soldamount] call ZKB_fnc_FormatNumber), ([_soldItem] call ZKB_fnc_GetItemName), ([(_soldItemPrice*_soldamount)] call ZKB_fnc_FormatNumber)]] call ZKB_fnc_DynamicText;
		if !(_solditemstock <= -1) then {[ZKB_shopobject, _soldItemIndex, _soldamount, true] call ZKB_fnc_UpdateShopStock;};
		if (ZKB_shopobject in [CocaineShop,MarijuanaShop,LSDShop,HeroinShop]) then
			{
			private _soldDrugArray = ZKB_shopobject getVariable ["soldDrugs",[]];
			private _mySoldIndex = _soldDrugArray findIf {(_x select 0) isEqualTo (getPlayerUID player)};
			if (_mySoldIndex isEqualTo -1) then
				{
				_soldDrugArray pushBack [getPlayerUID player,(_soldItemPrice*_soldamount)];
				ZKB_shopobject setVariable ["soldDrugs",_soldDrugArray,true];
				}
				else
				{
				private _myArray = _soldDrugArray select _mySoldIndex;
				private _mySoldAmount = _myArray select 1;
				_myArray set [1,_mySoldAmount+(_soldItemPrice*_soldamount)];
				_soldDrugArray set [_mySoldIndex,_myArray];
				ZKB_shopobject setVariable ["soldDrugs",_soldDrugArray,true];
				};
			};
		};
	case "CfgVehicles":
		{
		_vehtosell = objNull;
		_vehtosell = {
					if ((_soldItemClass == (typeOf _x)) and (player distance _x <= 25)) exitWith {_x};
					}forEach ZKB_TempSellVehList;
		if (isNull _vehtosell) exitWith {["STR_Shop_VehSellToFar"] call ZKB_fnc_DynamicText;};
		if !(alive _vehtosell) exitWith {["STR_Shop_VehSellDestroyed"] call ZKB_fnc_DynamicText;};
		
		["STR_Shop_SellVeh", [([_soldItem] call ZKB_fnc_GetItemName), _vehtosell getVariable ["plate",_vehtosell], ([(_soldItemPrice*_soldamount)] call ZKB_fnc_FormatNumber)]] call ZKB_fnc_DynamicText;
		deleteVehicle _vehtosell;
		["Money", (_soldItemPrice*_soldamount)] call ZKB_fnc_InvAddItem;
		if !(_solditemstock <= -1) then {[ZKB_shopobject, _soldItemIndex, _soldamount, true] call ZKB_fnc_UpdateShopStock;};	
		closeDialog 0;
		_keys = player getVariable ["ZKB_Keys", []];
		player setVariable ["ZKB_Keys", (_keys - [objNull]), true];
		};
	default
		{
		_playersgearitems = ([player, [0]] call ZKB_fnc_GetPlayerGear);
		_gearitemamount = 0;
		if (_soldItemClass in _playersgearitems) then
			{
			_gearitemamount = {_x == _soldItemClass}count _playersgearitems;
			};
		if (_gearitemamount < _soldamount) exitWith {["STR_Shop_NotEnoughItems"] call ZKB_fnc_DynamicText;};
		
		for "_i" from 1 to _soldamount do
			{
			if (_soldItemClass in ([player, [2,3,4]] call ZKB_fnc_GetPlayerGear)) then
				{
				if (_soldItemClass in ([player, [2]] call ZKB_fnc_GetPlayerGear)) exitWith {player removeItemFromUniform _soldItemClass;};
				if (_soldItemClass in ([player, [3]] call ZKB_fnc_GetPlayerGear)) exitWith {player removeItemFromVest _soldItemClass;};
				if (_soldItemClass in ([player, [4]] call ZKB_fnc_GetPlayerGear)) exitWith {player removeItemFromBackpack _soldItemClass;};
				}
				else
				{
				switch (([_soldItemClass] call BIS_fnc_itemType) select 0) do
					{
					case "Equipment": 
						{
						switch (([_soldItemClass] call BIS_fnc_itemType) select 1) do
							{
							case "Glasses": 
								{
								removeGoggles player; 
								};
							case "Headgear": 
								{
								removeHeadgear player; 
								};
							
							case "Uniform": 
								{
								removeUniform player;	
								};
							case "Vest": 
								{
								removeVest player;							
								};
							case "Backpack": 
								{
								removeBackpackGlobal player;		
								};
							
							};
						};
						
					case "Item":
						{
						switch (true) do
							{
							case (_soldItemClass in (primaryWeaponItems player)): 
								{
								player removePrimaryWeaponItem _soldItemClass; 
								};
							case (_soldItemClass in (secondaryWeaponItems player)): 
								{
								player removeSecondaryWeaponItem _soldItemClass; 
								};
							case (_soldItemClass in (handgunItems player)): 
								{
								player removehandgunItem _soldItemClass; 
								};
							default {player removeWeaponGlobal _soldItemClass;};
							};
						};
					
					case "Magazine":
						{
						switch (true) do
							{
							case (_soldItemClass == ((primaryWeaponMagazine player) select 0)): 
								{
								player removePrimaryWeaponItem _soldItemClass; 
								};
							case (_soldItemClass == ((secondaryWeaponMagazine player) select 0)): 
								{
								player removeSecondaryWeaponItem _soldItemClass; 
								};
							case (_soldItemClass == ((handgunMagazine player) select 0)): 
								{
								player removehandgunItem _soldItemClass; 
								};
							case (_soldItemClass == ((primaryWeaponMagazine player) select 1)): 
								{
								player removePrimaryWeaponItem _soldItemClass; 
								};
							};
						};
						
					case "Weapon":
						{	
						player removeWeaponGlobal _soldItemClass;							
						};
					};
				};	
			};
	
		["Money", (_soldItemPrice*_soldamount)] call ZKB_fnc_InvAddItem;
		["STR_Shop_SellItem", [([_soldamount] call ZKB_fnc_FormatNumber), ([_soldItem] call ZKB_fnc_GetItemName), ([(_soldItemPrice*_soldamount)] call ZKB_fnc_FormatNumber)]] call ZKB_fnc_DynamicText;
		if !(_solditemstock <= -1) then {[ZKB_shopobject, _soldItemIndex, _soldamount, true] call ZKB_fnc_UpdateShopStock;};	
		};
	};

call ZKB_fnc_UpdateShopBuyList;
call ZKB_fnc_UpdateShopSellList;