/*
    File: fn_Disarm.sqf
	Function: ZKB_fnc_Disarm
    Author: ZKB1325

    Description:
	First part of disarming that starts with the player doing the disarm
*/
private _disarmUnit = param [0,objNull,[objNull]];
if (isNull _disarmUnit) exitWith {closeDialog 0; ["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if (!([_disarmUnit] call ZKB_fnc_IsRestrained) and !([_disarmUnit] call ZKB_fnc_IsSurrending)) exitWith {["STR_Cop_NotSurrenderingOrRestrained",[name _disarmUnit]] call ZKB_fnc_DynamicText;};

[player] remoteExecCall ["ZKB_fnc_Disarmed",_disarmUnit,false];
["STR_Cop_Disarming",[name _disarmUnit]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsDisarmedPlayer",name player,name _disarmUnit] call ZKB_fnc_AdminAddPlayerLog;

