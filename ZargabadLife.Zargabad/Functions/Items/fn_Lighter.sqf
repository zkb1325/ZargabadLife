/*
	Author: ZKB1325
	File: fn_Lighter.sqf
	Function: ZKB_fnc_Lighter
	Description: sets the vehicle you are in health to .95 which destroys it. Sorry for auto eject cant fix
*/
private ["_vcl","_item"];
closeDialog 0;
if (vehicle player == player) exitWith {["STR_Common_NotInVeh"] call ZKB_fnc_DynamicText;};
_vcl = vehicle player;

["STR_ItemMisc_LighterUsed"] call ZKB_fnc_DynamicText;

_item = _this select 1;
[_item, 1] call ZKB_fnc_InvRemoveItem;

sleep 1;
_vcl setDamage .95;