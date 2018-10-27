/*
	Author: ZKB1325
	File: fn_CheckCharNum.sqf
	Function: ZKB_fnc_CheckCharNum
	Description: Takes input of whats being typed into a text box and making sure its only a number
*/
sleep .01;
disableserialization;
private _ctrl = param [0];
private _char = param [1];
private _ctrltext = ctrlText _ctrl;

if !(_char in [48,49,50,51,52,53,54,55,56,57]) then
	{
	private _textarray = toArray _ctrltext;
	_textarray = _textarray - [_char];
	private _textstring = toString _textarray;
	_ctrl ctrlSetText  _textstring;
	};
