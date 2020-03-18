#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_OpenAdminMenu.sqf
	Function: ZKB_fnc_OpenAdminMenu
	Description: Opens Admin menu

*/
#define MYADMINLEVEL (getNumber (missionConfigFile >> "Admins" >> (getPlayerUID player) >> "adminLevel"))
if (dialog) exitWith {};
disableSerialization;
createDialog "ZKB_Admin";
private _display = uiNamespace getVariable "ZKB_Admin";
private _commandListCtrl = _display displayCtrl 50001;
private _playerListCtrl = _display displayCtrl 50002;

private _commandConfigs = "true" configClasses (missionConfigFile >> "AdminCommands");
{
{
(_display displayCtrl _x) ctrlShow false;
}forEach (getArray (_x >> "menuIDC"));
}forEach _commandConfigs;

lbClear _playerListCtrl;
_playerListCtrl lbAdd ("  " + localize "STR_Admin_Nothing");
{
private _index = _playerListCtrl lbAdd (name _x);
_playerListCtrl lbSetData [_index,getPlayerUID _x];
}forEach playableUnits;
lbSort [_playerListCtrl, "ASC"];
_playerListCtrl lbSetCurSel 0;

{
private _condition = (getText (_x >> "condition"));
if (_condition isEqualTo "") then {_condition = "true";};

if ((MYADMINLEVEL >= (getNumber (_x >> "reqAdminLevel"))) and (call compile _condition)) then
	{
	_index = _commandListCtrl lbAdd (getText (_x >> "displayName"));
	_commandListCtrl lbSetData [_index,configNAme _x];
	_commandListCtrl lbSetTooltip [_index,(getText (_x >> "description"))];
	};
}forEach _commandConfigs;
