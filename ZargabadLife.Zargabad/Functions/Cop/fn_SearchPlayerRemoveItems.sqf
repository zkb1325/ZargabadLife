/*
	File: fn_SearchPlayerRemoveItems.sqf
	Function: ZKB_fnc_SearchPlayerRemoveItems
	Author: ZKB1325
	Description: removes items from passed array
	
	0: Array
		Array of virtual items and amounts to remove [["Item",amount],...]
*/
private _items = _this;

{
_x call ZKB_fnc_InvRemoveItem;
}forEach _items;