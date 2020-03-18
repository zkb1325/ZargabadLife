/*
	Author: ZKB1325
	FileName: fn_ExecAdminCommand.sqf
	Function: ZKB_fnc_ExecAdminCommand
	Description: Takes passed admin command class and runs function assigned to it.
	Passes command index from the list menu

*/
disableSerialization;

private _commandClass = param [0,"",[""]];
if (_commandClass isEqualTo "") exitWith {};
if (_commandClass isEqualTo "") exitWith {};
private _selectedPlayer = param [1,"",[""]];
private _listCtlr = param [2,controlNull,[controlNull]];
private _commandIndex = param [3,-1,[0]];
private _display = uiNamespace getVariable "ZKB_Admin";
private _playerListCtrl = _display displayCtrl 50002;

lbClear _playerListCtrl;
_playerListCtrl lbAdd ("  " + localize "STR_Admin_Nothing");
{
private _index = _playerListCtrl lbAdd (name _x);
_playerListCtrl lbSetData [_index,getPlayerUID _x];
}forEach playableUnits;
lbSort [_playerListCtrl, "ASC"];

{
{
(_display displayCtrl _x) ctrlShow false;
}forEach (getArray (_x >> "menuIDC"));
}forEach ("true" configClasses (missionConfigFile >> "AdminCommands"));

{
(_display displayCtrl _x) ctrlShow true;
}forEach (getArray (missionConfigFile >> "AdminCommands" >> _commandClass >> "menuIDC"));

private _function = (getText (missionConfigFile >> "AdminCommands" >> _commandClass >> "function"));
if (_function isEqualTo "") exitWith {};
private _selectedPlayerObject = objNull;
if !(_selectedPlayer isEqualTo "") then
	{
	_selectedPlayerObject = [_selectedPlayer] call ZKB_fnc_GetPlayerFromID;
	};
_function = call compile _function;
[_selectedPlayerObject,_listCtlr,_commandIndex] call _function;