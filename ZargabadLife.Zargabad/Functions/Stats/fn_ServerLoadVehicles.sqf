/*
	Author: ZKB1325
	FileName: fn_ServerLoadVehicles.sqf
	Function: ZKB_fnc_ServerLoadVehicles
	
	Description: Loads all saved vehicles to the map after a server restart
*/

if !("exists" call ZKB_VehicleDB) exitWith {};
private _allVehiclesInDB = ["read", ["SavedVehiclesArraySection", "SavedVehiclesArray", []]] call ZKB_VehicleDB;
{
if !(["read",[_x,"delete",false]] call ZKB_VehicleDB) then
	{
	private _className = ["read",[_x,"className",""]] call ZKB_VehicleDB;
	private _pos = ["read",[_x,"pos",objNull]] call ZKB_VehicleDB;
	private _dir = ["read",[_x,"dir",-1]] call ZKB_VehicleDB;
	private _owner = ["read",[_x,"owner",""]] call ZKB_VehicleDB;
	private _plate = ["read",[_x,"plate",""]] call ZKB_VehicleDB;
	private _trunk = ["read",[_x,"trunk",[]]] call ZKB_VehicleDB;
	private _speedUpgrade = ["read",[_x,"speedUpgrade",0]] call ZKB_VehicleDB;
	private _bomb = ["read",[_x,"bomb",[]]] call ZKB_VehicleDB;
	[_className,_pos,_dir,_owner,_plate,_trunk,_speedUpgrade,false,_x,_bomb] call ZKB_fnc_CreateVehicle;
	}
	else
	{
	["deleteSection",_x] call ZKB_VehicleDB;
	_allVehiclesInDB = _allVehiclesInDB - [_x];
	};
}forEach _allVehiclesInDB;

["write",["SavedVehiclesArraySection","SavedVehiclesArray",_allVehiclesInDB]] call ZKB_VehicleDB;