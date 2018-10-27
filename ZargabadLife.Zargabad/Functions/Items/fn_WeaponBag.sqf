/*
	Author: ZKB1325
	File: fn_WeaponBag.sqf
	Function: ZKB_fnc_WeaponBag
	Description: Heals the player to 100%
*/
private ["_item","_nearweapons"];
closeDialog 0;

_item = _this select 1;

if !(vehicle player == player) exitWith
	{
	clearWeaponCargoGlobal (vehicle player);
	clearMagazineCargoGlobal (vehicle player);
	clearItemCargoGlobal (vehicle player);
	[_item, 1] call ZKB_fnc_InvRemoveItem;
	["STR_ItemMisc_WeaponBagVehCarogClear"] call ZKB_fnc_DynamicText;
	};
	
_nearweapons = (nearestObjects [player, ["groundWeaponHolder"], 5]);

if (count _nearweapons > 0) then
	{
	{
	deleteVehicle _x;	
	}forEach _nearweapons;
	
	["STR_ItemMisc_WeaponBagWepRemoved", [count _nearweapons]] call ZKB_fnc_DynamicText;
	[_item, 1] call ZKB_fnc_InvRemoveItem;
	};