/*
	File: fn_OpenWantedMenu.sqf
	Function: ZKB_fnc_OpenWantedMenu
	Author: ZKB1325
	Description: Opens the wanted menu were the player can pardon a player or set them wanted
*/
disableSerialization;
closeDialog 0;
createDialog "ZKB_WantedRelease";
private _display = uiNamespace getVariable "ZKB_WantedRelease";
private _playerWantedListCtrl = _display displayCtrl 16020;
private _playerFreeListCtrl = _display displayCtrl 16070;

{
if (side _x isEqualTo civilian) then
	{
	private _index = _playerWantedListCtrl lbAdd (name _x);
	_playerWantedListCtrl lbSetData [_index,getPlayerUID _x];
	};
}forEach playableUnits;
lbSort [_playerWantedListCtrl, "ASC"];

{
if (side _x isEqualTo civilian) then
	{
	private _index = _playerFreeListCtrl lbAdd (name _x);
	_playerFreeListCtrl lbSetData [_index,getPlayerUID _x];
	};
}forEach playableUnits;
lbSort [_playerFreeListCtrl, "ASC"];
