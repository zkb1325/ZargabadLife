/*
	File: fn_ExportFactoryItem.sqf
	Function: ZKB_fnc_ExportFactoryItem
	Author: ZKB1325
	Description: Runs when ever a player clicks the export button in a factory
*/

private _item = param [0,"",[""]];
if (_item isEqualTo "") exitWith {};


private _facarray = ZKB_OpenFactory getVariable "FactoryInfo";
private _facstoragecompleted = missionNameSpace getVariable [(_facarray select 6)+"StorageCompleted", []];
private _itemtype = ([_item] call ZKB_fnc_GetConfigByClass);

private _amountready = 0;	
{
if ((_x select 0) == _item) exitWith
	{
	_amountready = (_x select 1);
	};
}forEach _facstoragecompleted;
	
if (_amountready < 1) exitWith {["STR_Fac_ExportNoneReady",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;};

private _shopsToExportTo = [];

{
if (_item in (_x select 4) and (_x select 10) and ((((([_item,(_x select 0)] call ZKB_fnc_ShopGetItemStock) select 0) isEqualTo -1) and ZKB_IgnoreUnlimitedStock) or !((([_item,(_x select 0)] call ZKB_fnc_ShopGetItemStock) select 0) isEqualTo -1))) then
	{
	_shopsToExportTo pushBack (_x select 0);
	};
}forEach ZKB_ShopDefines;

if (_shopsToExportTo isEqualTo []) exitWith {["STR_Fac_ExportNoShop",[([_item] call ZKB_fnc_GetItemName)]] call ZKB_fnc_DynamicText;};

createDialog "ZKB_DynamicButtonMenu";

private _display = uiNameSpace getVariable "ZKB_DynamicButtonMenu";
private _btn1 = _display displayCtrl 15510;
private _frameCtrl = _display displayCtrl 15502;
_frameCtrl ctrlSetText localize "STR_Fac_Export";

private _price = [_item] call ZKB_fnc_GetItemBuyPrice;
private _priceWithTax = [_item] call ZKB_fnc_GetItemBuyPriceWithTax;

_btn1 ctrlSetText localize "STR_Common_Close";
_btn1 ctrlSetTooltip localize "STR_Common_Close";
_btn1 buttonSetAction "closeDialog 0;";


private _btnpos = ctrlPosition _btn1;
private _btnY = _btnpos select 1;

for "_i" from 0 to ((count _shopsToExportTo)-1) do
	{
	private _ctrl = _display ctrlCreate ["RscButton", -1, _display displayCtrl 15505];
	_btnpos set [1,_btnY + .08];
	_btnY = _btnpos select 1;
	_ctrl ctrlSetPosition _btnpos;
	_ctrl ctrlCommit 0;
	
	private _curStock = (([_item,(_shopsToExportTo select _i)] call ZKB_fnc_ShopGetItemStock) select 0);
	private _maxStock = (([_item,(_shopsToExportTo select _i)] call ZKB_fnc_ShopGetItemStock) select 1);
	private _demand = _priceWithTax*0.25*(_curStock-(_maxstock*0.5))/(0.5*_maxstock);
	private _exportPrice = round((_price*(_priceWithTax/_price)) - _demand);

	_ctrl ctrlSetText format ["%1 - $%2", (if (isLocalized (((_shopsToExportTo select _i) getVariable "ShopData") select 1)) then {localize (((_shopsToExportTo select _i) getVariable "ShopData") select 1)}else{(((_shopsToExportTo select _i) getVariable "ShopData") select 1)}),[_exportPrice] call ZKB_fnc_FormatNumber];
	_ctrl ctrlSetTooltip format [localize "STR_Fac_ExportBtnToolTip",([_item] call ZKB_fnc_GetItemName),(if (isLocalized (((_shopsToExportTo select _i) getVariable "ShopData") select 1)) then {localize (((_shopsToExportTo select _i) getVariable "ShopData") select 1)}else{(((_shopsToExportTo select _i) getVariable "ShopData") select 1)}),[_exportPrice] call ZKB_fnc_FormatNumber,if (_curStock isEqualTo -1) then {localize "STR_Common_Unlimited"}else{_curStock},if (_maxStock isEqualTo -1) then {localize "STR_Common_Unlimited"}else{_maxStock}];
	_ctrl buttonSetAction format ["[""%1"",%2] call ZKB_fnc_ExportedFactoryItem",_item,(_shopsToExportTo select _i)];
	};