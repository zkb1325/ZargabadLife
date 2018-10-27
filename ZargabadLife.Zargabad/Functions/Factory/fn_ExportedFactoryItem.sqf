/*
	File: fn_ExportedFactoryItem.sqf
	Function: ZKB_fnc_ExportedFactoryItem
	Author: ZKB1325
	Description: Runs when ever a player clicks the export button in a factory
*/

private _item = param [0,"",[""]];
if (_item isEqualTo "") exitWith {};
private _shop = param [1,objNull,[objNull]];
if (isNull _shop) exitWith {};


private _price = [_item] call ZKB_fnc_GetItemBuyPrice;
private _priceWithTaxe = [_item] call ZKB_fnc_GetItemBuyPriceWithTax;
private _curStock = (([_item,_shop] call ZKB_fnc_ShopGetItemStock) select 0);
private _maxStock = (([_item,_shop] call ZKB_fnc_ShopGetItemStock) select 1);
private _stockIndex = (([_item,_shop] call ZKB_fnc_ShopGetItemStock) select 2);
private _demand = _priceWithTaxe*0.25*(_curStock-(_maxstock*0.5))/(0.5*_maxstock);
private _exportPrice = round((_price*(_priceWithTaxe/_price)) - _demand);

if ((_curStock+1 > _maxStock) and !(_curStock isEqualTo -1)) exitWith {["STR_Fac_ExportMaxStock",[(if (isLocalized ((_shop getVariable "ShopData") select 1)) then {localize ((_shop getVariable "ShopData") select 1)}else{((_shop getVariable "ShopData") select 1)}),([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;};

[ZKB_OpenFactory,"Remove",_item,1] call ZKB_fnc_UpdateFacStorageCompleted;
[ZKB_OpenFactory, "Add", ["Money", _exportPrice], _exportPrice, true] call ZKB_fnc_UpdateFacStorage;
[_shop,_stockIndex,1,true] call ZKB_fnc_UpdateShopStock;

["STR_Fac_Exported",[(if (isLocalized ((_shop getVariable "ShopData") select 1)) then {localize ((_shop getVariable "ShopData") select 1)}else{((_shop getVariable "ShopData") select 1)}),([_item] call ZKB_fnc_GetItemName),[_exportPrice] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;

closeDialog 0;