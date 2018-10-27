/*
	File: fn_DynamicText.sqf
	Function: ZKB_fnc_DynamicText
	Author: ZKB1325
	Description: Creates dynamic stacking text along the left side of the screen. Only stays on screen for defined amount of time then scrolls to the left and deletes followed by the list realigning.
	The most recent text will always be on top.
	
	Returns: text box ctrl
	
	0: String
		Text to display can be localized string or text string.
	1: Array
		Array for formated localized text
	2: Number
		Number indicating the amount of time the text stays on screen Default: 10, -1 for infinite
		You can adjust the display time with _ctrl setVariable ["displayTime", serverTime + wanted time];
		You can clear an infinite time text box with _ctrl setVariable ["displayTime", nil]; or by setting a time like above
		
	Example:
	_image = getText (configFile >> "cfgWeapons" >> (currentWeapon player) >> "picture"); 
	[format ["<t align='left'>%2s Weapon</t> <img align='left' size='1.5' image='%1'/>",_image, name player],[],10] call ZKB_fnc_DynamicText;
		
*/
if !(hasInterface) exitWith {}; //Theres no point in running this if you have no interface

private _textstring = param [0,"Missing text",[""]];
private _arr = param [1,[],[[]]];
private _time = param [2,10,[1]];
private _text = _textstring;

if (isLocalized _textstring) then 
	{
	_text = switch (count _arr) do
		{
		case 0: {localize _textstring;};
		case 1: {format [localize _textstring, (_arr select 0)]};
		case 2: {format [localize _textstring, (_arr select 0), (_arr select 1)]};
		case 3: {format [localize _textstring, (_arr select 0), (_arr select 1), (_arr select 2)]};
		case 4: {format [localize _textstring, (_arr select 0), (_arr select 1), (_arr select 2), (_arr select 3)]};
		case 5: {format [localize _textstring, (_arr select 0), (_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4)]};
		case 6: {format [localize _textstring, (_arr select 0), (_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4), (_arr select 5)]};
		case 7: {format [localize _textstring, (_arr select 0), (_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4), (_arr select 5), (_arr select 6)]};
		case 8: {format [localize _textstring, (_arr select 0), (_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4), (_arr select 5), (_arr select 6), (_arr select 7)]};
		case 9: {format [localize _textstring, (_arr select 0), (_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4), (_arr select 5), (_arr select 6), (_arr select 7), (_arr select 8)]};
		case 10: {format [localize _textstring, (_arr select 0), (_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4), (_arr select 5), (_arr select 6), (_arr select 7), (_arr select 8), (_arr select 9)]};
		};
	}
	else
	{
	_text = _textstring;
	};

	
player groupChat _text;	
if !(ZKB_EnableDynamicText) exitWith {controlNull;};
	
if (typeName _text isEqualTo "STRING") then {_text = parseText _text};



private _centerX = 0.0125 * safezoneW + safezoneX;
private _centerY = 0.2 * safezoneH + safezoneY;
private _width = 0.2125 * safezoneW;
private _height = 0.04 * safezoneH;



disableSerialization;
private _display = findDisplay 46;

private _ctrlText = _display ctrlCreate ["RscStructuredText", call ZKB_fnc_GenerateIDC];
_ctrlText ctrlSetPosition [_centerX, _centerY, _width, _height];
_ctrlText ctrlCommit 0;

_ctrlText ctrlSetStructuredText _text;
_ctrlText ctrlSetPosition [_centerX, _centerY, _width, ctrlTextHeight _ctrlText];
_ctrlText ctrlSetBackgroundColor [1,1,1,0];  
_ctrlText ctrlCommit 0;




private _dynamictextlist = missionNamespace getVariable ["ZKB_Variable_DynamicTextList",[]];
_dynamictextlist = [_ctrlText] + _dynamictextlist;
missionNamespace setVariable ["ZKB_Variable_DynamicTextList",_dynamictextlist];


{

if !(_forEachIndex == 0) then
	{
	private _ctrlposprev = (ctrlPosition (_dynamictextlist select (_forEachIndex-1)));
	private _xPos = (ctrlPosition _x) select 0;
	private _yPos = (ctrlPosition _x) select 1;
	_x ctrlSetPosition [_xPos,(_yPos + (_ctrlposprev select 3))];
	_x ctrlCommit 0;
	};
} forEach _dynamictextlist;	

[_ctrlText,_time] spawn 
	{
	disableSerialization;
	private _ctrlText  = param [0,0];
	private _time  = param [1,10];
	_ctrlText setVariable ["displayTime",if (_time isEqualTo -1) then {_time}else{serverTime + _time}];

	waitUntil {(serverTime > (_ctrlText getVariable ["displayTime",0])) and !((_ctrlText getVariable ["displayTime",0]) isEqualTo -1)};
		
	private _dynamictextlist = missionNamespace getVariable ["ZKB_Variable_DynamicTextList",[]];
	private _del = 
	{
		if (str _x isEqualTo str _ctrlText) exitWith {_forEachIndex};
		0
	} forEach _dynamictextlist;
	
	_dynamictextlist deleteAt _del;
	missionNamespace setVariable ["ZKB_Variable_DynamicTextList",_dynamictextlist];
	
	_ctrlText ctrlSetPosition [-3,(ctrlPosition _ctrlText select 1)];
	_ctrlText ctrlCommit 1;
	
	waitUntil {ctrlCommitted _ctrlText};

	uiSleep 0.01;
	ctrlDelete _ctrlText;

	};

if !(missionNamespace getVariable ["dynamic_text_enabled",false]) then 
	{	
	missionNamespace setVariable ["dynamic_text_enabled",true];
	[ctrlPosition _ctrlText] spawn 
		{
		disableSerialization;
		private _yPos = (ctrlPosition ((missionNamespace getVariable ["ZKB_Variable_DynamicTextList",[]]) select 0)) select 1;
		while {missionNamespace getVariable ["dynamic_text_enabled",false]} do 
			{
			private _arr = missionNamespace getVariable ["ZKB_Variable_DynamicTextList",[]];
			if (_arr isEqualTo []) exitWith {missionNamespace setVariable ["dynamic_text_enabled",false];};
			
			{
			if (dialog and (ctrlShown _x)) then
				{
				_x ctrlShow false;	
				};
			if (!dialog and !(ctrlShown _x)) then
				{
				_x ctrlShow true;	
				};
			private _newheight = _ypos;
			for "_i" from 1 to _forEachIndex do {_newheight = _newheight + ((ctrlPosition (_arr select (_i - 1))) select 3)};
			private _xPos = (ctrlPosition _x) select 0;
			_x ctrlSetPosition [_xPos,_newheight];
				_x ctrlCommit 0;
			} forEach _arr;	
			
			uiSleep .01;
			};
		};
	};
	
_ctrlText;