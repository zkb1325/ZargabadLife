#include "..\..\ConfigMacros.hpp"
/*
	File: fn_GetOutEH.sqf
	Function: ZKB_fnc_GetOutEH
	Author: ZKB1325
	Description: Runs when a player gets out of a vehicle
*/
private _unit = param [0];
private _vehicle = param [2];

if (alive player) then
	{
	["STR_Admin_PlayerLogsGotOutVeh",name player,[typeOf _vehicle] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddPlayerLog;
	};
	
if !((_vehicle getVariable ["VehicleUniqueID",""]) isEqualTo "") then
	{
	if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
		{
		if (serverTime < (_vehicle getVariable ["lastSaved",0])) exitWith {};
		_vehicle setVariable ["lastSaved",serverTime + 10,true];
		[_vehicle] remoteExecCall ["ZKB_fnc_ServerSaveVehicle",2,false];
		};
	};