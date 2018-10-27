/*
	Author: ZKB1325
	FileName: fn_ItemInfoSelChange.sqf
	Function: ZKB_fnc_ItemInfoSelChange
	Description: Handles filling the Inventory UI with info
*/
private ["_seliteminfo","_display","_Iteminfobox","_iteminfotext"];
disableserialization;
_seliteminfo = (_this select 0);

_display = uiNamespace getVariable "ZKB_ItemInfo";
_Iteminfobox = (_display displayCTRL 6020);

_iteminfotext = "";

_iteminfotext = _iteminfotext + format [localize "STR_Inv_ItemName" + "<br/>", [_seliteminfo] call ZKB_fnc_GetItemName];
_iteminfotext = _iteminfotext + format [localize "STR_Inv_ItemWeight" + "<br/>", [[_seliteminfo] call ZKB_fnc_GetItemWeight] call ZKB_fnc_FormatNumber];
_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_TaxType" + "<br/>", [_seliteminfo] call ZKB_fnc_GetItemType];
_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_BuyPrice" + "<br/>", [[_seliteminfo] call ZKB_fnc_GetItemBuyPriceWithTax] call ZKB_fnc_FormatNumber];
_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_SellPrice" + "<br/>", [[_seliteminfo] call ZKB_fnc_GetItemSellPriceWithTax] call ZKB_fnc_FormatNumber];
_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_TrunkSpace" + "<br/>", [[_seliteminfo] call ZKB_fnc_GetItemTrunkSpace] call ZKB_fnc_FormatNumber];
_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_NeededCivLicense" + "<br/>", if (([_seliteminfo] call ZKB_fnc_GetItemLicenseCiv) == "") then {localize "STR_Common_None"}else{(([_seliteminfo] call ZKB_fnc_GetItemLicenseCiv) call ZKB_fnc_GetLicenseDisplayName)}];
_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_NeededCopLicense" + "<br/>", if (([_seliteminfo] call ZKB_fnc_GetItemLicenseCop) == "") then {localize "STR_Common_None"}else{(([_seliteminfo] call ZKB_fnc_GetItemLicenseCop) call ZKB_fnc_GetLicenseDisplayName)}];
_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_NeededLicenseBoth" + "<br/>", if (([_seliteminfo] call ZKB_fnc_GetItemLicenseBoth) == "") then {localize "STR_Common_None"}else{(([_seliteminfo] call ZKB_fnc_GetItemLicenseBoth) call ZKB_fnc_GetLicenseDisplayName)}];
_iteminfotext = _iteminfotext + format [localize "STR_Inv_ItemDesc" + "<br/><br/>", [_seliteminfo] call ZKB_fnc_GetItemDesc];
_iteminfotext = _iteminfotext + format [localize "STR_Inv_ItemCanDrop" + "<br/>", if ([_seliteminfo] call ZKB_fnc_GetItemCanDrop) then {localize "STR_Common_Yes"}else{localize "STR_Common_No"}];
_iteminfotext = _iteminfotext + format [localize "STR_Inv_ItemCanGive" + "<br/>", if ([_seliteminfo] call ZKB_fnc_GetItemCanGive) then {localize "STR_Common_Yes"}else{localize "STR_Common_No"}];
_iteminfotext = _iteminfotext + format [localize "STR_Inv_ItemIsIllegal" + "<br/><br/>", if ([_seliteminfo] call ZKB_fnc_GetItemIsIllegal) then {localize "STR_Common_Yes"}else{localize "STR_Common_No"}];

_iteminfotext = _iteminfotext + (localize "STR_MainMenu_ShopsAvailableAt" + "<br/>");

