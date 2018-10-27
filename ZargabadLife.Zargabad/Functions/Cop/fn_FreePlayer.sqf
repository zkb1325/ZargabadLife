/*
	File: fn_FreePlayer.sqf
	Function: ZKB_fnc_FreePlayer
	Author: ZKB1325
	Description: Frees a player from jail from the wanted menu
*/
private _player = param [0,"",[objNull,""]];
if (typeName _player isEqualTo typeName "") then {_player = [_player] call ZKB_fnc_GetPlayerFromID};
if (isNull _player) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};

if !(_player getVariable ["InJail",false]) exitWith {["STR_Cop_WantedMenuSetFreeNotInJail",[name _player]] call ZKB_fnc_DynamicText;};

_player setVariable ["InJail",false,true];
["STR_Cop_WantedMenuSetFreeBy",[name _player,name player]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];