/*
    File: fn_RestrainPlayer.sqf
	Function: ZKB_fnc_RestrainPlayer
    Author: ZKB1325

    Description:
	Passes restraining from client who wants to do the restraining to the restrained or unRestrains them
*/
private _restrainedPlayer = param [0,objNull,[objNull]];
if (isNull _restrainedPlayer) exitWith {closeDialog 0; ["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};

if ([_restrainedPlayer] call ZKB_fnc_IsRestrained) then 
	{
	_restrainedPlayer setVariable ["restrained",false,true];
	["STR_Cop_UnRestrainedPlayer",[name _restrainedPlayer]] call ZKB_fnc_DynamicText;
	["STR_Admin_PlayerLogsUnRestrainedPlayer",name _restrainedPlayer,name player] call ZKB_fnc_AdminAddPlayerLog;
	}
	else
	{
	if (!([_restrainedPlayer] call ZKB_fnc_IsSurrending) and !([_restrainedPlayer] call ZKB_fnc_IsKnockedOut)) exitWith {["STR_Cop_NotSurrendering",[name _restrainedPlayer]] call ZKB_fnc_DynamicText;};
	["STR_Cop_RestrainedBy",[name _restrainedPlayer,name player]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	[] remoteExec ["ZKB_fnc_Restrain",_restrainedPlayer,false];
	["STR_Admin_PlayerLogsRestrainedPlayer",name _restrainedPlayer,name player] call ZKB_fnc_AdminAddPlayerLog;
	};