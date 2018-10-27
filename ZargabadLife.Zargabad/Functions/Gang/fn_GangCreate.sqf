#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_GangCreate.sqf
	Function: ZKB_fnc_GangCreate
	Description: Handles Opening the gang create menu
*/

if ([player] call ZKB_fnc_IsGangMember) exitWith {["STR_Gang_AlreadyInGang"] call ZKB_fnc_DynamicText;};
disableserialization;
closeDialog 0;
createDialog "ZKB_GangCreate";

private _display = uiNamespace getVariable "ZKB_GangCreate";
private _editBox = _display displayCtrl 19020;
private _newGangInfo = _display displayCtrl 19040;
_editBox ctrlSetText format ["%1's Gang",name player];
_newGangInfo ctrlSetStructuredText parseText format [localize "STR_Gang_NewGangInfo",[SETTING(getNumber,"ZKB_GangCreateCost")] call ZKB_fnc_FormatNumber];