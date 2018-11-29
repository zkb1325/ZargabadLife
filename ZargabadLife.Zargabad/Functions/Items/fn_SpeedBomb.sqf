/*
	Author: ZKB1325
	File: fn_SpeedBomb.sqf
	Function: ZKB_fnc_SpeedBomb
	Description: Removes all virtual items from the ground within a 10 meter radius
*/
private ["_action","_item","_display","_startspeedslider","_minspeedslider","_startspeedinfo","_minspeedinfo","_startslidernum","_minslidernum"];
_action = _this select 0;

if ((vehicle player) isKindof "Air") exitWith {["STR_ItemMisc_BombPlantInAirVeh"] call ZKB_fnc_DynamicText;};
if ((vehicle player == player) or !(driver (vehicle player) == player)) exitWith {closeDialog 0; ["STR_Common_NotInVehDriver"] call ZKB_fnc_DynamicText;};
if (count ((vehicle player) getVariable ["PlantedBomb",[]]) > 0) exitWith {closeDialog 0; ["STR_ItemMisc_VehAlreadyBomb"] call ZKB_fnc_DynamicText;};


if (_action == "Use") exitWith
	{
	closeDialog 0;
	disableSerialization;
	createDialog "ZKB_SpeedBomb";
	_display = uiNameSpace getVariable "ZKB_SpeedBomb";
	_startspeedslider = (_display displayCTRL 10010);
	_minspeedslider = (_display displayCTRL 10030);
	_startspeedinfo = (_display displayCTRL 10020);
	_minspeedinfo = (_display displayCTRL 10040);
	
	_startspeedslider sliderSetRange [10, 100];
	_startspeedslider sliderSetSpeed [10, 1];
	
	_minspeedslider sliderSetRange [10, 80];
	_minspeedslider sliderSetSpeed [10, 1];
	
	_startspeedinfo ctrlSetText format [localize "STR_ItemMisc_SpeedBombStartSpeed", [round (sliderPosition _startspeedslider)] call ZKB_fnc_FormatNumber];
	_minspeedinfo ctrlSetText format [localize "STR_ItemMisc_SpeedBombMinSpeed", [round (sliderPosition _minspeedslider)] call ZKB_fnc_FormatNumber];
	};
	
if (_action == "Plant") exitWith
	{
	disableSerialization;
	_display = uiNameSpace getVariable "ZKB_SpeedBomb";
	_startspeedslider = (_display displayCTRL 10010);
	_minspeedslider = (_display displayCTRL 10030);
	_item = _this select 1;
	_veh = _this select 2;
	[_item, 1] call ZKB_fnc_InvRemoveItem;
	
	_startspeed = round (sliderPosition _startspeedslider);
	_minspeed = round (sliderPosition _minspeedslider);
	closeDialog 0;
	if (_startspeed < _minspeed) then {_minspeed = _startspeed;};
	["STR_ItemMisc_PlantedSpeedBomb", [(vehicle player) getVariable ["plate",(vehicle player)], _startspeed, _minspeed]] call ZKB_fnc_DynamicText;	
	
	(vehicle player) setVariable ["PlantedBomb", ["SpeedBomb", getPlayerUID player, _startspeed, _minspeed], true];
	["STR_Admin_PlayerLogsPlantedSpeedBomb",name player,(vehicle player) getVariable ["plate",(vehicle player)]] call ZKB_fnc_AdminAddPlayerLog;
	};