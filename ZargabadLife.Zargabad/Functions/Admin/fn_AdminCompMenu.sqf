#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_AdminCompMenu.sqf
	Function: ZKB_fnc_AdminCompMenu
	Description: Fills the item list for the comp menu

*/
private _display = uiNamespace getVariable "ZKB_Admin";
private _itemListCtrl = _display displayCtrl 50027;
private _itemInfoFilter = (missionNamespace getVariable ["itemInfoFilter",[[],[]]]);
private _itemNameFilter = _itemInfoFilter select 0;
private _itemTypeFilter = _itemInfoFilter select 1;


lbClear _itemListCtrl;

if (MYADMINLEVEL < 5) exitWith 
	{
	{
	(_display displayCtrl _x) ctrlShow false;
	}forEach [50026,50027,50028,50029,50030,50031,50032,50033,50034,50035,50036,50037,50038];
	};
{
private _item = configName _x;
if (((_itemNameFilter findIf {(toLower ([_item] call ZKB_fnc_GetItemName)) find (toLower _x) >= 0}) >= 0) or (_itemNameFilter isEqualTo [])) then 
	{
	if (((_itemTypeFilter findIf {(toLower ([_item] call ZKB_fnc_GetItemType)) find (toLower _x) >= 0}) >= 0) or (_itemTypeFilter isEqualTo [])) then
		{
		private _index = _itemListCtrl lbAdd ([_item] call ZKB_fnc_GetItemName);
		_itemListCtrl lbSetData [_index, _item];
		};
	};
}forEach ("true" configClasses (missionConfigFile >> "Item_Config"));

lbSort [_itemListCtrl, "ASC"];
_itemListCtrl lbSetCurSel 0;

private _curFiltersCtrl = (_display displayCTRL 50036);
private _filtersString = "";
private _itemNameFilters = "";
private _itemTypeFilters = "";
_itemInfoFilter = (missionNamespace getVariable ["itemInfoFilter",[[],[]]]);
_itemNameFilter = _itemInfoFilter select 0;
_itemTypeFilter = _itemInfoFilter select 1;

{
_itemNameFilters = _itemNameFilters + format [" %1%2",str _x,if (isNil {_itemNameFilter select (_forEachIndex + 1)}) then {""}else{","}];
}forEach _itemNameFilter;

{
_itemTypeFilters = _itemTypeFilters + format [" %1%2",str _x,if (isNil {_itemTypeFilter select (_forEachIndex + 1)}) then {""}else{","}];
}forEach _itemTypeFilter;

_filtersString = format [localize "STR_MainMenu_ItemInfoCurFilters",_itemNameFilters,_itemTypeFilters];
_curFiltersCtrl ctrlSetStructuredText parseText _filtersString;

_curFiltersCtrl ctrlSetPosition [(ctrlPosition _curFiltersCtrl) select 0, (ctrlPosition _curFiltersCtrl) select 1, ctrlTextWidth _curFiltersCtrl, (ctrlPosition _curFiltersCtrl) select 3];
_curFiltersCtrl ctrlCommit 0;