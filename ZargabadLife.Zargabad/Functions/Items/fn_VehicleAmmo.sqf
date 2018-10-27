/*
	Author: ZKB1325
	File: fn_VehicleAmmo.sqf
	Function: ZKB_fnc_VehicleAmmo
	Description: Adds another reload to currently selected vehicle weapon. Only adds one at a time keep using to add more
*/

if (vehicle player == player) exitWith {["STR_Common_NotInVeh"] call ZKB_fnc_DynamicText;};

_item = _this select 1;

if (count (assignedVehicleRole player) > 1) then
	{
	if ((vehicle player) currentMagazineTurret ((assignedVehicleRole player) select 1) == "") exitWith {};
	(vehicle player) addMagazineTurret [(vehicle player) currentMagazineTurret ((assignedVehicleRole player) select 1),((assignedVehicleRole player) select 1)];
	
	[_item, 1] call ZKB_fnc_InvRemoveItem;
	["STR_ItemMisc_VehAmmoAdded"] call ZKB_fnc_DynamicText;
		
	}
	else
	{
	if ((vehicle player) currentMagazineTurret ([-1]) == "") exitWith {};
	(vehicle player) addMagazineTurret [(vehicle player) currentMagazineTurret ([-1]),([-1])];
	
	[_item, 1] call ZKB_fnc_InvRemoveItem;
	["STR_ItemMisc_VehAmmoAdded"] call ZKB_fnc_DynamicText;
	
	};
