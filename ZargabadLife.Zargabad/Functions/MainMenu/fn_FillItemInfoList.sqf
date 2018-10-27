/*
	Author: ZKB1325
	File: fn_FillItemInfoList.sqf
	Function: ZKB_fnc_FillItemInfoList
	Description: Fills the list for the item info menu
*/
disableSerialization;
private _display = uiNamespace getVariable "ZKB_ItemInfo";
private _itemlist = (_display displayCTRL 6010);

private _itemInfoFilter = (missionNamespace getVariable ["itemInfoFilter",[[],[]]]);
private _itemNameFilter = _itemInfoFilter select 0;
private _itemTypeFilter = _itemInfoFilter select 1;

lbClear _itemlist;

{
private _item = configName _x;
if (((_itemNameFilter findIf {(toLower ([_item] call ZKB_fnc_GetItemName)) find (toLower _x) >= 0}) >= 0) or (_itemNameFilter isEqualTo [])) then 
	{
	if (((_itemTypeFilter findIf {(toLower ([_item] call ZKB_fnc_GetItemType)) find (toLower _x) >= 0}) >= 0) or (_itemTypeFilter isEqualTo [])) then
		{
		private _index = _itemlist lbAdd ([_item] call ZKB_fnc_GetItemName);
		_itemlist lbSetData [_index, _item];
		};
	};
}forEach ("true" configClasses (missionConfigFile >> "Item_Config"));

lbSort [_itemlist, "ASC"];
_itemlist lbSetCurSel 0;

private _curFilters = (_display displayCTRL 6080);
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
_curFilters ctrlSetStructuredText parseText _filtersString;

_curFilters ctrlSetPosition [(ctrlPosition _curFilters) select 0, (ctrlPosition _curFilters) select 1, ctrlTextWidth _curFilters, (ctrlPosition _curFilters) select 3];
_curFilters ctrlCommit 0;
