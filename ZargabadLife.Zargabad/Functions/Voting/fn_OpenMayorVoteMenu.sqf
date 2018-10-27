/*
	Author: ZKB1325
	FileName: fn_OpenMayorVoteMenu.sqf
	Function: ZKB_fnc_OpenMayorVoteMenu
	Description: Opens mayor voting menu
	
	this addAction [localize "STR_Voting_MayorVoteAction",ZKB_fnc_OpenMayorVoteMenu,"",1,true,true,"","",8];
*/
disableSerialization;
createDialog "ZKB_VoteList";
private _display = uiNamespace getVariable "ZKB_VoteList";
private _playerListCtrl = _display displayCtrl 21010;
private _voteBtnCtrl = _display displayCtrl 21020;

_voteBtnCtrl buttonSetAction "[lbData [21010, lbCurSel 21010]] call ZKB_fnc_VoteMayor";

private _index = _playerListCtrl lbAdd (localize "STR_Voting_CancelVote");
_playerListCtrl lbSetData [_index, ""];
if ((player getVariable ["mayorVote",""]) isEqualTo "") then
	{
	_playerListCtrl lbSetColor [_index,[0,1,0,1]];
	};

{
private _candidate = _x; 
if (side _x isEqualTo civilian) then
	{
	_index = _playerListCtrl lbAdd (name _candidate);
	_playerListCtrl lbSetData [_index, getPlayerUID _candidate];
	_playerListCtrl lbSetTooltip [_index, format [localize "STR_Voting_CurVotes",{(_x getVariable ["mayorVote",""]) isEqualTo (getPlayerUID _candidate)}count playableUnits]];
	if ((getPlayerUID _x) isEqualTo (player getVariable ["mayorVote",""])) then
		{
		_playerListCtrl lbSetColor [_index,[0,1,0,1]];
		};
	};
}forEach playableUnits;

lbSort _playerListCtrl;