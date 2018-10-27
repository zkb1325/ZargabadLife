/*
	File: fn_setVehicleVarName.sqf
	Function: ZKB_fnc_setVehicleVarName
	Author: ZKB1325
	Description: Function for setVehicleVarName with intension of remoteExec with white listing
*/

private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};
private _varaible = param [1,"",[""]];
if (_varaible isEqualTo "") exitWith {};
_vehicle setVehicleVarName _varaible;