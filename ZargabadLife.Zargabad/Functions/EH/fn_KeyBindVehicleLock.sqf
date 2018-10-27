/*
	Author: ZKB1325
	FileName: fn_KeyBindVehicleLock.sqf
	Function: ZKB_fnc_KeyBindVehicleLock
	
	Description: Key bind function for lock/unlocking vehicles
*/
if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};

if ([player] call ZKB_fnc_IsRestrained) exitWith {true;};
if ([player] call ZKB_fnc_IsSurrending) exitWith {true;};
if ([player] call ZKB_fnc_IsKnockedOut) exitWith {true;};

_vcls = nearestobjects [getpos player, ["motorcycle","Car","Tank","Ship","Air"], 7];
_vcl = _vcls select 0;

if (isNil "_vcl") exitWith {true;};
if (!(_vcl in (player getVariable ["ZKB_Keys",[]])) and !((_vcl getVariable ["VehicleOwner",""]) == "")) exitWith {["STR_Common_VehLockNotYours"] call ZKB_fnc_DynamicText; true;};

_keys = player getVariable ["ZKB_Keys", []];
player setVariable ["ZKB_Keys", (_keys - [objNull]), true];

if((locked _vcl) isEqualTo 2) then 
	{
	if(local _vcl) then 
		{
		_vcl lock 0;
		} 
		else 
		{
		[_vcl,0] remoteExecCall ["lock",_vcl];
		};
	["STR_Common_VehUnLocked"] call ZKB_fnc_DynamicText;
	} 
	else 
	{
	if(local _vcl) then 
		{
		_vcl lock 2;
		} 
		else 
		{
		[_vcl,2] remoteExecCall ["lock",_vcl];
		};
	["STR_Common_VehLocked"] call ZKB_fnc_DynamicText;
	};
true;