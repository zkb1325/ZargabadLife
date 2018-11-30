/*
	File: fn_SetShotParents.sqf
	Function: ZKB_fnc_SetShotParents
	Author: ZKB1325
	Description: For remote execution to the server
*/
private _projectile = param [0];
private _vehicle = param [1];
private _instigator = param [2,_vehicle];
_projectile setShotParents [_vehicle,_instigator];