/*
	Author: ZKB1325
	FileName: fn_AdminGodMode.sqf
	Function: ZKB_fnc_AdminGodMode
	Description: Gives the player god mode. Toggles

*/
disableSerialization;
private _listCtrl = param [1,controlNull];
private _listIndex = param [2,-1];
if (isNil "ZKB_AdminGodModeEnabled") then
	{
	ZKB_AdminGodModeEnabled = player addEventHandler ["HandleDamage",{false}];
	["STR_Admin_GodModeEnabled"] call ZKB_fnc_DynamicText;
	["STR_Admin_AdminLogEnableGodMode",name player] call ZKB_fnc_AdminAddAdminLog;
	if !(isNull _listCtrl) then
		{
		_listCtrl lbSetColor [_listIndex,[0,1,0,1]];
		};
	}
	else
	{
	player removeEventHandler ["HandleDamage",ZKB_AdminGodModeEnabled];
	ZKB_AdminGodModeEnabled = nil;
	["STR_Admin_GodModeDisabled"] call ZKB_fnc_DynamicText;
	["STR_Admin_AdminLogDisabledGodMode",name player] call ZKB_fnc_AdminAddAdminLog;
	if !(isNull _listCtrl) then
		{
		_listCtrl lbSetColor [_listIndex,[1,0,0,1]];
		};
	};