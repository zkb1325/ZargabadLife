/*
	Author: ZKB1325
	File: fn_ActivationBomb.sqf
	Function: ZKB_fnc_ActivationBomb
	Description: Removes all virtual items from the ground within a 10 meter radius
*/
private ["_item"];
closeDialog 0;
if ((vehicle player) isKindof "Air") exitWith {["STR_ItemMisc_BombPlantInAirVeh"] call ZKB_fnc_DynamicText;};
if ((vehicle player == player) or !(driver (vehicle player) == player)) exitWith {["STR_Common_NotInVehDriver"] call ZKB_fnc_DynamicText;};
if (count ((vehicle player) getVariable ["PlantedBomb",[]]) > 0) exitWith {["STR_ItemMisc_VehAlreadyBomb"] call ZKB_fnc_DynamicText;};


_item = _this select 1;
[_item, 1] call ZKB_fnc_InvRemoveItem;

(vehicle player) setVariable ["PlantedBomb", ["ActivationBomb", getPlayerUID player], true];
["STR_ItemMisc_PlantedBomb", [(vehicle player) getVariable ["plate",(vehicle player)]]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsPlantedActivationBomb",name player,(vehicle player) getVariable ["plate",(vehicle player)]] call ZKB_fnc_AdminAddPlayerLog;