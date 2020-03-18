/*
    File: fn_ArrestPlayer.sqf
	Function: ZKB_fnc_ArrestPlayer
    Author: ZKB1325

    Description:
	Arrests the player
*/
private _arrestedUnit = param [0,objNull,[objNull]];
if (isNull _arrestedUnit) exitWith {closeDialog 0; ["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if !([_arrestedUnit] call ZKB_fnc_IsRestrained) exitWith {["STR_Cop_NotRestrained",[name _arrestedUnit]] call ZKB_fnc_DynamicText;};
if (_arrestedUnit getVariable ["InJail",false]) exitWith {closeDialog 0;};
private _jailTime = param [1,0,[0]];
if (_jailTime <= 0) exitWith {};

private _playersBail = 0;
private _playersBounty = 0;
private _playersWarrants = (_arrestedUnit getVariable ["Warrants",[]]);
if (count _playersWarrants > 0) then
	{
	_playersBounty = ((_arrestedUnit getVariable ["Warrants",[]]) select 1);
	_playersBail = if (_playersBounty < (round(_jailTime*30000))) then {0}else{_playersBounty};
	};

if (_playersBounty > 0) then
	{
	[_playersBounty,name _arrestedUnit,playersNumber west] remoteExecCall ["ZKB_fnc_BountyCollect",west,false];
	}
	else
	{
	["STR_Cop_NoBounty",[name _arrestedUnit]] call ZKB_fnc_DynamicText;
	};
	
closeDialog 0;
[_jailTime,_playersBail,name player] remoteExec ["ZKB_fnc_Jail",_arrestedUnit,false];
["STR_Admin_PlayerLogsPlayerArrested",name _arrestedUnit,name player,_jailTime] call ZKB_fnc_AdminAddPlayerLog;