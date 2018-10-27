/*
	File: fn_AddVehicleActions.sqf
	Function: ZKB_fnc_AddVehicleActions
	Author: ZKB1325
	Description: adds needed vehicle addActions to a vehicle, intended for remoteExecCall
	
	0: Object
		Vehicle to add actions to
*/
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

if !(typeOf _vehicle isEqualTo "Air") then
	{
	_vehicle addAction [format [localize "STR_Vehicle_Impound",[typeOf _vehicle] call ZKB_fnc_GetItemName],ZKB_fnc_Impound,"",1.1,true,true,"","(vehicle player isEqualTo player) and (playerSide isEqualTo west)",10];
	};
_vehicle addAction [localize "STR_Vehicle_VehInformation",ZKB_fnc_VehInfo,"",1.1,true,true,"","(vehicle player isEqualTo player)",10];

_vehicle addAction [format [localize "STR_Vehicle_UnFlipVeh",[typeOf _vehicle] call ZKB_fnc_GetItemName],ZKB_fnc_UnflipVeh,"",1.1,true,true,"","(vehicle player isEqualTo player) and (local _target)",8];

_vehicle addAction [localize "STR_Vehicle_PullOut",ZKB_fnc_PullOut,"",1.1,true,true,"","(vehicle player isEqualTo player) and (count (crew _target) > 0) and !(currentWeapon player isEqualTo """")",5];

_vehicle addAction [localize "STR_Vehicle_ViewTrunk",ZKB_fnc_ViewTrunk,"",1.1,true,true,"","(vehicle player isEqualTo player) and (playerSide isEqualTo west)",8];
_vehicle addAction [localize "STR_Vehicle_SearchVeh",ZKB_fnc_SearchVehicle,"",1.1,true,true,"","(vehicle player isEqualTo player) and (playerSide isEqualTo west)",8];