#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_UpdateLaw.sqf
	Function: ZKB_fnc_UpdateLaw
	Description: Handles updating laws
*/
private _lawIndex = param [0,0,[0]];
if (_lawIndex isEqualTo -1) exitWith {};
private _lawString = param [1,"",[""]];
private _forced = param [2,false];

if (!(call ZKB_fnc_IsMayor) and !_forced) exitWith {};

disableSerialization;
private _display = uiNamespace getVariable "ZKB_LawEditMenu";
private _lawListCtrl = _display displayCtrl 22010;

_lawListCtrl lbSetText [_lawIndex,format ["%1: %2",_lawIndex+1,_lawString]];
_lawListCtrl lbSetData [_lawIndex,_lawString];

ZKB_LawArray set [_lawIndex,_lawString]; 
publicVariable "ZKB_LawArray";

format [localize "STR_Law_LawChanged",_lawIndex+1, _lawString] remoteExecCall ["hint",0,false];
["STR_Admin_AdminLogsChangedLaw",name player,_lawIndex+1,_lawString] call ZKB_fnc_AdminAddAdminLog;
if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
	{
	["laws",ZKB_LawArray] remoteExecCall ["ZKB_fnc_ServerSaveStats",2,false];
	};
