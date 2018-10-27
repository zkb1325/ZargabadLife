/*
	Author: ZKB1325
	File: fn_SpeedUpgrade.sqf
	Function: ZKB_fnc_SpeedUpgrade
	Description: Puts a variable on the players vehicle to increase the speed of it
	
	NOTE: Speed upgrades are removed from all shops and factories and the KeyDown Eventhandler by default because it doesn't work very well with cup vehicles
*/
private ["_item","_veh"];
if ((vehicle player) isKindof "Air") exitWith {["STR_ItemMisc_CantUpgradeAirVeh"] call ZKB_fnc_DynamicText;};
if ((vehicle player) isEqualTo player) exitWith {["STR_Common_NotInVeh"] call ZKB_fnc_DynamicText;};

_item = _this select 1;
_veh = (vehicle player);

_upvar = switch _item do
	{
	case "SpeedUpgrade1": {.035;};
	case "SpeedUpgrade2": {.05;};
	case "SpeedUpgrade3": {.075;};
	case "SpeedUpgrade4": {.09;};
	case "SpeedUpgrade5": {.125;};
	default {0;};
	};
	
["STR_ItemMisc_SpeedUpgradetuning"] call ZKB_fnc_DynamicText;
[_item, 1] call ZKB_fnc_InvRemoveItem;
_veh setFuel 0;
sleep 10;
_veh setfuel 1;
["STR_ItemMisc_SpeedUpgradeApplied"] call ZKB_fnc_DynamicText;
_veh setVariable ["VehUpgradeLvl", _upvar, true];