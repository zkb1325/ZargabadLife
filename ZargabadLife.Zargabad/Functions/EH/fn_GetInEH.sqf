/*
	File: fn_GetInEH.sqf
	Function: ZKB_fnc_GetInEH
	Author: ZKB1325
	Description: Runs when a player gets into a vehicle
*/
private ["_unit","_vehicle","_vehbomb","_carbomb"];
_unit = _this select 0;
_vehicle = _this select 2;

_vehbomb = (_vehicle getVariable ["PlantedBomb",[]]);
if (count _vehbomb < 1) exitWith {};

if ((_vehbomb select 0) == "ActivationBomb") exitWith
	{
	waitUntil {(driver _vehicle == _unit and (isEngineOn _vehicle)) or (!(alive _vehicle) or (vehicle _unit == _unit))};
	if (!(alive _vehicle) or (vehicle _unit == _unit)) exitWith {};
	["STR_ItemMisc_VehHadABomb"] call ZKB_fnc_DynamicText;
	hint (localize "STR_ItemMisc_VehHadABomb");
	player groupchat (localize "STR_ItemMisc_VehHadABomb");
	_carbomb = "Bo_GBU12_LGB" createVehicle (getposATL _vehicle);
	
	private _bombOwner = [_vehbomb select 1] call ZKB_fnc_GetPlayerFromID;
	if !(isNull _bombOwner) then
		{
		[[_carbomb, _bombOwner],{(_this select 0) setShotParents [(_this select 1), (_this select 1)];}] remoteExecCall ["BIS_fnc_call", 2];	
		};
	};
	
if ((_vehbomb select 0) == "SpeedBomb") exitWith
	{
	waitUntil {(driver _vehicle == _unit and ((speed _vehicle) >= (_vehbomb select 2))) or (!(alive _vehicle) or (vehicle _unit == _unit) or (count (_vehicle getVariable ["PlantedBomb",[]]) < 1))};
	if (!(alive _vehicle) or (vehicle _unit == _unit) or (count (_vehicle getVariable ["PlantedBomb",[]]) < 1)) exitWith {};
	["STR_ItemMisc_VehHadASpeedBomb", [(_vehbomb select 3)]] call ZKB_fnc_DynamicText;
	hint format [localize "STR_ItemMisc_VehHadASpeedBomb", (_vehbomb select 3)];
	player groupchat format [localize "STR_ItemMisc_VehHadASpeedBomb", (_vehbomb select 3)];
	WaitUntil {speed _vehicle < (_vehbomb select 3)};
	_carbomb = "Bo_GBU12_LGB" createVehicle (getposATL _vehicle);
	private _bombOwner = [_vehbomb select 1] call ZKB_fnc_GetPlayerFromID;
	if !(isNull _bombOwner) then
		{
		[[_carbomb, _bombOwner],{(_this select 0) setShotParents [(_this select 1), (_this select 1)];}] remoteExecCall ["BIS_fnc_call", 2];	
		};
	};
	
