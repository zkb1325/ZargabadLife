/*
	File: fn_UpdateShopBuyList.sqf
	Function: ZKB_fnc_UpdateShopBuyList
	Author: ZKB1325
	Description: Updates the buy list of a shop
*/
private ["_shopData","_display","_buylist","_index","_itemstockarray","_itemstock","_itemmaxstock","_cost","_costtax","_demand","_finalcost"];
disableserialization;

_shopData = ZKB_shopobject getVariable "ShopData";
_shopstock = _shopData select 8;
_shopmaxstock = _shopData select 9;
_finalcost = 0;

_display = uiNameSpace getVariable "ZKB_ListMenu";

_buylist = _display displayCtrl 5010;
lbClear _buylist;

{
_itemstockarray = [_x, ZKB_shopobject] call ZKB_fnc_ShopGetItemStock;
_cost =  ([_x] call ZKB_fnc_GetItemBuyPrice) max 1;
_costtax =  ([_x] call ZKB_fnc_GetItemBuyPriceWithTax) max 1;
	
if !((_itemstockarray select 0) isEqualTo -1) then
	{
	_itemstock = _itemstockarray select 0;
	_itemmaxstock = _itemstockarray select 1;
	
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
		
	if (([_x] call ZKB_fnc_GetConfigByClass) == "VirtualItem") then
		{
		_index = _buylist lbAdd format [localize "STR_Shop_ListStockVirtItem", ([_x] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber), ([([_x] call ZKB_fnc_GetItemWeight)]call ZKB_fnc_FormatNumber), ([_itemstock] call ZKB_fnc_FormatNumber)];		
		_buylist lbSetTooltip [_index, format [localize "STR_Shop_CurStock",[_itemstock] call ZKB_fnc_FormatNumber,[_itemmaxstock] call ZKB_fnc_FormatNumber]];
		}
		else
		{
		_index = _buylist lbAdd format [localize "STR_Shop_ListStockGear", ([_x] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber), ([_itemstock] call ZKB_fnc_FormatNumber)];
		if ((([_x] call ZKB_fnc_GetConfigByClass) == "CfgVehicles") and !((([_x] call BIS_fnc_itemType) select 1) isEqualTo "Backpack")) then
			{
			_buylist lbSetTooltip [_index, format [localize "STR_Shop_TrunkSpaceStock",[_itemstock] call ZKB_fnc_FormatNumber,[_itemmaxstock] call ZKB_fnc_FormatNumber,[[_x] call ZKB_fnc_GetItemTrunkSpace] call ZKB_fnc_FormatNumber]];
			}
			else
			{
			_buylist lbSetTooltip [_index, format [localize "STR_Shop_CurStock",[_itemstock] call ZKB_fnc_FormatNumber,[_itemmaxstock] call ZKB_fnc_FormatNumber]];
			};
		};
	}
	else
	{
	if (ZKB_shopobject in ZKB_NonTaxedShops) then
		{
		_finalcost =  ([_x] call ZKB_fnc_GetItemBuyPrice);	
		}
		else
		{
		_finalcost =  ([_x] call ZKB_fnc_GetItemBuyPriceWithTax);
		};
	
	if (([_x] call ZKB_fnc_GetConfigByClass) == "VirtualItem") then
		{
		_index = _buylist lbAdd format [localize "STR_Shop_ListVirtItem", ([_x] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber), ([([_x] call ZKB_fnc_GetItemWeight)]call ZKB_fnc_FormatNumber)];		
		}
		else
		{
		_index = _buylist lbAdd format [localize "STR_Shop_ListGear", ([_x] call ZKB_fnc_GetItemName), ([_finalcost] call ZKB_fnc_FormatNumber)];
		if ((([_x] call ZKB_fnc_GetConfigByClass) == "CfgVehicles") and !((([_x] call BIS_fnc_itemType) select 1) isEqualTo "Backpack")) then
			{
			_buylist lbSetTooltip [_index, format [localize "STR_Shop_TrunkSpace",[[_x] call ZKB_fnc_GetItemTrunkSpace] call ZKB_fnc_FormatNumber]];
			};
		};
	};

_buylist lbSetData [_index, str [_x,_finalcost]];
_buylist lbSetPicture [_index, (getText (missionConfigFile >> "Item_Config" >> _x >> "className")) call ZKB_fnc_CfgGetPicture];
if (ZKB_shopobject in ZKB_NonTaxedShops) then
	{
	_buylist lbSetValue [_index,0];
	}
	else
	{
	_buylist lbSetValue [_index, floor (_costtax - _cost)];
	};
}forEach (_shopData select 4);