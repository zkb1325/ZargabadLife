#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_AddActions.sqf
	Function: ZKB_fnc_AddActions
	Description: Adds needed addActions to the player
*/
player addAction [localize "STR_ItemMisc_PickUpSpikestrip", {if (["SpikeStrip", 1] call ZKB_fnc_InvAddItem) then {deleteVehicle ((nearestObjects [player,["Land_Razorwire_F"],6]) select 0);};}, "", 1, true, true, "", "_spike = ((nearestObjects [player,[""Land_Razorwire_F""],6]) select 0); !(isNil ""_spike"") and ((damage _spike) == 1)"];

if (IsCiv) then
	{
	player addaction [localize "STR_ItemMisc_TakeGoatMeat", ZKB_fnc_TakeGoatMeat, "", 1, true, true, "", '_neargoats = (nearestObjects [player, ["Goat_random_F"],3]); (count _neargoats > 0) and !(alive (_neargoats select 0)) and (playerSide isEqualTo civilian) and !ZKB_PerformingAction'];
	player addaction [localize "STR_ItemMisc_TakeRabbitMeat", ZKB_fnc_TakeRabbitMeat, "", 1, true, true, "", '_nearrabbits = (nearestObjects [player, ["Rabbit_F"],3]); (count _nearrabbits > 0) and !(alive (_nearrabbits select 0)) and (playerSide isEqualTo civilian) and !ZKB_PerformingAction'];
	
	{
	player addAction [format [localize "STR_Bank_BuyWorkplace",_forEachIndex+1,[_x select 1] call ZKB_fnc_FormatNumber],ZKB_fnc_BuyWorkPlace,(_x select 0),1,true,true,"",format ["!(""%1"" in (missionNamespace getVariable [""ownedWorkplaces"",[]])) and (player inArea ""%1"")",(_x select 0)]];
	}forEach SETTING(getArray,"ZKB_WorkPlaces");

	};