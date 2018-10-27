/*
	Author: ZKB1325
	File: fn_KickFromGang.sqf
	Function: ZKB_fnc_KickFromGang
	Description: Handles the kicking of a player from a gang
*/
private ["_kickedmemberUID"];

_kickedmemberUID = _this select 0;
if !([_kickedmemberUID] call ZKB_fnc_IsGangMember) exitWith {};
if (_kickedmemberUID == (getPlayerUID player)) exitWith {["STR_Gang_CantKickSelf"] call ZKB_fnc_DynamicText;};


closeDialog 0;

[_kickedmemberUID] call ZKB_fnc_RemoveFromGang;

_kickedmemberunit = [_kickedmemberUID] call ZKB_fnc_GetPlayerFromID;

if (isNull _kickedmemberunit) then
	{
	["STR_Gang_KickedMemberNotInGame"] call ZKB_fnc_DynamicText;	
	}
	else
	{
	["STR_Gang_KickedMember", [name _kickedmemberunit]] call ZKB_fnc_DynamicText;
	[localize "STR_Gang_KickedFromGang"] remoteExec ["ZKB_fnc_DynamicText", _kickedmemberunit, false];
	};