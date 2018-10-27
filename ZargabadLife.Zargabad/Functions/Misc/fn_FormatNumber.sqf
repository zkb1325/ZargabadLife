/*
	File: fn_FormatNumber.sqf
	Function: ZKB_fnc_FormatNumber
	
	Author: Karel Moricky (Modified by ZKB1325 by making it add , instead of a space)
  
	Description:
	Convert a number into string (avoiding scientific notation)
	Added(ZKB) Value to be formatted, rounds the number so it wont return decimals. Any number over 9,999,999,999 will return an inaccurate number. Any number containing multiple 9's and is 9,999,999 or greater will get rounded up

	Parameter(s):
	_this: NUMBER

	Returns:
	STRING
*/
private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

_number = _this param [0,0,[0]];
_mod = _this param [1,3,[0]];

_digits = _number call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;

_modBase = _digitsCount % _mod;
_numberText = "";
{
	_numberText = _numberText + str _x;
	if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + ",";};
} foreach _digits;
_numberText
