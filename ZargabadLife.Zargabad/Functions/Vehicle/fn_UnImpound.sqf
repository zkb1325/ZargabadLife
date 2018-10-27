#include "..\..\ConfigMacros.hpp"
/*
	File: fn_UnImpound.sqf
	Function: ZKB_fnc_UnImpound
	Author: ZKB1325
	Description: Opens and fills the impound lot menu for the player to retrieve an impounded vehicle
*/

private _impoundIndex = param [0,-1,[-1]];
if (isNull ZKB_ImpoundSpawn) exitWith {systemChat "There is no valid spawn for this impound lot";};
if (_impoundIndex isEqualTo -1) exitWith {};

_playerside = switch (true) do
	{
	case IsCiv: {"Civ"};
	case IsCop: {"Cop"};
	};
private _vehInfo = ((missionNamespace getVariable format ["%1_Impound",getPlayerUID player]) select _impoundIndex);
if !((_vehInfo select 2) find _playerside > -1) exitWith {["STR_Vehicle_ImpoundWrongSide"] call ZKB_fnc_DynamicText;};
if(count (nearestobjects [getpos ZKB_ImpoundSpawn,["motorcycle","Car","Tank","Ship","Air"], 3]) > 0) exitWith {["STR_Shop_VehSpawnBlocked"] call ZKB_fnc_DynamicText;};


if ((["Money"] call ZKB_fnc_GetInvItemAmount) < SETTING(getNumber,"ZKB_UnImpoundCost")) exitWith {["STR_Vehicle_ImpoundNoMoney",[[SETTING(getNumber,"ZKB_UnImpoundCost")] call ZKB_fnc_FormatNumber,[_vehInfo select 0] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;};
["Money",SETTING(getNumber,"ZKB_UnImpoundCost")] call ZKB_fnc_InvRemoveItem;
["STR_Vehicle_ImpoundPaid",[[SETTING(getNumber,"ZKB_UnImpoundCost")] call ZKB_fnc_FormatNumber,[_vehInfo select 0] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;

closeDialog 0;

private _impoundInfo = ((missionNamespace getVariable format ["%1_Impound",getPlayerUID player]) deleteAt _impoundIndex);
missionNamespace setVariable [format ["%1_Impound",getPlayerUID player],missionNamespace getVariable format ["%1_Impound",getPlayerUID player],true];

[(_impoundInfo select 0),ZKB_ImpoundSpawn,-1,(_impoundInfo select 1),(_impoundInfo select 2),(_impoundInfo select 3),(_impoundInfo select 4)] spawn ZKB_fnc_CreateVehicle;