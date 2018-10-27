/*
	Author: ZKB1325
	File: fn_RefuelCan.sqf
	Function: ZKB_fnc_RefuelCan
	Description: Refuels the vehicle you are in
*/
private ["_item"];
closeDialog 0;

_vcl = vehicle player;
if (_vcl == player) exitWith {["STR_Common_NotInVeh"] call ZKB_fnc_DynamicText;};
if !(driver _vcl == player) exitWith {["STR_Common_NotInVehDriver"] call ZKB_fnc_DynamicText;};
if (fuel _vcl == 1) exitWith {["STR_ItemMisc_AlreadyFuel"] call ZKB_fnc_DynamicText;};


_item = _this select 1;
[_item, 1] call ZKB_fnc_InvRemoveItem;


["STR_ItemMisc_Refuelling"] call ZKB_fnc_DynamicText;	
sleep 10;
_vcl setFuel 1;
["STR_ItemMisc_VehRefuelled"] call ZKB_fnc_DynamicText;