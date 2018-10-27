#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_AssassinMission.sqf
	Function: ZKB_fnc_AssassinMission
	Description: Government convoy loop
*/
if (count SETTING(getArray,"ZKB_MissionStartPositions") isEqualTo 0) exitWith {diag_log "No start points for the assassin mission";};

sleep (SETTING(getNumber,"ZKB_VipLoopTime")*60);
["STR_Assassin_Started"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];

private _startPos = GMVAR(selectRandom SETTING(getArray,"ZKB_MissionStartPositions"),objNull);

private _assassinMarker = createMarker ["VipMarker",_startPos];																																																	
_assassinMarker setMarkerShape "ICON";								
_assassinMarker setMarkerType "mil_destroy";										
_assassinMarker setMarkerColor "ColorRed";																														
_assassinMarker setMarkerText localize "STR_Assassin";

private _assassinVehicle = "CUP_B_HMMWV_M2_GPK_USA" createVehicle (getPos _startPos);

_assassinVehicle setDir getDir _startPos;
_assassinVehicle setPosATL getPosATL _startPos;
clearWeaponCargoGlobal _assassinVehicle;
clearMagazineCargoGlobal _assassinVehicle;
clearItemCargoGlobal _assassinVehicle;
clearBackpackCargoGlobal _assassinVehicle;
_assassinVehicle allowCrewInImmobile true;

private _assassinGroup = createGroup west;

