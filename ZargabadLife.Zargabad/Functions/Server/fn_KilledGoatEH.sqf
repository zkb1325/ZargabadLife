/*
	Author: ZKB1325
	File: fn_KilledGoatEH.sqf
	Function: ZKB_fnc_KilledGoatEH
	Description: Runs on the server when a goat is killed in the hunting grounds
*/
_goat = _this select 0;

_goat spawn
	{
	sleep 120;
	if !(isNull _this) then
		{
		deleteVehicle _this;
		};
	};