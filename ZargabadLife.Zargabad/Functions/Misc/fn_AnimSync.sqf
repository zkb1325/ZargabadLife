/*
	Author: Tonic
	File: fn_AnimSync.sqf
	Function: ZKB_fnc_AnimSync
*/
private _unit = param [0,objNull,[objNull]];
private _anim = param [1,"",[""]];
private _cancelOwner = param [2,false,[true]];
private _playMove = param [3,false,[true]];
if(isNull _unit OR {(local _unit && _cancelOwner)}) exitWith {};
if (_playMove) then
	{
	player playMoveNow _anim;
	}
	else
	{
	_unit switchMove _anim;
	};