/*
	Author: ZKB1325
	File: fn_GroupGang.sqf
	Function: ZKB_fnc_GroupGang
	Description: Handles grouping the gangs together also runs for JIP
*/
private _playeruid = param [0,"",["",objNull]];
if (typeName _playeruid == "OBJECT") then {_playeruid = getPlayerUID _playeruid;};

if !([_playeruid] call ZKB_fnc_IsGangMember) exitWith {};

private _gangtogroup = (([_playeruid] call ZKB_fnc_FindGang) select 0);
private _gangtogroupmembers = _gangtogroup select 1;

{
private _togroupunit = [_x select 0] call ZKB_fnc_GetPlayerFromID;

if !(isNull _togroupunit) exitWith
	{
	private _player = [_playeruid] call ZKB_fnc_GetPlayerFromID;
	[_player] joinSilent (_togroupunit);
	if (_playeruid isEqualTo ((_gangtogroupmembers select 0) select 0)) then //Set as group leader if gang leader
		{
		[group _player, _player] remoteExec ["selectLeader", groupOwner group _player];
		};
	};
}forEach _gangtogroupmembers;