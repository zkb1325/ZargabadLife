 /*
	Author: Copied from original Arma 2 Zargabad Life mission
	File: fn_SayRadioText.sqf
	Function: ZKB_fnc_SayRadioText
 */
private ["_text","_art","_players"];
_text = _this select 0;
_art = _this select 1;
_player = _this select 2;
    
if (not ((_text == "") or (_text == " ")) ) then 
	{
	_text = format["%1 shouts: %2", _player, _text];
	
	if (_art == "direct" and player distance _player <= 50) then 
		{

		titleText[_text, "PLAIN"];
		};

	if (_art == "side" and ((side player) == (side _player))) then 
		{
		player sideChat _text;
		};

	if (_art == "global") then 
		{
		player globalChat _text;
		};
	};