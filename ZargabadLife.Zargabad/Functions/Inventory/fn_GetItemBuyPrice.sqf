/*
	Author: ZKB1325
	FileName: fn_GetItemBuyPrice.sqf
	Function: ZKB_fnc_GetItemBuyPrice
	Description: Returns the buy price of an item before taxes
*/
private _classname = param [0,"",[""]];
private _buyPrice = 0;
_buyPrice = getNumber (missionConfigFile >> "Item_Config" >> _classname >> "buyPirce");
if (_buyPrice isEqualTo -1) then
	{
	private _reqResources = [_classname] call ZKB_fnc_GetItemNeedFactoryItems;
	
	{
	_buyPrice = _buyPrice + (([(_x select 0)] call ZKB_fnc_GetItemBuyPrice)*(_x select 1));
	}forEach _reqResources;
	};
_buyPrice;