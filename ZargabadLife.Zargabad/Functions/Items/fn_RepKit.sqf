/*
	Author: ZKB1325
	File: fn_RepKit.sqf
	Function: ZKB_fnc_RepKit
	Description: Repairs the vehicle you are in
*/
private ["_vcl","_item"];
closeDialog 0;
if (vehicle player == player) exitWith {["STR_Common_NotInVeh"] call ZKB_fnc_DynamicText;};
_vcl = vehicle player;

["STR_ItemMisc_ReparingVeh"] call ZKB_fnc_DynamicText;

_item = _this select 1;
[_item, 1] call ZKB_fnc_InvRemoveItem;
	
sleep 10;
_vcl setDamage 0;
["STR_ItemMisc_VehRepaired"] call ZKB_fnc_DynamicText;