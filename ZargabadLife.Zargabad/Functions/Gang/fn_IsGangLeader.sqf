/*
	Author: ZKB1325
	File: fn_IsGangLeader.sqf
	Function: ZKB_fnc_IsGangLeader
	Description: Takes a player or player UID and returns true/false if is gang leader
*/
private ["_playeruid","_isgangleaderreturn","_currentgangarray"];
_playeruid = _this select 0;
if (typeName _playeruid == "OBJECT") then {_playeruid = getPlayerUID _playeruid;};
_isgangleaderreturn = false;

_currentgangarray = ([_playeruid] call ZKB_fnc_FindGang) select 0;

if (count _currentgangarray == 0) exitWith {_isgangleaderreturn;};

if ((((_currentgangarray select 1) select 0) select 0) == _playeruid) then {_isgangleaderreturn = true;};

_isgangleaderreturn;