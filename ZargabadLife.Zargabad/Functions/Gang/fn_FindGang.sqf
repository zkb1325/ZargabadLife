/*
	Author: ZKB1325
	File: fn_FindGang.sqf
	Function: ZKB_fnc_FindGang
	Description: Takes a player or player UID and returns the gang array they are in and the missionNameSpace variable the array is attached to [["Gang Name", [["GangMemberUID","GangMemberName"],["GangMemberUID","GangMemberName"],...], true/false (Locked)], "missionNameSpace Variable"]
*/
private ["_playeruid","_return","_gangarray"];
_playeruid = _this select 0;
if (typeName _playeruid == "OBJECT") then {_playeruid = getPlayerUID _playeruid;};
_return = [[],""];

{
_gangarray = missionNameSpace getVariable [format ["GangArray_%1", _x],[]];	
if (({_x find _playeruid >= 0}count (_gangarray select 1)) > 0) exitWith {_return = [_gangarray,format ["GangArray_%1", _x]];};

}forEach (missionNameSpace getVariable ["ZKB_GangIndexArray",[]]);

_return;