/*
	Author: ZKB1325
	File: fn_BombRemote.sqf
	Function: ZKB_fnc_BombRemote
	Description: Removes all virtual items from the ground within a 10 meter radius
*/
private ["_action","_item","_display","_timeslider","_timerinfo","_time","_veh"];
_action = _this select 0;


if (_action == "Use") exitWith
	{
	disableSerialization;
	closeDialog 0;
	createDialog "ZKB_BombRemote";

	
	};
	
if (_action == "Execute") exitWith
	{
	_display = uiNameSpace getVariable "ZKB_BombRemote";
	_bombcodebox = (_display displayCTRL 11020);
	_bombcode = ctrlText _bombcodebox;
	_executecode = missionNameSpace getVariable [_bombcode, objNull];
	if (isNull _executecode) exitWith {["STR_ItemMisc_VehBombError", [_bombcode]] call ZKB_fnc_DynamicText;};
	if (count (_executecode getVariable ["PlantedBomb",[]]) < 1) exitWith {["STR_ItemMisc_VehHasNobomb", [_bombcode]] call ZKB_fnc_DynamicText;};
	
	closeDialog 0;
	_carbomb = "Bo_GBU12_LGB" createVehicle (getposATL _executecode);
	_executecode setVariable ["PlantedBomb", nil, true];
	[[_carbomb, player],{(_this select 0) setShotParents [(_this select 1), (_this select 1)];}] remoteExecCall ["BIS_fnc_call", 2];
	};