/*
	File: fn_ShowWantedList.sqf
	Function: ZKB_fnc_ShowWantedList
	Author: ZKB1325
	Description: Opens and fills the wanted list
*/
createDialog "ZKB_GenTextBox";
private _display = uiNamespace getVariable "ZKB_GenTextBox";
private _textBoxCtrl = _display displayCtrl 1510;
private _frameCtrl = _display displayCtrl 1502;
_frameCtrl ctrlSetText localize "STR_Cop_WantedList";
private _wantedText = "";
private _crimes = "";
private _crimeList = [];
private _crimeArray = [];

{
_crimes = "";
_crimeList = [];
if ((side _x isEqualTo civilian) and ([_x] call ZKB_fnc_IsWanted) and !(_x getVariable ["InJail",false])) then
	{
	_crimeArray = ((_x getVariable ["warrants",[]]) select 0);
	{
    _crime = _x;
    if !(_crime in _crimeList) then
		{
			_crimeList pushBack _crime;
			_crimes = _crimes + format [" - (%1x) %2<br/>",{_x isEqualTo _crime}count _crimeArray,_crime];
		};
	}forEach _crimeArray;
	_wantedText = _wantedText + format [localize "STR_Cop_WantedListWanted",_x,name _x,((_x getVariable ["warrants",[]]) select 1)];
	_wantedText = _wantedText + "<br/>" + _crimes + "<br/>";
	};
}forEach playableUnits;

_textBoxCtrl ctrlSetStructuredText parseText _wantedText;

_textBoxCtrl ctrlSetPosition [(ctrlPosition _textBoxCtrl) select 0, (ctrlPosition _textBoxCtrl) select 1, (ctrlPosition _textBoxCtrl) select 2, ctrlTextHeight _textBoxCtrl];
_textBoxCtrl ctrlCommit 0;