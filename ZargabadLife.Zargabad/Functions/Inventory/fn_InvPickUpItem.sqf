#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_InvPickUpItem.sqf
	Function: ZKB_fnc_InvPickUpItem
	Description: Handles picking up items off the ground
*/
private ["_object","_ItemData","_item","_amount","_amounttoadd"];
_object = _this select 0;

_ItemData = _object getVariable ["ItemData",["",0]];
_item = _ItemData select 0;
_amount = _ItemData select 1;

if (_item isEqualTo "") exitWith {};

if ((([player] call ZKB_fnc_GetInvTotalWeight) + (([_item] call ZKB_fnc_GetItemWeight)*1)) > (player getVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight")])) exitWith {["STR_Inv_MaxWeight"] call ZKB_fnc_DynamicText;};

_object setVariable ["ItemData",nil,true];

if(currentWeapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};

_amounttoadd = _ItemData call ZKB_fnc_InvCorrectAmountToWeight;

[_item, _amounttoadd] call ZKB_fnc_InvAddItem;

if (_amounttoadd < _amount) then
	{
	_object setVariable ["ItemData",[_item, (_amount - _amounttoadd)],true];
	[_object, [(_this select 2), format [localize "STR_Inv_PickUp", [_item] call ZKB_fnc_GetItemName, [(_amount - _amounttoadd)] call ZKB_fnc_FormatNumber]]] remoteExecCall ["setUserActionText", 0, _object];	
	}
	else
	{
	deleteVehicle _object;	
	};
	
["STR_Inv_PickedUp", [[_amounttoadd] call ZKB_fnc_FormatNumber, [_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;