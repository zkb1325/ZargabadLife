#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_InvAddItem.sqf
	Function: ZKB_fnc_InvAddItem
	Description: Handles removing virtual items from the players virtual inventory, returns true/false depending if item could be added
*/
private ["_item","_amountadd""_inv","_itemarr"];


_item = _this select 0;
_amountadd = _this select 1;
_forced = param [2, false, [false]];

_inv = player getVariable ["ZKB_Inventory",[]];

if (_forced) exitWith
	{
	if ([_item] call ZKB_fnc_GetInvItemAmount <= 0) then
		{
		_inv pushBack [_item,_amountadd];
		player setVariable ["ZKB_Inventory",_inv,true];
		}
		else
		{
		{
		if ((_x select 0) == _item) exitWith
			{
			_inv set [_forEachIndex, [_item, (_x select 1) + _amountadd]];	
			};
		}forEach _inv;
		player setVariable ["ZKB_Inventory",_inv,true];
		};
	[] spawn ZKB_fnc_SavePlayer;
	true;
	};

if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_item] call ZKB_fnc_GetItemWeight)*_amountadd)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_ToMuchWeight", [[_amountadd] call ZKB_fnc_FormatNumber, [_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText; false;};
	
if ([_item] call ZKB_fnc_GetInvItemAmount <= 0) then
	{
	_inv pushBack [_item,_amountadd];
	}
	else
	{
	{
	if ((_x select 0) == _item) exitWith
		{
		_inv set [_forEachIndex, [_item, (_x select 1) + _amountadd]];	
		};
	}forEach _inv;
	player setVariable ["ZKB_Inventory",_inv,true];
	};
[] spawn ZKB_fnc_SavePlayer;
true;