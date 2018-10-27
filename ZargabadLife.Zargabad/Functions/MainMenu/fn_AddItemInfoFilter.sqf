/*
	Author: ZKB1325
	File: fn_AddItemInfoFilter.sqf
	Function: ZKB_fnc_AddItemInfoFilter
	Description: Fills the list for the item info menu
*/
private _nameFilter = param [0,"",[""]];
private _typeFilter = param [1,"",[""]];
private _itemInfoFilter = missionNamespace getVariable ["itemInfoFilter",[[],[]]];
private _itemNameFilter = _itemInfoFilter select 0;
private _itemTypeFilter = _itemInfoFilter select 1;

if !(_nameFilter isEqualTo "") then
	{
	_itemNameFilter pushBack _nameFilter;
	};

if !(_typeFilter isEqualTo "") then
	{
	_itemTypeFilter pushBack _typeFilter;
	};
missionNamespace setVariable ["itemInfoFilter",[_itemNameFilter,_itemTypeFilter]];

call ZKB_fnc_FillItemInfoList;