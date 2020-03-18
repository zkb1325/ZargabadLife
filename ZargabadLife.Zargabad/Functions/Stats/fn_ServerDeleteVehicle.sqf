/*
	Author: ZKB1325
	FileName: fn_ServerDeleteVehicle.sqf
	Function: ZKB_fnc_ServerDeleteVehicle
	
	Description: Loads all saved vehicles to the map after a server restart
*/
private _vehUID = param [0,"",[""]];

["write",[_vehUID,"delete",true]] call ZKB_VehicleDB;