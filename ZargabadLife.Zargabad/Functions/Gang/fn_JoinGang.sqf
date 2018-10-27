/*
	Author: ZKB1325
	File: fn_JoinGang.sqf
	Function: ZKB_fnc_JoinGang
	Description: Handles the player joining a gang
*/
private ["_gangVariable"];
_gangVariable = _this select 0;
if (_gangVariable == "") exitWith {};
if ([player] call ZKB_fnc_IsGangMember) exitWith {["STR_Gang_AlreadyInGang"] call ZKB_fnc_DynamicText;};

_joininggangarray = missionNameSpace getVariable _gangVariable;

if !(_joininggangarray select 2) exitWith {["STR_Gang_LeaderNotRecruiting"] call ZKB_fnc_DynamicText;};
closeDialog 0;

_joiningmemberarray = _joininggangarray select 1;
_joiningmemberarray pushBack [(getPlayerUID player),(name player)];
_joininggangarray set [1,_joiningmemberarray];
missionNameSpace setVariable [_gangVariable, _joininggangarray, true];

["STR_Gang_JoinedGang", [(_joininggangarray select 0)]] call ZKB_fnc_DynamicText;

[player] call ZKB_fnc_GroupGang;