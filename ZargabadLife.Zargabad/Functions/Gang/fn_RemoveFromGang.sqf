#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_RemoveFromGang.sqf
	Function: ZKB_fnc_RemoveFromGang
	Description: Takes player or player UID and removes them from the gang they are in
*/
private ["_removedUID","_removedgangarray","_removedganginfo","_removedgangvar"];
_removedUID = _this select 0;
_removedgangarray = [_removedUID] call ZKB_fnc_FindGang;
_removedganginfo = _removedgangarray select 0;
_removedgangvar = _removedgangarray select 1;

_removedgangmembers = _removedganginfo select 1;

{
if ((_x select 0) == _removedUID) then
	{
	_removedgangmembers set [_forEachIndex, "Remove"];	
	};
}forEach _removedgangmembers;

_removedgangmembers = _removedgangmembers - ["Remove"];
_removedganginfo set [1, _removedgangmembers];

missionNameSpace setVariable [_removedgangvar, _removedganginfo, true];
if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
	{
	[] remoteExecCall ["ZKB_fnc_ServerUpdateGangSave",2,false];
	};

_removedunit = [_removedUID] call ZKB_fnc_GetPlayerFromID;

if !(isNull _removedunit) then
	{
	[_removedunit] joinSilent (grpNull);
	};