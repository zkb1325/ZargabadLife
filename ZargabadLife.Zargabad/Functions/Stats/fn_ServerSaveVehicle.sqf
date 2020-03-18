/*
	Author: ZKB1325
	FileName: fn_ServerSaveVehicle.sqf
	Function: ZKB_fnc_ServerSaveVehicle
	
	Description: Takes passed vehicle and saves it
*/
private _vehicle = param [0,objNull,[objNull]];
if (isnull _vehicle) exitWith {};

private _vehicleUID = _vehicle getVariable "VehicleUniqueID";
if (isNil "_vehicleUID") exitWith {};

private _allVehiclesInDB = ["read", ["SavedVehiclesArraySection", "SavedVehiclesArray", []]] call ZKB_VehicleDB;
if !(_vehicleUID in _allVehiclesInDB) then
	{
	_allVehiclesInDB pushBack _vehicleUID;
	["write",["SavedVehiclesArraySection","SavedVehiclesArray",_allVehiclesInDB]] call ZKB_VehicleDB;
	
	["write",[_vehicleUID,"className",typeOf _vehicle]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"pos",getposATL _vehicle]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"dir",getDir _vehicle]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"owner",_vehicle getVariable ["VehicleOwner",""]]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"plate",_vehicle getVariable ["plate",""]]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"trunk",_vehicle getVariable ["VehicleTrunk",[]]]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"speedUpgrade",_vehicle getVariable ["VehUpgradeLvl", 0]]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"bomb",_vehicle getVariable ["PlantedBomb",[]]]] call ZKB_VehicleDB;
	}
	else
	{
	["write",[_vehicleUID,"pos",getposATL _vehicle]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"dir",getDir _vehicle]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"trunk",_vehicle getVariable ["VehicleTrunk",[]]]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"speedUpgrade",_vehicle getVariable ["VehUpgradeLvl", 0]]] call ZKB_VehicleDB;
	["write",[_vehicleUID,"bomb",_vehicle getVariable ["PlantedBomb",[]]]] call ZKB_VehicleDB;
	};