/*
	Author: ZKB1325
	FileName: fn_OpenInventory.sqf
	Function: ZKB_fnc_OpenInventory
	Description: Handles filling the Inventory UI with info
*/
private ["_display","_itemlist","_playerlist","_index"];
disableserialization;
createDialog "ZKB_Inventory";

_display = uiNamespace getVariable "ZKB_Inventory";

_itemlist = (_display displayCTRL 2070);
_playerlist = (_display displayCTRL 2060);

_inv = player getVariable ["ZKB_Inventory",[]];

{
_index = _itemlist lbAdd format ["%1 - (%2)",([(_x select 0)] call ZKB_fnc_GetItemName), [(_x select 1)] call ZKB_fnc_FormatNumber];	
_itemlist lbSetData [_index, str _x];
}forEach _inv;

{
_index = _playerlist lbAdd format ["%1",name _x];	
_playerlist lbSetData [_index, getplayerUID _x];	
}forEach playableUnits;

lbSort [_playerlist, "ASC"];

_itemlist lbSetCurSel 0;
_playerlist lbSetCurSel 0;