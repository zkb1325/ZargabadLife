/*
	Author: ZKB1325
	FileName: fn_AdminTPHere.sqf
	Function: ZKB_fnc_AdminTPHere
	Description: TP selected player to you

*/
private _player = param [0,"",[objNull,""]];
if (_player isEqualTo "" or _player isEqualTo objNull) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
private _includeVeh = param [1,false,[false]];
if (typeName _player isEqualTo typeName "") then
	{
	_player = [_player] call ZKB_fnc_GetPlayerFromID;
	};
if (isnull _player) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
private _tpPlayer = if (_includeVeh) then {vehicle _player;}else{_player;};

_player setVariable ["TPReturnPos",[getposATL _tpPlayer,_includeVeh],true];
player allowDamage false;

if (_includeVeh) then
	{
	private _tpPos = (getPosATL player) findEmptyPosition [1, 12, typeOf _tpPlayer];
	if (_tpPos isEqualTo []) then {_tpPos = position player;};
	_tpPlayer setPosATL _tpPos;
	["STR_Admin_TeleportHereMsgWithVeh",[name _player]] call ZKB_fnc_DynamicText;
	["STR_Admin_TeleportHereMsgWithVehEnd",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_player,false];
	}
	else
	{
	_tpPlayer setPosATL (getPosATL player);
	["STR_Admin_TeleportHereMsg",[name _player]] call ZKB_fnc_DynamicText;
	["STR_Admin_TeleportHereMsgEnd",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_player,false];
	};

["STR_Admin_AdminLogTpHere",name player,name _player] call ZKB_fnc_AdminAddAdminLog;
	
[] spawn
	{
	sleep 5;
	player allowDamage true;
	};