#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_BuyWorkPlace.sqf
	Function: ZKB_fnc_BuyWorkPlace
	Description: Goes through the array of workplace markers and set them up
*/
private _workPlace = param [3,"",[""]];
if (_workPlace isEqualTo "") then
	{
	private _workPlace = param [0,"",[""]];
	};
if (_workPlace isEqualTo "") exitWith {};
private _workPlaceCost = ((SETTING(getArray,"ZKB_WorkPlaces") select (SETTING(getArray,"ZKB_WorkPlaces") findIf {_workPlace in _x})) select 1);
if ((["Money"] call ZKB_fnc_GetInvItemAmount) < _workPlaceCost) exitWith {["STR_Shop_NotEnoughMoney"] call ZKB_fnc_DynamicText;};
private _workPlacePay = ((SETTING(getArray,"ZKB_WorkPlaces") select (SETTING(getArray,"ZKB_WorkPlaces") findIf {_workPlace in _x})) select 2);
["Money", _workPlaceCost] call ZKB_fnc_InvRemoveItem;
["STR_Bank_BoughtWorkplace",[(SETTING(getArray,"ZKB_WorkPlaces") findIf {_workPlace in _x})+1,[_workPlaceCost] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
private _ownedWorkPlaces = (missionNamespace getVariable ["ownedWorkplaces",[]]);
_ownedWorkPlaces pushBack _workPlace;
missionNamespace setVariable ["ownedWorkplaces",_ownedWorkPlaces];

["STR_Admin_PlayerLogsBoughtWorkplace",name player,(SETTING(getArray,"ZKB_WorkPlaces") findIf {_workPlace in _x})+1] call ZKB_fnc_AdminAddPlayerLog;