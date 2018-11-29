#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_AdminHealPlayer.sqf
	Function: ZKB_fnc_AdminHealPlayer
	Description: Heals the selected player

*/
private _healedPlayer = param [0,objNull,[objNull]];
if (isNull _healedPlayer and (MYADMINLEVEL >= 3))  exitWith {player setDamage 0; vehicle player setDamage 0; ["STR_Admin_AdminLogHealedSelf",name player] call ZKB_fnc_AdminAddAdminLog;};
if (isNull _healedPlayer) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if (_healedPlayer isEqualTo player) exitWith {player setDamage 0; vehicle player setDamage 0; ["STR_Admin_AdminLogHealedSelf",name player] call ZKB_fnc_AdminAddAdminLog;};

_healedPlayer setDamage 0;
vehicle _healedPlayer setDamage 0;
["STR_Admin_HealedPlayerMsg",[name _healedPlayer]] call ZKB_fnc_DynamicText;
["STR_Admin_HealPlayerMsg",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_healedPlayer,false];

["STR_Admin_AdminLogHealedPlayer",name player,name _healedPlayer] call ZKB_fnc_AdminAddAdminLog;