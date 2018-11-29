/*
	Author: ZKB1325
	FileName: fn_AdminTPTo.sqf
	Function: ZKB_fnc_AdminTPTo
	Description: TP you to the selected player

*/
private _player = param [0,"",[objNull,""]];
if (_player isEqualTo "" or _player isEqualTo objNull) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
private _includeVeh = param [1,false,[false]];
if (typeName _player isEqualTo typeName "") then
	{
	_player = [_player] call ZKB_fnc_GetPlayerFromID;
	};
if (isnull _player) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
private _tpPlayer = if (_includeVeh) then {vehicle player;}else{player;};

player setVariable ["TPReturnPos",[getposATL _tpPlayer,_includeVeh],true];
player allowDamage false;

if (_includeVeh) then
	{
	private _tpPos = (getPosATL _player) findEmptyPosition [1, 12, typeOf _tpPlayer];
	if (_tpPos isEqualTo []) then {_tpPos = position _player;};
	_tpPlayer setPosATL _tpPos;
	["STR_Admin_TeleportToMsgWithVeh",[name _player]] call ZKB_fnc_DynamicText;
	["STR_Admin_TeleportToMsgWithVehEnd",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_player,false];
	}
	else
	{
	_tpPlayer setPosATL (getPosATL _player);
	["STR_Admin_TeleportToMsg",[name _player]] call ZKB_fnc_DynamicText;
	["STR_Admin_TeleportToMsgEnd",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_player,false];
	};
	
["STR_Admin_AdminLogTpTo",name player,name _player] call ZKB_fnc_AdminAddAdminLog;

[] spawn
	{
	sleep 5;
	player allowDamage true;
	};