/*
	Author: ZKB1325
	File: fn_LockPick.sqf
	Function: ZKB_fnc_LockPick
	Description: Runs when player uses the lockpick
*/
private ["_item","_nearvehicles","_veh","_keys"];
closeDialog 0;
if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};
_nearvehicles = (nearestObjects [player, ["motorcycle","Car","Tank","Ship","Air"], 8]);
if (count _nearvehicles < 1) exitWith {["STR_ItemMisc_NotNearVcl"] call ZKB_fnc_DynamicText;};
_veh = _nearvehicles select 0;
if (_veh inArea "CarPark") exitWith {["STR_ItemMisc_LockpickInSafezone"] call ZKB_fnc_DynamicText;};
if (_veh in (player getVariable ["ZKB_Keys",[]])) exitWith {["STR_ItemMisc_LockpickAlreadyOwn"] call ZKB_fnc_DynamicText;};

_item = _this select 1;

if ((random 100) < 10) then
	{
	_keys = (player getVariable ["ZKB_Keys",[]]);	
	_keys pushBack _veh;
	player setVariable ["ZKB_Keys", _keys, true];
	["STR_ItemMisc_LockpickSuccess"] call ZKB_fnc_DynamicText;	
	}
	else
	{
	["STR_ItemMisc_LockpickFail"] call ZKB_fnc_DynamicText;	
	[_item, 1] call ZKB_fnc_InvRemoveItem;
	};
