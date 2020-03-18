/*
	Author: ZKB1325
	File: fn_LeaveGang.sqf
	Function: ZKB_fnc_LeaveGang
	Description: Handles the player joining a gang
*/

if !([player] call ZKB_fnc_IsGangMember) exitWith {["STR_Gang_NotInGang"] call ZKB_fnc_DynamicText;};
["STR_Admin_PlayerLogsLeftGang",name player,[getPlayerUID player] call ZKB_fnc_GetGangName] call ZKB_fnc_AdminAddPlayerLog;

closeDialog 0;

[getPlayerUID player] call ZKB_fnc_RemoveFromGang;

["STR_Gang_LeftGang"] call ZKB_fnc_DynamicText;