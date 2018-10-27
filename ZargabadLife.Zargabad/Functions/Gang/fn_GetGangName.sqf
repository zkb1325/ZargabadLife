/*
	Author: ZKB1325
	File: fn_GetGangName.sqf
	Function: ZKB_fnc_GetGangName
	Description: Takes a player or player UID and returns the name of that players gang
*/
private ["_playeruid","_gangnamereturn","_currentgangarray"];
_playeruid = _this select 0;
if (typeName _playeruid == "OBJECT") then {_playeruid = getPlayerUID _playeruid;};
_gangnamereturn = "";

_currentgangarray = ([_playeruid] call ZKB_fnc_FindGang) select 0;

if (count _currentgangarray == 0) exitWith {_gangnamereturn;};

if (count _currentgangarray > 0) then {_gangnamereturn = (_currentgangarray select 0);};

_gangnamereturn;