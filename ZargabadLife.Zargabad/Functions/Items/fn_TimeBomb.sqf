/*
	Author: ZKB1325
	File: fn_TimeBomb.sqf
	Function: ZKB_fnc_TimeBomb
	Description: Removes all virtual items from the ground within a 10 meter radius
*/
private ["_action","_item","_display","_timeslider","_timerinfo","_time","_veh"];
_action = _this select 0;
closeDialog 0;
if ((vehicle player) isKindof "Air") exitWith {["STR_ItemMisc_BombPlantInAirVeh"] call ZKB_fnc_DynamicText;};
if ((vehicle player == player) or !(driver (vehicle player) == player)) exitWith {["STR_Common_NotInVehDriver"] call ZKB_fnc_DynamicText;};
if (count ((vehicle player) getVariable ["PlantedBomb",[]]) > 0) exitWith {["STR_ItemMisc_VehAlreadyBomb"] call ZKB_fnc_DynamicText;};


if (_action == "Use") exitWith
	{
	disableSerialization;
	createDialog "ZKB_TimeBomb";
	_display = uiNameSpace getVariable "ZKB_TimeBomb";
	_timeslider = (_display displayCTRL 9010);
	_timerinfo = (_display displayCTRL 9020);
	
	_timeslider sliderSetRange [10, 180];
	_timeslider sliderSetPosition 10;
	_timeslider sliderSetSpeed [10, 1];
	
	_timerinfo ctrlSetText format [localize "STR_ItemMisc_BombTimer", [round (sliderPosition _timeslider),"MM:SS"] call BIS_fnc_secondsToString];
	};
	
if (_action == "Plant") exitWith
	{
	_item = _this select 1;
	_time = _this select 2;
	_veh = _this select 3;
	[_item, 1] call ZKB_fnc_InvRemoveItem;

	(vehicle player) setVariable ["PlantedBomb", ["TimeBomb", getPlayerUID player], true];
	["STR_ItemMisc_PlantedTimeBomb", [(vehicle player), [round _time,"MM:SS"] call BIS_fnc_secondsToString]] call ZKB_fnc_DynamicText;	
	
	sleep _time;
	if ((count (_veh getVariable ["PlantedBomb",[]]) < 1) or (isNull _veh)) exitWith {};
	_carbomb = "Bo_GBU12_LGB" createVehicle (getposATL _veh);
	};