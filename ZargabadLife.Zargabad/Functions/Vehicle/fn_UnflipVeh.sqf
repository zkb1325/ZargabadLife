/*
	File: fn_UnflipVeh.sqf
	Function: ZKB_fnc_UnflipVeh
	Author: ZKB1325
	Description: Handles unflipping a vehicle
	
	0: Object
		Vehicle to unflip
*/
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};
private _className = typeOf _vehicle;

if (({alive _x} count crew _vehicle) > 0) exitWith {["STR_Vehicle_ImpoundVehNotEmpty"] call ZKB_fnc_DynamicText;};

["STR_Vehicle_UnFlipVehWait",[[_className] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;

sleep 10;

if (player distance _vehicle > 10) exitWith {["STR_Vehicle_UnFlipVehToFar"] call ZKB_fnc_DynamicText;};

["STR_Vehicle_UnFlipVehUnFlipped",[[_className] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
_vehicle setVectorUp surfaceNormal position _vehicle;