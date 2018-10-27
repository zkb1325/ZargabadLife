/*
	File: fn_Impound.sqf
	Function: ZKB_fnc_Impound
	Author: ZKB1325
	Description: Handles impounding a vehicle
	
	0: Object
		Vehicle to impound
*/
private _vehicle = param [0,objNull];
if (isNull _vehicle or (_vehicle getVariable ["impounding",false])) exitWith {};
_vehicle setVariable ["impounding",true,true];
private _vehicleOwnerUID = _vehicle getVariable ["VehicleOwner",""];
if (_vehicleOwnerUID isEqualTo "") exitWith {};

if (({alive _x} count crew _vehicle) > 0) exitWith {["STR_Vehicle_ImpoundVehNotEmpty"] call ZKB_fnc_DynamicText;};
if(_vehicle iskindof "air")exitwith{["STR_Vehicle_ImpoundNotAllowed"] call ZKB_fnc_DynamicText;};

["STR_Vehicle_ImpoundSuccess"] call ZKB_fnc_DynamicText;
["STR_Vehicle_ImpoundSuccessGlobal",[name player,_vehicle getVariable ["plate",_vehicle]]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
private _curImpoundLot = (missionNamespace getVariable [format ["%1_Impound",_vehicleOwnerUID],[]]);
_curImpoundLot pushBack [typeOf _vehicle,_vehicleOwnerUID,_vehicle getVariable ["plate",""],_vehicle getVariable ["VehicleTrunk",[]],_vehicle getvariable ["VehUpgradeLvl", 0]];
missionNamespace setVariable [format ["%1_Impound",_vehicleOwnerUID],_curImpoundLot,true];
deleteVehicle _vehicle;