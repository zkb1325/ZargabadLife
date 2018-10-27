/*
	Author: Benargee (https://community.bistudio.com/wiki/addRating)
	FileName: fn_SetRating.sqf
	Function: ZKB_fnc_SetRating
	Description: Sets the rating of a unit
*/
private _setRating = param [0,0,[0]];
private _unit = param [1,player,[objNull]];
private _curRating = rating _unit;
private _addVal = _setRating - _curRating;
_unit addRating _addVal;