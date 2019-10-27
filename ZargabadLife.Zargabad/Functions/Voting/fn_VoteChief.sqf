/*
	Author: ZKB1325
	FileName: fn_VoteChief.sqf
	Function: ZKB_fnc_VoteChief
	Description: Cast vote for police chief
*/
closeDialog 0;
private _selectedCandidate = param [0];
if (_selectedCandidate isEqualTo "") exitWith 
	{
	player setVariable ["chiefVote",nil,true];
	["STR_Voting_VoteNoOneChief"] call ZKB_fnc_DynamicText;
	};

private _candidate = [_selectedCandidate] call ZKB_fnc_GetPlayerFromID;
if (isNull _candidate) exitWith {["STR_Voting_VoteError"] call ZKB_fnc_DynamicText;};

player setVariable ["chiefVote",_selectedCandidate,true];
["STR_Voting_VotedForChief",[name _candidate]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsVotedForChief",name player,name _candidate] call ZKB_fnc_AdminAddPlayerLog;