private _assassinDriver = _assassinGroup createUnit ["CUP_B_US_Soldier", _startPos, [], 10, "FORM"];
_assassinGroup deleteGroupWhenEmpty true;
_assassinDriver allowFleeing 0;
_assassinDriver setSkill .75;
removeUniform _assassinDriver;
removeVest _assassinDriver;
removeBackpackGlobal _assassinDriver;
removeHeadgear _assassinDriver;
removeAllWeapons _assassinDriver;
removeAllAssignedItems _assassinDriver;
_assassinDriver forceAddUniform "CUP_U_B_USArmy_Base";
_assassinDriver addHeadgear "CUP_H_USArmy_HelmetMICH";
_assassinDriver addVest "CUP_V_B_IOTV_Rifleman";
_assassinDriver linkItem "ItemMap";
_assassinDriver linkItem "ItemCompass";
_assassinDriver linkItem "ItemWatch";
_assassinDriver linkItem "ItemRadio";
_assassinDriver linkItem "CUP_NVG_PVS14";
_assassinDriver addWeapon "CUP_arifle_M4A1_desert";
_assassinDriver addPrimaryWeaponItem "CUP_optic_CompM2_Black";
_assassinDriver addPrimaryWeaponItem "CUP_30Rnd_556x45_Stanag";
for "_i" from 1 to 2 do {_assassinDriver addItemToUniform "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 8 do {_assassinDriver addItemToVest "CUP_30Rnd_556x45_Stanag";};
_assassinDriver moveInDriver _assassinVehicle;
_assassinDriver assignAsDriver _assassinVehicle;

_assassinGroup setBehaviour "AWARE";
_assassinGroup setCombatMode "RED";
_assassinGroup setSpeedMode "NORMAL";

private _assassinGuard = _assassinGroup createUnit ["CUP_B_US_Soldier", _startPos, [], 10, "FORM"];
_assassinGuard allowFleeing 0;
_assassinGuard setSkill .75;
removeUniform _assassinGuard;
removeVest _assassinGuard;
removeBackpackGlobal _assassinGuard;
removeHeadgear _assassinGuard;
removeAllWeapons _assassinGuard;
removeAllAssignedItems _assassinGuard;
_assassinGuard forceAddUniform "CUP_U_B_USArmy_Base";
_assassinGuard addHeadgear "CUP_H_USArmy_HelmetMICH";
_assassinGuard addVest "CUP_V_B_IOTV_Rifleman";
_assassinGuard linkItem "ItemMap";
_assassinGuard linkItem "ItemCompass";
_assassinGuard linkItem "ItemWatch";
_assassinGuard linkItem "ItemRadio";
_assassinGuard linkItem "CUP_NVG_PVS14";
_assassinGuard addWeapon "CUP_arifle_M4A1_desert";
_assassinGuard addPrimaryWeaponItem "CUP_optic_CompM2_Black";
_assassinGuard addPrimaryWeaponItem "CUP_30Rnd_556x45_Stanag";
for "_i" from 1 to 2 do {_assassinGuard addItemToUniform "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 8 do {_assassinGuard addItemToVest "CUP_30Rnd_556x45_Stanag";};
_assassinGuard moveInGunner _assassinVehicle;
_assassinGuard assignAsGunner _assassinVehicle;

private _assassinTarget = _assassinGroup createUnit ["CUP_B_US_Soldier", _startPos, [], 10, "FORM"];
_assassinTarget allowFleeing 0;
_assassinTarget setSkill .75;
removeUniform _assassinTarget;
removeVest _assassinTarget;
removeBackpackGlobal _assassinTarget;
removeHeadgear _assassinTarget;
removeAllWeapons _assassinTarget;
removeAllAssignedItems _assassinTarget;
_assassinTarget forceAddUniform "CUP_U_C_Suit_01";
_assassinTarget addHeadgear "CUP_H_USArmy_HelmetMICH";
_assassinTarget addVest "CUP_V_PMC_IOTV_Black_Empty";
_assassinTarget linkItem "ItemMap";
_assassinTarget linkItem "ItemCompass";
_assassinTarget linkItem "ItemWatch";
_assassinTarget linkItem "ItemRadio";
_assassinTarget addWeapon "CUP_arifle_M4A1_desert";
_assassinTarget addPrimaryWeaponItem "CUP_30Rnd_556x45_Stanag";
for "_i" from 1 to 2 do {_assassinTarget addItemToUniform "CUP_30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_assassinTarget addItemToVest "CUP_30Rnd_556x45_Stanag";};
_assassinTarget moveInCargo _assassinVehicle;
_assassinTarget assignAsCargo _assassinVehicle;
_assassinTarget addEventHandler ["Killed", 
	{
	private _unit = param [0];
	private _killer = param [1,objNull];
	private _instigator = param [2,objNull];
	if ((isNull _instigator) or !(isPlayer _instigator)) then {_instigator = UAVControl vehicle _killer select 0;};
	if (isNull _instigator) then {_instigator = driver _killer;};
	if !(isPlayer _instigator) then {_instigator = _unit};
	
	if !(_instigator isEqualTo _unit) then
		{
		if (side _instigator isEqualTo west) exitWith {};
		[] remoteExecCall ["ZKB_fnc_AssassinMissionCivWin",_instigator,false];
		};
	["STR_Assassin_VipKilled"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	}];

sleep 1;
_assassinVehicle setVehicleLock "LOCKED";


private _wp = _assassinGroup addWaypoint [(getMarkerPos "CopBaseAreaMarker"), 5];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 10;
_wp setWaypointSpeed "NORMAL";
_assassinGroup setCurrentWaypoint _wp;

[_assassinTarget] remoteExec ["ZKB_fnc_AssassinMissionCivLoop",civilian,_assassinTarget];

private _driverDied = false;
private _vehicleDisabled = false;
while {true} do
	{
	if !(alive _assassinTarget) exitWith //Target dead civ wins
		{
		if (!isNull _assassinDriver) then {deleteVehicle _assassinDriver;};
		if (!isNull _assassinGuard) then {deleteVehicle _assassinGuard;};
		if (!isNull _assassinTarget) then {deleteVehicle _assassinTarget;};
		if (!isNull _assassinVehicle) then {deleteVehicle _assassinVehicle;};
		};	
		
	if (!(canMove _assassinVehicle) and !_vehicleDisabled) then //Vehicle disabled
		{
		_vehicleDisabled = true;
		_assassinVehicle setVelocity [0,0,0];
		if (alive _assassinDriver) then
			{
			unassignVehicle _assassinDriver;
			_assassinDriver action ["eject", _assassinVehicle];
			};
		if (alive _assassinGuard) then
			{
			unassignVehicle _assassinGuard;
			_assassinGuard action ["eject", _assassinVehicle];
			};
		if (alive _assassinTarget) then
			{
			unassignVehicle _assassinTarget;
			_assassinTarget action ["eject", _assassinVehicle];
			};
		sleep .5;
		deleteVehicle _assassinVehicle;
		["STR_Assassin_VehicleDisabled"] remoteExecCall ["ZKB_fnc_DynamicText",civilian,false];
		};
		
	if (!alive _assassinDriver and !_driverDied and !_vehicleDisabled) then //Driver dead
		{
		_driverDied = true;
		moveOut _assassinDriver;
		deleteVehicle _assassinDriver;
		["STR_Assassin_DriverDead"] remoteExecCall ["ZKB_fnc_DynamicText",west,false];
		_assassinTarget moveInDriver _assassinVehicle;
		_assassinTarget assignAsDriver _assassinVehicle;
		};
		
	if (_assassinTarget inArea "CopBaseAreaMarker") exitWith
		{
		["STR_Assassin_CopsWin"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		[] remoteExecCall ["ZKB_fnc_AssassinMissionCopWin",west,false];
		if (!isNull _assassinDriver) then {deleteVehicle _assassinDriver;};
		if (!isNull _assassinGuard) then {deleteVehicle _assassinGuard;};
		if (!isNull _assassinTarget) then {deleteVehicle _assassinTarget;};
		if (!isNull _assassinVehicle) then {deleteVehicle _assassinVehicle;};
		};
	
	_assassinMarker setMarkerPos (getPos _assassinTarget);
	sleep .5;
	};
deleteMarker _assassinMarker;

[] spawn ZKB_fnc_AssassinMission;


