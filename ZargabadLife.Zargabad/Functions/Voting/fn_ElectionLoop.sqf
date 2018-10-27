/*
	Author: ZKB1325
	FileName: fn_ElectionLoop.sqf
	Function: ZKB_fnc_ElectionLoop
	Description: Server loop for mayor and chief election
*/
[] spawn
	{
	private _mayorElectionLoopTime = time + 1800;
	private _voteTally = [];
	private _sortedVotes = [];
	private _wonVotes = [];
	private _inArray = false;
	
	while {true} do
		{
		_mayorElectionLoopTime = time + 1800;
		waitUntil {time >= _mayorElectionLoopTime};
		
		_voteTally = [];
		_sortedVotes = [];
		_wonVotes = [];
		
		//Loop through all the players and see who they voted for
		{
		
		private _playerCurVote = _x getVariable ["mayorVote",""];
		private _playerCurVoteUnit = [_playerCurVote] call ZKB_fnc_GetPlayerFromID;
		_x setVariable ["mayorVote","",true];
		_inArray = false;
		
		//See if the voted for player is already in the tally
		{
		if (isNull _playerCurVoteUnit or side _playerCurVoteUnit isEqualTo west) exitWith {};
		
		if (_playerCurVote in _x) exitWith
			{
			_inArray = true;
			};
		}forEach _voteTally;
		
		if (_inArray) then //In the tally so add 1 to the vote for them
			{
			{
			if (_playerCurVote in _x) exitWith
				{
				private _curVoteArray = _x;
				_curVoteArray set [1,(_curVoteArray select 1)+1];
				_voteTally set [_forEachIndex,_curVoteArray];
				};
			}forEach _voteTally;
			}
			else //Not in the tally add them to it
			{
			if (isNull _playerCurVoteUnit or !(side _playerCurVoteUnit isEqualTo civilian)) exitWith {};
			_voteTally pushBack [_playerCurVote,1];
			};
			
		}forEach playableUnits;
		
		//Remove candidates if they don't have enough votes
		{
		if ((_x select 1) < 2) then //Need at least this many votes to be considered 
			{
			_voteTally set [_forEachIndex,"remove"];
			};
		}forEach _voteTally;
		_voteTally = _voteTally - ["remove"];
		
		if (count _voteTally > 0) then //Theres at least 1 player eligible to win
			{
			_sortedVotes = [_voteTally, [], {_x select 1}, "DESCEND"] call BIS_fnc_sortBy; //Sort the votes from most votes to least
			//Get the player with the most votes and any one who ties with them
			_wonVotes pushBack (_sortedVotes select 0);
			_sortedVotes deleteAt 0;
			{
			if ((_x select 1) isEqualTo ((_wonVotes select 0) select 1)) then
				{
				_wonVotes pushBack _x;
				};
			}forEach _sortedVotes;
			
			//Incase there are other players who tied in number of votes pick one randomly #RNG
			private _newMayor = selectRandom _wonVotes;
			
			if ((missionNamespace getVariable ["currentMayor",""]) isEqualTo (_newMayor select 0)) then
				{
				["STR_Voting_MayorStays", [name ([(_newMayor select 0)] call ZKB_fnc_GetPlayerFromID)]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
				}
				else
				{
				["STR_Voting_NewMayor",[name ([(_newMayor select 0)] call ZKB_fnc_GetPlayerFromID),(_newMayor select 1)]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
				};
			missionNamespace setVariable ["currentMayor",(_newMayor select 0),true];
			}
			else
			{
			if (isNull ([missionNamespace getVariable ["currentMayor",""]] call ZKB_fnc_GetPlayerFromID)) exitWith
				{
				["STR_Voting_NoneMayorElected"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
				};
			["STR_Voting_MayorStays", [name ([missionNamespace getVariable ["currentMayor",""]] call ZKB_fnc_GetPlayerFromID)]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
			};
		};
	};

//Police cheif	
[] spawn
	{
	private _chiefElectionLoopTime = time + 1200;
	private _voteTally = [];
	private _sortedVotes = [];
	private _wonVotes = [];
	private _inArray = false;
	
	while {true} do
		{
		_chiefElectionLoopTime = time + 1200;
		waitUntil {time >= _chiefElectionLoopTime};
		
		_voteTally = [];
		_sortedVotes = [];
		_wonVotes = [];
		
		//Loop through all the players and see who they voted for
		{
		
		private _playerCurVote = _x getVariable ["chiefVote",""];
		private _playerCurVoteUnit = [_playerCurVote] call ZKB_fnc_GetPlayerFromID;
		_x setVariable ["chiefVote","",true];
		_inArray = false;
		
		//See if the voted for player is already in the tally
		{
		if (isNull _playerCurVoteUnit or !(side _playerCurVoteUnit isEqualTo west)) exitWith {};
		
		if (_playerCurVote in _x) exitWith
			{
			_inArray = true;
			};
		}forEach _voteTally;
		
		if (_inArray) then //In the tally so add 1 to the vote for them
			{
			{
			if (_playerCurVote in _x) exitWith
				{
				private _curVoteArray = _x;
				_curVoteArray set [1,(_curVoteArray select 1)+1];
				_voteTally set [_forEachIndex,_curVoteArray];
				};
			}forEach _voteTally;
			}
			else //Not in the tally add them to it
			{
			if (isNull _playerCurVoteUnit or !(side _playerCurVoteUnit isEqualTo west)) exitWith {};
			_voteTally pushBack [_playerCurVote,1];
			};
			
		}forEach playableUnits;
		
		//Remove candidates if they don't have enough votes
		{
		if ((_x select 1) < 1) then //Need at least this many votes to be considered 
			{
			_voteTally set [_forEachIndex,"remove"];
			};
		}forEach _voteTally;
		_voteTally = _voteTally - ["remove"];
		
		if (count _voteTally > 1) then //Theres at least 1 player eligible to win
			{
			_sortedVotes = [_voteTally, [], {_x select 1}, "DESCEND"] call BIS_fnc_sortBy; //Sort the votes from most votes to least
			//Get the player with the most votes and any one who ties with them
			_wonVotes pushBack (_sortedVotes select 0);
			_sortedVotes deleteAt 0;
			{
			if ((_x select 1) isEqualTo ((_wonVotes select 0) select 1)) then
				{
				_wonVotes pushBack _x;
				};
			}forEach _sortedVotes;
			
			//Incase there are other players who tied in number of votes pick one randomly #RNG
			private _newChief = selectRandom _wonVotes;
			
			if ((missionNamespace getVariable ["currentChief",""]) isEqualTo (_newChief select 0)) then
				{
				["STR_Voting_ChiefStays", [name ([(_newChief select 0)] call ZKB_fnc_GetPlayerFromID)]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
				}
				else
				{
				["STR_Voting_NewCheif",[name ([(_newChief select 0)] call ZKB_fnc_GetPlayerFromID),(_newChief select 1)]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
				};
			missionNamespace setVariable ["currentChief",(_newChief select 0),true];
			}
			else
			{
			if (isNull ([missionNamespace getVariable ["currentChief",""]] call ZKB_fnc_GetPlayerFromID)) exitWith
				{
				["STR_Voting_NoneChiefElected"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
				};
			["STR_Voting_ChiefStays", [name ([missionNamespace getVariable ["currentChief",""]] call ZKB_fnc_GetPlayerFromID)]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
			};
		};
	};