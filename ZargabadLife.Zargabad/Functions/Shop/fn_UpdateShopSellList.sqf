/*
	File: fn_UpdateShopSellList.sqf
	Function: ZKB_fnc_UpdateShopSellList
	Author: ZKB1325
	Description: Updates the sell list of a shop
*/
private ["_display","_shopData","_selllist","_index","_itemstockarray","_itemstock","_itemmaxstock","_cost","_costtax","_demand","_finalcost","_nearvehlist","_vehitem","_gearitem"];
disableserialization;

_shopData = ZKB_shopobject getVariable "ShopData";
_shopstock = _shopData select 8;
_shopmaxstock = _shopData select 9;
_finalcost = 0;
_demand = 0;
_nearvehlist = [];
ZKB_TempSellVehList = [];

_display = uiNameSpace getVariable "ZKB_ListMenu";

_selllist = _display displayCtrl 5020;
lbClear _selllist;


_playersgearitems = ([player, [0]] call ZKB_fnc_GetPlayerGear);

{
_itemstockarray = [_x, ZKB_shopobject] call ZKB_fnc_ShopGetItemStock;
private _itemClassName = getText (missionConfigFile >> "Item_Config" >> _x >> "className");

if !((_itemstockarray select 0) isEqualTo -1) then
	{
	_itemstock = _itemstockarray select 0;
	_itemmaxstock = _itemstockarray select 1;
	
	_cost =  ([_x] call ZKB_fnc_GetItemSellPrice) max 1;
	_costtax =  ([_x] call ZKB_fnc_GetItemSellPriceWithTax) max 1;
	
	if (ZKB_shopobject in ZKB_NonTaxedShops) then
		{
		_demand = _cost*0.5*(_itemstock-(_itemmaxstock*0.5))/(0.5*_itemmaxstock);
		_finalcost = round((_cost*(_cost/_cost)) - _demand);
		}
		else
		{
		_demand = _costtax*0.5*(_itemstock-(_itemmaxstock*0.5))/(0.5*_itemmaxstock);
		_finalcost = round((_cost*(_costtax/_cost)) - _demand);
		};
	
	if (([_itemClassName] call ZKB_fnc_GetConfigByClass) == "VirtualItem") then
		{
		if (([_x] call ZKB_fnc_GetInvItemAmount) > 0) then
			{
			_index = _selllist lbAdd format [localize "STR_Shop_SellListVirtItem", ([_x] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber), ([([_x] call ZKB_fnc_GetItemWeight)]call ZKB_fnc_FormatNumber), ([([_x] call ZKB_fnc_GetInvItemAmount)]call ZKB_fnc_FormatNumber)];	
			_selllist lbSetData [_index, str [_x, _finalcost]];
			_selllist lbSetPicture [_index, (_itemClassName) call ZKB_fnc_CfgGetPicture];
			};
		}
		else
		{
		if ((([_itemClassName] call ZKB_fnc_GetConfigByClass) == "CfgVehicles") and !((([_itemClassName] call BIS_fnc_itemType) select 1) isEqualTo "Backpack")) then
			{
			_vehitem = _itemClassName;
			{
			if ((_vehitem == (typeof _x)) and _x in (player getVariable ["ZKB_Keys",[]])) then
				{
				_index = _selllist lbAdd format [localize "STR_Shop_SellListVeh", ([_vehitem] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber), _x getVariable ["plate",_x]];	
				_selllist lbSetData [_index, str [_vehitem, _finalcost]];
				_selllist lbSetPicture [_index, (_itemClassName) call ZKB_fnc_CfgGetPicture];
				_nearvehlist pushBack _x;
				};
			}forEach (nearestObjects [ZKB_shopobject,["motorcycle","Car","Tank","Ship","Air"],25]);
			ZKB_TempSellVehList = _nearvehlist;
			}
			else
			{
			_gearitem = _itemClassName;
			if (_gearitem in _playersgearitems) then
				{
				_gearitemamount = {_x == _gearitem}count _playersgearitems;
				_index = _selllist lbAdd format [localize "STR_Shop_SellListGear", ([_x] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber),([_gearitemamount]call ZKB_fnc_FormatNumber)];	
				_selllist lbSetData [_index, str [_x, _finalcost]];
				_selllist lbSetPicture [_index, (_itemClassName) call ZKB_fnc_CfgGetPicture];
				};
			};
		};
	}
	else
	{
	
	if (ZKB_shopobject in ZKB_NonTaxedShops) then
		{
		_finalcost =  round ([_x] call ZKB_fnc_GetItemSellPrice);
		}
		else
		{
		_finalcost =  round ([_x] call ZKB_fnc_GetItemSellPriceWithTax);
		};
		
	if (([_itemClassName] call ZKB_fnc_GetConfigByClass) == "VirtualItem") then
		{
		if (([_x] call ZKB_fnc_GetInvItemAmount) > 0) then
			{
			_index = _selllist lbAdd format [localize "STR_Shop_SellListVirtItem", ([_x] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber), ([([_x] call ZKB_fnc_GetItemWeight)]call ZKB_fnc_FormatNumber), ([([_x] call ZKB_fnc_GetInvItemAmount)]call ZKB_fnc_FormatNumber)];
			_selllist lbSetData [_index, str [_x, _finalcost]];
			_selllist lbSetPicture [_index, (_itemClassName) call ZKB_fnc_CfgGetPicture];
			};
		}
		else
		{
		if (([_itemClassName] call ZKB_fnc_GetConfigByClass) == "CfgVehicles") then
			{
			_vehitem = _itemClassName;
			{
			if ((_vehitem == (typeof _x)) and _x in (player getVariable ["ZKB_Keys",[]])) then
				{
				_index = _selllist lbAdd format [localize "STR_Shop_SellListVeh", ([_vehitem] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber), _x getVariable ["plate",_x]];	
				_selllist lbSetData [_index, str [_vehitem, _finalcost]];
				_selllist lbSetPicture [_index, (_itemClassName) call ZKB_fnc_CfgGetPicture];
				_nearvehlist pushBack _x;
				};
			}forEach (nearestObjects [ZKB_shopobject,["motorcycle","Car","Tank","Ship","Air"],25]);
			ZKB_TempSellVehList = _nearvehlist;
			}
			else
			{
			_gearitem = _itemClassName;
			if (_gearitem in _playersgearitems) then
				{
				_gearitemamount = {_x == _gearitem}count _playersgearitems;
				_index = _selllist lbAdd format [localize "STR_Shop_SellListGear", ([_x] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber),([_gearitemamount]call ZKB_fnc_FormatNumber)];	
				_selllist lbSetData [_index, str [_x, _finalcost]];
				_selllist lbSetPicture [_index, (_itemClassName) call ZKB_fnc_CfgGetPicture];
				};
			};
		};	
	};

}forEach (_shopData select 5);