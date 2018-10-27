/*
	Author: ZKB1325
	File: fn_DefuseKit.sqf
	Function: ZKB_fnc_DefuseKit
	Description: Heals the player to 100%
*/
private ["_item","_nearexpl","_expl"];
closeDialog 0;

_item = _this select 1;

if (vehicle player == player) then
	{	
	_nearexpl = [];
	{
	_nearexpl = _nearexpl + (player nearObjects [_x, 3]);	
	}forEach ["CUP_IED_V1_Ammo"]; 
	
	if (count _nearexpl > 0) then
		{
		_expl = _nearexpl select 0;
		[_item, 1] call ZKB_fnc_InvRemoveItem;
		if (random 100 < 90 and IsCop) then
			{
			["STR_ItemMisc_DefuseSuccess"] call ZKB_fnc_DynamicText;	
			deleteVehicle _expl;
			}
			else
			{
			[localize "STR_ItemMisc_DefuseFailed"] call ZKB_fnc_DynamicText;	
			_expl setdamage 1;	
			};
		}
		else
		{
		["STR_ItemMisc_DefuseNoBomb"] call ZKB_fnc_DynamicText;		
		};
	}
	else
	{
	if !(count ((Vehicle Player) getVariable ["PlantedBomb",[]]) == 0) then
		{
		["STR_ItemMisc_DefuseSuccess"] call ZKB_fnc_DynamicText;	
		(vehicle player) setVariable ["PlantedBomb", nil, true];
		[_item, 1] call ZKB_fnc_InvRemoveItem;
		}
		else
		{
		["STR_ItemMisc_DefuseNoBomb"] call ZKB_fnc_DynamicText;	
		};
	};