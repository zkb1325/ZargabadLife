/*
	Author: ZKB1325
	FileName: fn_RoadBlockObjectInit.sqf
	Function: ZKB_fnc_RoadBlockObjectInit
	Description: Ran on the roadblock controller or where the addAction was added to toggle the roadblock
	
	[this,[object1],true] call ZKB_fnc_RoadBlockObjectInit;
	
	0: Object
		Object to act as the controller. The object the toggle addaction is added to
	1: Array
		Array of roadblock objects
	2: Bool
		True/False if the object should start down
*/
if !(isServer) exitWith {};
private _controller = param [0,objNull,[objNull]];
if (isNull _controller) exitWith {};
private _objects = param [1,[],[[]]];
if (_objects isEqualTo []) exitWith {};
private _startDown = param [2,false,[true]];

private _objectArray = [];
private _objectsArray = [];

{
_objectArray = [];
_objectArray pushBack (typeOf _x);
_objectArray pushBack (getPosATL _x);
_objectArray pushBack [vectorDir _x,vectorUp _x];
_objectsArray pushBack _objectArray;
}forEach _objects;

_controller setVariable ["roadBlockArray",_objectsArray,true];
_controller setVariable ["curRoadBlockObjects",_objects,true];

if (_startDown) then
	{
	{
	deleteVehicle _x;
	}forEach _objects;
	_controller setVariable ["curRoadBlockObjects",[],true];
	};