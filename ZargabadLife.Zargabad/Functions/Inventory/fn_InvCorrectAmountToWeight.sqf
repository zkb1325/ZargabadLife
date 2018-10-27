#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_InvCorrectAmountToWeight.sqf
	Function: ZKB_fnc_InvCorrectAmountToWeight
	Description: Take the item and the amount to add and returns how many the player can hold out of how many to add.
*/
private ["_item","_pickedupamount","_newamount"];
_item = _this select 0;
_pickedupamount = _this select 1;
_newamount = _pickedupamount;

if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_item] call ZKB_fnc_GetItemWeight)*_pickedupamount)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) then
	{
	_newamount = (floor(((player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")]) - ([player] call ZKB_fnc_GetInvTotalWeight)) / ([_item] call ZKB_fnc_GetItemWeight)));	
	};
	
_newamount;