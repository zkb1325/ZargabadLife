/*
    File: fn_AddWanted.sqf
	Function: ZKB_fnc_AddWanted
    Author: ZKB1325

    Description:
    Updates the wanted list for provided player with crime
	
	0:Object or String
		Player object to add wanted or player UID
		
	1: String
		Crime string to add
	
	2: Number
		Bounty add amount
*/

private _player = param [0,objNull,[objNull,""]];
if (typeName _player isEqualTo typeName "") then
	{
	_player = [_player] call ZKB_fnc_GetPlayerFromID;
	};
if (isNull _player) exitWith {false;}; //bad player
private _crime = param [1,"",[""]];
if (_crime isEqualTo "") exitWith {false;}; //No adding blank crimes
private _bounty = param [2,0,[0]];
	
private _curWarrentsArray = _player getVariable ["Warrants",[]];
private _curWarrents = [];
private _curBounty = 0;

if (_curWarrentsArray isEqualTo []) then
	{
	_curWarrents = [];
	_curBounty = 0;
	}
	else
	{
	_curWarrents = _curWarrentsArray select 0;
	_curBounty = _curWarrentsArray select 1;
	};

_curWarrents pushBack _crime;
_curBounty = _curBounty + _bounty;
_curWarrentsArray set [0,_curWarrents];
_curWarrentsArray set [1,_curBounty];
_player setVariable ["Warrants",_curWarrentsArray,true];
["STR_Admin_PlayerLogsWantedAdd",name _player,_crime,[_bounty] call ZKB_fnc_FormatNumber] call ZKB_fnc_AdminAddPlayerLog;
true;
