/*
	Author: ZKB1325
	File: fn_GetGangMembers.sqf
	Function: ZKB_fnc_GetGangMembers
	Description: Takes a player or player UID or already existing gang array and returns array of gang member UID's and names
	[[uids],[names]]
*/
private _passedvar = _this select 0;
private _currentgangarray = [];
if (typeName _passedvar == "STRING") then {_currentgangarray = ([_passedvar] call ZKB_fnc_FindGang) select 0;};
if (typeName _passedvar == "OBJECT") then {_currentgangarray = ([getPlayerUID _passedvar] call ZKB_fnc_FindGang) select 0;};
if (typeName _passedvar == "ARRAY") then {_currentgangarray = _passedvar;};
private _gangMemberUidReturn = [];
private _gangMemberNamesReturn = [];


if (count _currentgangarray == 0) exitWith {[[],[]];};

{
_gangMemberUidReturn pushBack (_x select 0);	
_gangMemberNamesReturn pushBack (_x select 1);	
}forEach (_currentgangarray select 1);

[_gangMemberUidReturn,_gangMemberNamesReturn];