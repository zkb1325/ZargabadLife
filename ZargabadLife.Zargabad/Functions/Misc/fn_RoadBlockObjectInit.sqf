/*
	Author: ZKB1325
	FileName: fn_RoadBlockObjectInit.sqf
	Function: ZKB_fnc_RoadBlockObjectInit
	Description: Should be put on every roadblock object to get the objects original position and to determine if it should start lowered or not. Will only run on server
	
	[this,true] call ZKB_fnc_RoadBlockObjectInit;
	
	0: Object
		Object to act as roadBlock
		
	1: Bool
		True/False if the object should start down
*/
if !(isServer) exitWith {};
private _object = param [0,objNull,[objNull]];
if (isNull _object) exitWith {};
private _startDown = param [1,false,[true]];
private _objectPos = getposATL _object;
_object setVariable ["rbStartPos",_objectPos,true];
if (_startDown) then
	{
	_object setPosATL [_objectPos select 0,_objectPos select 1,-1000];
	};