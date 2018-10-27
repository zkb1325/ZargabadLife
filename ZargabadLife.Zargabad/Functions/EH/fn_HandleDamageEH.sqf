/*
    File: fn_HandleDamageEH.sqf
	Function: ZKB_fnc_HandleDamageEH
    Author: ZKB1325

    Description:
    HandleDamage EventHandler Function
*/
private _unit = param [0];
private _selection = param [1];
private _damage = param [2];
private _source = param [3];
private _projectile = param [4];
private _hitIndex = param [5];
private _instigator = param [6];
private _hitPoint = param [7];

if (_projectile in ["CUP_B_9x18_SD","CUP_B_12Gauge_74Slug"]) then
	{
	if ((((_projectile isEqualTo "CUP_B_12Gauge_74Slug") and (_unit distance _instigator <= 50)) or ((_projectile isEqualTo "CUP_B_9x18_SD") and (_unit distance _instigator <= 15)))  and (_selection isEqualTo "legs")) then
		{
		["STR_Cop_StunnedBy",[name _unit,name _instigator]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		[name _instigator] spawn ZKB_fnc_KnockedOut;
		_unit setHit ["legs",1];
		};
	_damage = if (_selection isEqualTo "") then {damage _unit} else {_unit getHit _selection};
	};
_damage;