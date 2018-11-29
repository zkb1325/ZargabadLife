/*
	Author: ZKB1325
	FileName: fn_AdminAddPlayerLog.sqf
	Function: ZKB_fnc_AdminAddPlayerLog
	Description: Adds to the player logs

	_this: Array
		Log array
		0: String
			Localized string or string
		1+: Anything
			Anything to format into the text string be careful with objects becoming objNull
			
	[[time,"Str",%1,%2,%3,ect]]
*/
private _logArray = _this;

private _curPlayerLogs = missionNamespace getVariable ["ZKB_PlayerLogs",[]];
_curPlayerLogs pushBack ([serverTime] + _logArray);
missionNamespace setVariable ["ZKB_PlayerLogs",_curPlayerLogs,true];

if !(isDedicated) then
	{
	private _curPlayersLogs = player getVariable ["ZKB_PlayersLogs",[]];
	_curPlayersLogs pushBack ([serverTime] + _logArray);
	player setVariable ["ZKB_PlayersLogs",_curPlayersLogs,true];
	};