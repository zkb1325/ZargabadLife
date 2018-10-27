/*
	File: fn_PullOut.sqf
	Function: ZKB_fnc_PullOut
	Author: ZKB1325
	Description: Handles pulling players out of a vehicle alive or dead
	
	0: Object
		Vehicle to pull the person out of
*/
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

if (count (crew _vehicle) isEqualTo 0) exitWith {};
private _target = (crew _vehicle) select 0;
private _pulloutTime = 30;
if (locked _vehicle > 1) then {["STR_Vehicle_PullOutLocked"] call ZKB_fnc_DynamicText; _pulloutTime = 50;};
private _success = true;

["STR_Vehicle_PullOutPullingOut",[name _target]] call ZKB_fnc_DynamicText;
if (isPlayer _target) then
	{
	["STR_Vehicle_PullOutBeingPullingOut",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",_target,false];
	};

for "_i" from 0 to _pulloutTime do
	{
	if (player distance _vehicle > 5) exitWith {["STR_Vehicle_PullOutToFar"] call ZKB_fnc_DynamicText; _success = false;};
	if (count (crew _vehicle) isEqualTo 0) exitWith {["STR_Vehicle_PullOutNoCrew"] call ZKB_fnc_DynamicText; _success = false;};
	sleep .1;
	};
	
if (_success) then
	{
	if (isCop and isPlayer _target) then
		{
		["STR_Vehicle_PullOutGlobal",[name player, name _target]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		};
		
	if(local _vehicle) then 
		{
		_vehicle lock 0;
		} 
		else 
		{
		[_vehicle,0] remoteExecCall ["lock",_vehicle];
		};
		
	if (alive _target) then
		{
		moveOut _target;
		}
		else
		{
		private _driverpos = _vehicle selectionPosition ("pos driver");  
		_ejectpos = [(_driverpos select 0)-.5, (_driverpos select 1), (_driverpos select 2)+2]; 
		_ejectpos = (_target modelToWorld _ejectpos);
		_target setPosASL (AGLtoASL _ejectpos);
		};
	};