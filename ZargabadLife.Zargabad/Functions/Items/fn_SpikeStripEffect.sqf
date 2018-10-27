/*
	Author: ZKB1325
	File: fn_SpikeStripEffect
	Function: ZKB_fnc_SpikeStripEffect
	Description: Handles spikestrip conditions.
*/
private ["_spike"];
_spike = _this select 0;
if (isNull _spike) exitWith {};
	
waitUntil {(isNull _spike) or (!((vehicle player) == player) and ((vehicle player) distance _spike <= 5))};
if (isNull _spike) exitWith {};

deleteVehicle _spike;
(vehicle player) setHitPointDamage["HitLFWheel",1];
(vehicle player) setHitPointDamage["HitLF2Wheel",1];
(vehicle player) setHitPointDamage["HitRFWheel",1];