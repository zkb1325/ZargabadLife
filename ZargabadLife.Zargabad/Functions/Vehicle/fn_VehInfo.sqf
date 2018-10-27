/*
	File: fn_VehInfo.sqf
	Function: ZKB_fnc_VehInfo
	Author: ZKB1325
	Description: Handles impounding a vehicle
	
	0: Object
		Vehicle to display info of
*/
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};
private _className = typeOf _vehicle;

hint format[localize "STR_Vehicle_VehInfo",  
[_className] call ZKB_fnc_GetItemName,  
_vehicle getVariable ["plate",_vehicle],
if (isNull (driver _vehicle)) then {localize "STR_Vehicle_VehInfoNoDriver"}else{name (driver _vehicle)},  
[typeOf _vehicle,true] call BIS_fnc_crewCount];