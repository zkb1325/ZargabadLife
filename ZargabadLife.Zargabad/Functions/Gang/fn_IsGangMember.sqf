/*
	Author: ZKB1325
	File: fn_IsGangMember.sqf
	Function: ZKB_fnc_IsGangMember
	Description: Takes a player or player UID and returns true/false if in a gang
*/
private ["_playeruid","_ingangreturn","_currentgangarray"];
_playeruid = _this select 0;
if (typeName _playeruid == "OBJECT") then {_playeruid = getPlayerUID _playeruid;};
_ingangreturn = false;

_currentgangarray = ([_playeruid] call ZKB_fnc_FindGang) select 0;

if (count _currentgangarray > 0) then {_ingangreturn = true;};

_ingangreturn;