/*
    File: fn_AddForce.sqf
	Function: ZKB_fnc_AddForce
    Author: ZKB1325

    Description:
	Sets the velocity of an object
	
	0: Object
		Object to add the force to
		
	1: Array
		Velocity array
*/
private _object = param [0,objNull,[objNull]];
private _velArray = param [1,[0,0,0],[[]]];
_object setVelocity _velArray;