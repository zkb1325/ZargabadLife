/*
	Author: ZKB1325
	File: fn_CheckValidChar.sqf
	Function: ZKB_fnc_CheckValidChar
	Description: Takes input of whats being typed into a text box and checks if that char is allowed, if the char is not allowed it will remove it
*/
sleep .01;
disableserialization;
private ["_character", "_ctrlid","_ctrltext","_textarray"];
_character = ((_this select 0) select 1);
_ctrlid = (_this select 1);
_ctrltext = ctrlText _ctrlid;


if ([34,35,37,38,39,42,42,47,47,60,62,64,92,94,96,124,126] find _character >= 0) then
	{
	_textarray = toArray _ctrltext;
	_textarray = _textarray - [_character];
	_textstring = toString _textarray;
	ctrlSetText [_ctrlid, _textstring];
	};
