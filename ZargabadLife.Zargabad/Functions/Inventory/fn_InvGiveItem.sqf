#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_InvGiveItem.sqf
	Function: ZKB_fnc_InvGiveItem
	Description: Runs when a player clicks use on an item
*/
private ["_itemarr","_giveamount","_givetoUID","_givetoUnit","_givenitem","_giveniteminvamount"];
_itemarr = call compile (_this select 0);
_givenitem = _itemarr select 0;
_giveniteminvamount = _itemarr select 1;
_giveamount = floor (abs (parseNumber (_this select 1)));
_givetoUID = _this select 2;

_givetoUnit = [_givetoUID] call ZKB_fnc_GetPlayerFromID;

if (_giveamount < 1) exitWith {};
if !([_givenitem] call ZKB_fnc_GetItemCanGive) exitWith {["STR_Inv_NotAllowedToGive", [[_givenitem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
if (isNull _givetoUnit) exitWith {["STR_Inv_GiveObjError"] call ZKB_fnc_DynamicText;};
if (_givetoUnit == player) exitWith {[ "STR_InvCantGiveSelf"] call ZKB_fnc_DynamicText;};
if (player distance _givetoUnit > 20) exitWith {["STR_Inv_GiveDistError"] call ZKB_fnc_DynamicText;};

if (_giveamount > _giveniteminvamount) exitWith {["STR_Inv_GiveAmountError"] call ZKB_fnc_DynamicText;};

if ((([_givetoUnit] call ZKB_fnc_GetInvTotalWeight) + (([_givenitem] call ZKB_fnc_GetItemWeight)*_giveamount)) > (_givetoUnit getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_GivenToSpaceError"] call ZKB_fnc_DynamicText;};

closeDialog 0;
if(currentWeapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};

[_givenitem, _giveamount] call ZKB_fnc_InvRemoveItem;
[_givenitem, _giveamount, true] remoteExec ["ZKB_fnc_InvAddItem", _givetoUnit, false];
["STR_Inv_GivenItem", [name player, [_giveamount] call ZKB_fnc_FormatNumber, [_givenitem] call ZKB_fnc_GetItemName]] remoteExecCall ["ZKB_fnc_DynamicText", _givetoUnit, false];

["STR_Inv_GiveSuccess", [[_giveamount] call ZKB_fnc_FormatNumber, [_givenitem] call ZKB_fnc_GetItemName, name _givetoUnit]] call ZKB_fnc_DynamicText;