private _availableShop = false;
{
if ((_seliteminfo in (_x select 4)) or (_seliteminfo in (_x select 5))) then
	{
	_availableShop = true;
	private _buyCost = ([_seliteminfo] call ZKB_fnc_GetItemBuyPrice) max 1;
	private _buyCostWithTax = ([_seliteminfo] call ZKB_fnc_GetItemBuyPriceWithTax) max 1;
	private _sellCost =  ([_seliteminfo] call ZKB_fnc_GetItemSellPrice) max 1;
	private _sellCostWithTax =  ([_seliteminfo] call ZKB_fnc_GetItemSellPriceWithTax) max 1;
	
	private _curStock = (([_seliteminfo,(_x select 0)] call ZKB_fnc_ShopGetItemStock) select 0);
	private _maxStock = (([_seliteminfo,(_x select 0)] call ZKB_fnc_ShopGetItemStock) select 1);
	
	private _buyDemand = 0;
	private _sellDemand = 0;
	private _finalBuyCost = 0;
	private _finalSellCost = 0;
	
	if (_curStock isEqualTo -1) then 
		{
		if ((_x select 0) in ZKB_NonTaxedShops) then
			{
			_finalBuyCost = _buyCost;	
			}
			else
			{
			_finalBuyCost = _buyCostWithTax;
			};
		}
		else
		{
		if ((_x select 0) in ZKB_NonTaxedShops) then
			{
			_buyDemand = _buyCost*0.5*(_curStock-(_maxstock*0.5))/(0.5*_maxstock);
			_finalBuyCost = round((_buyCost*(_buyCost/_buyCost)) - _buyDemand);	
			}
			else
			{
			_buyDemand = _buyCostWithTax*0.5*(_curStock-(_maxstock*0.5))/(0.5*_maxstock);
			_finalBuyCost = round((_buyCost*(_buyCostWithTax/_buyCost)) - _buyDemand);
			};
		};
		
	if (_curStock isEqualTo -1) then 
		{
		if ((_x select 0) in ZKB_NonTaxedShops) then
			{
			_finalSellCost = _sellCost;	
			}
			else
			{
			_finalSellCost = _sellCostWithTax;
			};
		}
		else
		{
		if ((_x select 0) in ZKB_NonTaxedShops) then
			{
			_sellDemand = _sellCost*0.5*(_curStock-(_maxstock*0.5))/(0.5*_maxstock);
			_finalSellCost = round((_sellCost*(_sellCost/_sellCost)) - _sellDemand);	
			}
			else
			{
			_sellDemand = _sellCostWithTax*0.5*(_curStock-(_maxstock*0.5))/(0.5*_maxstock);
			_finalSellCost = round((_sellCost*(_sellCostWithTax/_sellCost)) - _sellDemand);
			};
		};
	_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_ShopItemInfo" + "<br/><br/>", localize (_x select 1),if (_seliteminfo in (_x select 4)) then {[_finalBuyCost] call ZKB_fnc_FormatNumber}else{localize "STR_MainMenu_ShopItemInfoNotBuyable"}, if (_seliteminfo in (_x select 5)) then {[_finalSellCost] call ZKB_fnc_FormatNumber}else{localize "STR_MainMenu_ShopItemInfoNotSellable"}, if (_curStock isEqualTo -1) then {localize "STR_Common_Unlimited"}else{([_curStock] call ZKB_fnc_FormatNumber)+"/"+([_maxStock] call ZKB_fnc_FormatNumber)}];
	};
}forEach ZKB_ShopDefines;

if !(_availableShop) then
	{
	_iteminfotext = _iteminfotext + (localize "STR_Common_None" + "<br/><br/>");
	};
	
_iteminfotext = _iteminfotext + (localize "STR_MainMenu_NeededFactoryItems" + "<br/>");

private _neededFacItems = [_seliteminfo] call ZKB_fnc_GetItemNeedFactoryItems;
if (_neededFacItems isEqualTo []) then
	{
	_iteminfotext = _iteminfotext + (localize "STR_Common_None");
	}
	else
	{
	private _facItemsCost = 0;
	{
	_iteminfotext = _iteminfotext + format ["%1 - (%2)<br/>",[(_x select 0)] call ZKB_fnc_GetItemName,[(_x select 1)] call ZKB_fnc_FormatNumber];
	_facItemsCost = _facItemsCost + (([(_x select 0)] call ZKB_fnc_GetItemBuyPriceWithTax)*(_x select 1));
	}forEach _neededFacItems;
	
	_iteminfotext = _iteminfotext + format [localize "STR_MainMenu_NeededFactoryItemsTotalCost" + "<br/>",[_facItemsCost] call ZKB_fnc_FormatNumber];
	};
	
	
_Iteminfobox ctrlSetStructuredText parseText _iteminfotext;

_Iteminfobox ctrlSetPosition [(ctrlPosition _Iteminfobox) select 0, (ctrlPosition _Iteminfobox) select 1, (ctrlPosition _Iteminfobox) select 2, ctrlTextHeight _Iteminfobox];
_Iteminfobox ctrlCommit 0;