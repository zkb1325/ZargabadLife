/*
	Author: ZKB1325
	FileName: fn_InventoryOpenedEH.sqf
	Function: ZKB_fnc_InventoryOpenedEH
	
	Description: Handles the player not being able to open others backpacks (unless in a group) and accessing the vehicles inventory (unless you have keys or its unlocked)
*/
private _unit = param [0];
private _container = param [1];
private _parentContainer = param [2];
private _overRide = false;

private _isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");

if ((_isPack isEqualTo 1) and (isPlayer (objectParent _container)) and !((objectParent _container) in (units (group player)))) then {_overRide = true;};

if (((locked _container) > 1) and !(_container in (player getVariable ["ZKB_Keys",[]]))) then {_overRide = true;};
_overRide;