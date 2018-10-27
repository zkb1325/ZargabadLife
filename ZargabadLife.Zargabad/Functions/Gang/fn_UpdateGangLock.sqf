/*
	Author: ZKB1325
	File: fn_UpdateGangLock.sqf
	Function: ZKB_fnc_UpdateGangLock
	Description: Handles the locking/unlocking of a gang
*/
private ["_updateoption"];
_updateoption = _this select 0;
if (_updateoption == "") exitWith {};

_gangtoupdatearr = ([player] call ZKB_fnc_FindGang);
_gangtoupdate= (_gangtoupdatearr select 0);
_gangvar = (_gangtoupdatearr select 1);

switch _updateoption do	
	{
	case "Yes": 
		{
		_gangtoupdate set [2, true];
		missionNameSpace setVariable [_gangvar, _gangtoupdate, true];
		["STR_Gang_CanJoinGang"] call ZKB_fnc_DynamicText;
		};
	
	case "No":
		{
		_gangtoupdate set [2, false];
		missionNameSpace setVariable [_gangvar, _gangtoupdate, true];	
		["STR_Gang_CanNotJoinGang"] call ZKB_fnc_DynamicText;
		};
	};