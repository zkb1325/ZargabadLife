/*
	Author: ZKB1325
	File: fn_RemoteBomb.sqf
	Function: ZKB_fnc_RemoteBomb
	Description: Removes all virtual items from the ground within a 10 meter radius
*/
private ["_item","_nearobjs"];
closeDialog 0;
if ((vehicle player) isKindof "Air") exitWith {["STR_ItemMisc_BombPlantInAirVeh"] call ZKB_fnc_DynamicText;};
if ((vehicle player == player) or !(driver (vehicle player) == player)) exitWith {["STR_Common_NotInVehDriver"] call ZKB_fnc_DynamicText;};
if (count ((vehicle player) getVariable ["PlantedBomb",[]]) > 0) exitWith {["STR_ItemMisc_VehAlreadyBomb"] call ZKB_fnc_DynamicText;};


_item = _this select 1;
[_item, 1] call ZKB_fnc_InvRemoveItem;

(vehicle player) setVariable ["PlantedBomb", ["RemoteBomb", getPlayerUID player], true];
missionNameSpace setVariable [(vehicle player) getVariable ["plate","simplecode"],(vehicle player),true];
["STR_ItemMisc_PlantedRemoteBomb", [(vehicle player) getVariable ["plate","simplecode"]]] call ZKB_fnc_DynamicText;
hint format [localize "STR_ItemMisc_PlantedRemoteBomb", (vehicle player) getVariable ["plate","simplecode"]];
["STR_Admin_PlayerLogsPlantedRemoteBomb",name player,(vehicle player) getVariable ["plate",(vehicle player)]] call ZKB_fnc_AdminAddPlayerLog;