/*
	Author: ZKB1325
	File: fn_ItemInfoMenu.sqf
	Function: ZKB_fnc_ItemInfoMenu
	Description: Opens the item info menu
*/
disableserialization;
createDialog "ZKB_ItemInfo";

private _display = uiNamespace getVariable "ZKB_ItemInfo";
private _spawnBtnCtrl = _display displayCtrl 6031;

if (!(serverCommandAvailable "#lock") and !((getPlayerUID player) in (getArray (missionConfigFile >> "enableDebugConsole")))) then
	{
	_spawnBtnCtrl ctrlShow false;
	};

call ZKB_fnc_FillItemInfoList;