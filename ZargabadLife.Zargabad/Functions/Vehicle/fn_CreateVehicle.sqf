/*
	File: fn_CreateVehicle.sqf
	Function: ZKB_fnc_CreateVehicle
	Author: ZKB1325
	Description: Runs when ever a player buys an item
	
	0: Object
		Vehicle to createVehicle
	1: Object, String, or Array
		object to spawn vehicle at, marker string name to spawn vehicle at, or positionATL array
	2: Number
		Spawn direction of the vehicle -1 for object or marker dir or 0 if array passed for spawn position
	3: String or Object
		UID of owner or player unit
	4: String
		Custom Vehicle plate Name, "" for plate name to be generated
	5: Array
		Array of items to start in vehicles trunk. [] = empty. [["itemname",amount],...]
	6: Number
		Speed upgrade multiplier to add to the vehicle
	7: Bool
		True/False if the vehicle should just be spawned ignoring special placement
*/
private _vehicleclass = param [0,"",[""]];
if (_vehicleclass isEqualTo "") exitWith {};
private _spawnPos = param [1,objNull,[objNull,"",[]]];
if (_spawnPos isEqualTo objNull) exitWith {systemChat "ZKB_fnc_CreateVehicle not given a valid spawn point";};
private _spawnDir = param [2,-1,[0]];
private _ownerUID = param [3,"",["",objNull]];
if (_ownerUID isEqualType objNull) then {_ownerUID = getPlayerUID _ownerUID;};
private _vehPlate = param [4,"",[""]];
private _trunk = param [5,[],[[]]];
private _speedUpgrade = param [6,0,[0]];
private _justSpawn = param [7,false,[false]];
private _vehUID = param [8,"",[""]];
private _bomb = param [9,[],[[]]];


switch (typeName _spawnPos) do
	{
	case "OBJECT": 
		{
		if (_spawnDir isEqualTo -1) then {_spawnDir = getDir _spawnPos};
		_spawnPos = getPosATL _spawnPos;
		};
	case "STRING": 
		{
		if (_spawnDir isEqualTo -1) then {_spawnDir = markerDir _spawnPos};
		_spawnPos = getMarkerPos _spawnPos;
		};
	case "ARRAY": 
		{
		if (_spawnDir isEqualTo -1) then {_spawnDir = 0;};
		_spawnPos = _spawnPos;
		};
	};
	
private _ownerUnit = [_ownerUID] call ZKB_fnc_GetPlayerFromID;
if (_vehPlate isEqualTo "") then
	{
	_vehPlate = format ["Vehicle_%1_%2",_ownerUnit, round(serverTime)];
	};
	
private _veh = _vehicleclass createVehicle _spawnPos;
_veh setVariable ["BIS_enableRandomization",false,true];
[_veh, "", []] call bis_fnc_initVehicle;
if !(_justSpawn) then
	{
	_veh setDir _spawnDir;
	_veh setPosATL _spawnPos;
	};

_veh setVariable ["plate",_vehPlate,true];
_veh setPlateNumber (_vehPlate select [8]);
if (_vehUID isEqualTo "") then
	{
	_vehUID = format ["Vehicle_%1%2%3%4%5%6%7",(missionStart select 0),(missionStart select 1),(missionStart select 2),(missionStart select 3),(missionStart select 4),(missionStart select 5),round(random 1000000)];
	};
_veh setVariable ["VehicleUniqueID",_vehUID,true];

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;

_veh lock 2;

_veh setVariable ["VehicleOwner", _ownerUID, true];
_veh setVariable ["VehicleTrunk", _trunk, true];
_veh setVariable ["VehUpgradeLvl", _speedUpgrade, true];
_veh setVariable ["PlantedBomb",_bomb,true];

_ownerkeys = _ownerUnit getVariable ["ZKB_Keys",[]];
_ownerkeys pushBack _veh;
_ownerUnit setVariable ["ZKB_Keys",_ownerkeys, true];

[_veh] remoteExecCall ["ZKB_fnc_AddVehicleActions",0,_veh];

_veh enableRopeAttach false;
_veh enableVehicleCargo false;