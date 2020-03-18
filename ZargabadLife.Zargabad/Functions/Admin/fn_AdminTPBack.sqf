/*
	Author: ZKB1325
	FileName: fn_AdminTPBack.sqf
	Function: ZKB_fnc_AdminTPBack
	Description: TP selected player back to last pos

*/
private _player = param [0,"",[objNull,""]];
if (_player isEqualTo "" or _player isEqualTo objNull) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if (typeName _player isEqualTo typeName "") then
	{
	_player = [_player] call ZKB_fnc_GetPlayerFromID;
	};
if (isnull _player) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if (isNil {_player getVariable "TPReturnPos"}) exitWith {["STR_Admin_TeleportBackNoPos",[name _player]] call ZKB_fnc_DynamicText;};
private _returnPos = (_player getVariable "TPReturnPos") select 0;
private _returnInVeh = (_player getVariable "TPReturnPos") select 1;
_player = if (_returnInVeh) then {vehicle _player;}else{_player};
_player setPosATL _returnPos;
_player setVariable ["TPReturnPos",nil,true];
["STR_Admin_TeleportBackMsg",[name _player]] call ZKB_fnc_DynamicText;
["STR_Admin_TeleportBackMsgEnd",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_player,false];

["STR_Admin_AdminLogTpBack",name player,name _player] call ZKB_fnc_AdminAddAdminLog;

if (_player isEqualTo player) then
	{
	player allowDamage false;
		
	[] spawn
		{
		sleep 5;
		player allowDamage true;
		};
	};