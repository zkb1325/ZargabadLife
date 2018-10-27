#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_GovernmentConvoy.sqf
	Function: ZKB_fnc_GovernmentConvoy
	Description: Government convoy loop
*/
if (count SETTING(getArray,"ZKB_MissionStartPositions") isEqualTo 0) exitWith {diag_log "No start points for the government convoy";};

sleep ((SETTING(getNumber,"ZKB_GovConvoyLoopTime") - 5)*60);
["STR_GovConvoy_LeaveInFewMinutes"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
sleep (5*60);
["STR_GovConvoy_Started"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];

private _startPos = GMVAR(selectRandom SETTING(getArray,"ZKB_MissionStartPositions"),objNull);

private _convoyMarker = createMarker ["govConvoy",_startPos];																																																	
_convoyMarker setMarkerShape "ICON";								
_convoyMarker setMarkerType "mil_marker";										
_convoyMarker setMarkerColor "ColorRed";																														
_convoyMarker setMarkerText localize "STR_GovConvoy";

private _convoyTruck = "CUP_B_HMMWV_Terminal_USA" createVehicle (getPos _startPos);

_convoyTruck setDir getDir _startPos;
_convoyTruck setPosATL getPosATL _startPos;
clearWeaponCargoGlobal _convoyTruck;
clearMagazineCargoGlobal _convoyTruck;
clearItemCargoGlobal _convoyTruck;
clearBackpackCargoGlobal _convoyTruck;
_convoyTruck allowCrewInImmobile true;

[["playerSide isEqualTo civilian",_convoyTruck,[localize "STR_GovConvoy_StealMoney",ZKB_fnc_GovernmentConvoyCivWin,"",1,true,true,"",'(currentWeapon player != "") and (playerSide isEqualTo civilian) and (isNull (driver _target))',10]]] remoteExecCall ["ZKB_fnc_AddAction",0,_convoyTruck];

private _convoyGroupDriver = createGroup west;

private _convoyDriver = _convoyGroupDriver createUnit ["CUP_B_US_Soldier", _startPos, [], 10, "FORM"];
_convoyGroupDriver deleteGroupWhenEmpty true;
_convoyDriver allowFleeing 0;
_convoyDriver setSkill .75;
removeUniform _convoyDriver;
removeVest _convoyDriver;
removeBackpackGlobal _convoyDriver;
removeHeadgear _convoyDriver;
removeAllWeapons _convoyDriver;
removeAllAssignedItems _convoyDriver;
_convoyDriver forceAddUniform "CUP_U_B_USArmy_Base";
_convoyDriver addHeadgear "CUP_H_USArmy_HelmetMICH";
_convoyDriver addVest "CUP_V_B_IOTV_Rifleman";
_convoyDriver linkItem "ItemMap";
_convoyDriver linkItem "ItemCompass";
_convoyDriver linkItem "ItemWatch";
_convoyDriver linkItem "ItemRadio";
_convoyDriver linkItem "CUP_NVG_PVS14";


_convoyGroupDriver setBehaviour "CARELESS";
_convoyGroupDriver setCombatMode "BLUE";
_convoyGroupDriver setSpeedMode "NORMAL";
_convoyDriver moveInDriver _convoyTruck;
_convoyDriver assignAsDriver _convoyTruck;

_convoyTruck setVehicleLock "LOCKED";



_convoyDriver doMove (getMarkerPos "CopBaseAreaMarker");

[_convoyTruck] remoteExec ["ZKB_fnc_GovernmentConvoyCivLoop",civilian,_convoyTruck];

private _driverDied = false;
while {true} do
	{
	if !(alive _convoyTruck) exitWith
		{
		if (!isNull _convoyDriver) then {moveOut _convoyDriver; deleteVehicle _convoyDriver;};
		if (!isNull _convoyTruck) then {deleteVehicle _convoyTruck;};
		["STR_GovConvoy_TruckDestroyed"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		};	
		
	if (_convoyTruck getVariable ["civWins",false]) exitWith
		{
		if (!isNull _convoyDriver) then {deleteVehicle _convoyDriver;};
		if (!isNull _convoyTruck) then {deleteVehicle _convoyTruck;};
		["STR_GovConvoy_CivsWin",[SETTING(getNumber,"ZKB_GovConvoyLoopTime")]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		};
		
	if (!alive _convoyDriver and !_driverDied) then 
		{
		_driverDied = true;
		["STR_GovConvoy_DriverDiedCiv"] remoteExecCall ["ZKB_fnc_DynamicText",civilian,false];
		["STR_GovConvoy_DriverDiedCop"] remoteExecCall ["ZKB_fnc_DynamicText",west,false];
		_convoyTruck setVehicleLock "UNLOCKED";
		if (!isNull _convoyDriver) then {moveOut _convoyDriver; deleteVehicle _convoyDriver;};
		};
		
	if (_convoyTruck inArea "CopBaseAreaMarker") exitWith
		{
		["STR_GovConvoy_CopsWin"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		[] remoteExecCall ["ZKB_fnc_GovernmentConvoyCopWin",west,false];
		if (!isNull _convoyDriver) then {deleteVehicle _convoyDriver;};
		if (!isNull _convoyTruck) then {deleteVehicle _convoyTruck;};
		};
	
	_convoyMarker setMarkerPos (getPos _convoyTruck);
	sleep .5;
	};
deleteMarker _convoyMarker;

[] spawn ZKB_fnc_GovernmentConvoy;


