/*
	Author: ZKB1325
	FileName: fn_VoteMayor.sqf
	Function: ZKB_fnc_VoteMayor
	Description: Cast vote for mayor
*/
closeDialog 0;
private _selectedCandidate = param [0];
if (_selectedCandidate isEqualTo "") exitWith 
	{
	player getVariable ["mayorVote",_selectedCandidate,true];
	["STR_Voting_VoteNoOneMayor"] call ZKB_fnc_DynamicText;
	};

private _candidate = [_selectedCandidate] call ZKB_fnc_GetPlayerFromID;
if (isNull _candidate) exitWith {["STR_Voting_VoteError"] call ZKB_fnc_DynamicText;};

player setVariable ["mayorVote",_selectedCandidate,true];
["STR_Voting_VotedForMayor",[name _candidate]] call ZKB_fnc_DynamicText;