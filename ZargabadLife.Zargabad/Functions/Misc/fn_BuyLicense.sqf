/*
	Author: ZKB1325
	File: fn_BuyLicense.sqf
	Function: ZKB_fnc_BuyLicense
	Description: Handles buying a license
*/
private ["_actionarray","_boughtlicensename","_boughtlicensedisplayname","_licensecost","_currentlicense"];
_actionarray = _this select 3;
_boughtlicensename = _actionarray select 0;
_boughtlicensedisplayname = _actionarray select 1;
_licensecost = _actionarray select 2;
_currentlicense = player getVariable ["ZKB_Licenses",[]];

if (_boughtlicensename in _currentlicense) exitWith {["STR_Common_LicenseGotAlready"] call ZKB_fnc_DynamicText;};
if ((["Money"] call ZKB_fnc_GetInvItemAmount) < _licensecost) exitWith {["STR_Common_LicenseNoMoney"] call ZKB_fnc_DynamicText;};

_currentlicense pushBack _boughtlicensename;
player setVariable ["ZKB_Licenses", _currentlicense, true];
["STR_Common_LicenseBought",[_boughtlicensedisplayname, [_licensecost] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
["Money", _licensecost] call ZKB_fnc_InvRemoveItem;

switch (_boughtlicensename) do
	{
	case "Car_License";
	case "Truck_License":
		{
		ZKB_DemeritPoints = 10;
		};
	};
[] spawn ZKB_fnc_SavePlayer;

["STR_Admin_PlayerLogsBoughtLicense",name player,_boughtlicensedisplayname] call ZKB_fnc_AdminAddPlayerLog;
