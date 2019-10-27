#include "..\..\ConfigMacros.hpp"
/*
    File: fn_RespawnEH.sqf
	Function: ZKB_fnc_RespawnEH
    Author: ZKB1325

    Description:
    Respawn EventHandler Function
*/

private _unit = param [0,objNull];
private _cropse = param [1,objNull];
if !(isNull _cropse) then {deleteVehicle _cropse};
[] spawn
	{
	if !(isNil "ZKB_LastKilledBy") then
		{
		waitUntil {alive ZKB_LastKilledBy};
		[player] remoteExecCall ["ZKB_fnc_KilledPlayer",ZKB_LastKilledBy,false];
		ZKB_LastKilledBy = nil;
		};
	};
_unit allowDamage false;

call ZKB_fnc_ClearGear;
player setUnitLoadout [ZKB_RespawnLoadOut,false];

private _respawnTime = switch (side _unit) do
	{
	case west: {time + ((SETTING(getNumber,"ZKB_CopRespawnTimeBase") + ((ZKB_CivsKilled select 0) * SETTING(getNumber,"ZKB_KillCivPenaltyt")) + (ZKB_Suicides * SETTING(getNumber,"ZKB_SuicidePenalty"))) min SETTING(getNumber,"ZKB_MaxRespawnTime"))};
	case civilian: {time + ((SETTING(getNumber,"ZKB_CivRespawnTimeBase") + ((ZKB_CivsKilled select 0) * SETTING(getNumber,"ZKB_KillCivPenaltyt")) + ((ZKB_CopsKilled select 0) * SETTING(getNumber,"ZKB_KillCopPenalty")) + (ZKB_Suicides * SETTING(getNumber,"ZKB_SuicidePenalty"))) min SETTING(getNumber,"ZKB_MaxRespawnTime"))};
	default {(time + 30)};
	};

[_respawnTime] spawn
	{
	private _camHeight = 0;
	private _camRadius = 0;
	private _camSpeed = 1;
	private _camTarget = objNull;
	private _camAngle = 0;
	switch (true) do
		{
		case IsCop: 
			{
			_camHeight = 150;
			_camRadius = 250;
			_camSpeed = .04;
			_camTarget = Cop_Respawn;
			};
		case IsCiv:
			{
			_camHeight = 150;
			_camRadius = 250;
			_camSpeed = .04;
			_camTarget = Civilian_Respawn;
			};
		};
	private _camPos = _camTarget getPos [_camRadius, _camAngle];
	_camPos = (AGLtoASL _camPos); 
	_camPos set [2,_camHeight]; 
	_camPos = ASLToAGL _camPos;
	
	private _camera = "camera" camcreate _camPos;
	_camera cameraEffect ["internal", "back"];
	_camera camSetFOV 0.700;
	_camera camPrepareTarget _camTarget;
	_camera camCommitPrepared 0;
	
	waitUntil {camCommitted _camera};
	
	while {(_this select 0) > time} do
		{
		_camPos = _camTarget getPos [_camRadius, _camAngle];
		_camPos = (AGLtoASL _camPos); 
		_camPos set [2,_camHeight]; 
		_camPos = ASLToAGL _camPos;
		
		_camera camPreparePos _camPos;
		_camera camCommitPrepared _camSpeed;

		waitUntil {camCommitted _camera || ((_this select 0) <= time)};
		
		_camera camPreparePos _camPos;
		_camera camCommitPrepared 0;
		
		_camAngle = _camAngle + 1;
		};
	sleep .5;
	_camera cameraEffect ["terminate","back"];
	titleCut [" ","Black in"];
	camDestroy _camera;
	titlefadeout 0;
	0 cutfadeout 0;
	};
	
if (IsCop) then 
	{
	titleText [format[localize "STR_Respawn_CopRespawnTime", SETTING(getNumber,"ZKB_CopRespawnTimeBase"), SETTING(getNumber,"ZKB_KillCivPenaltyt"), [round(SETTING(getNumber,"ZKB_CopRespawnTimeBase") + ((ZKB_CivsKilled select 0) * SETTING(getNumber,"ZKB_KillCivPenaltyt")) + (SETTING(getNumber,"ZKB_SuicidePenalty") * ZKB_Suicides)) min SETTING(getNumber,"ZKB_MaxRespawnTime"), "MM:SS"] call BIS_Fnc_secondsToString], "plain"];
	} 
	else 
	{
	titleText [format[localize "STR_Respawn_CivRespawnTime", ZKB_Deaths, ZKB_Suicides, (ZKB_CopsKilled select 0), (ZKB_CivsKilled select 0), [round (SETTING(getNumber,"ZKB_CivRespawnTimeBase") + ((ZKB_CivsKilled select 0) * SETTING(getNumber,"ZKB_KillCivPenaltyt")) + ((ZKB_CopsKilled select 0) * SETTING(getNumber,"ZKB_KillCopPenalty")) + (SETTING(getNumber,"ZKB_SuicidePenalty") * ZKB_Suicides)) min SETTING(getNumber,"ZKB_MaxRespawnTime"), "MM:SS"] call BIS_Fnc_secondsToString], "plain"];
	};
	
sleep 10;

[_respawnTime] spawn
	{
	private _respawnTime = (_this select 0);
	while {_respawnTime > time} do
		{

		titletext [format[localize "STR_Respawn_TimeRemaining", [round(_respawnTime - time), "MM:SS"] call BIS_Fnc_secondsToString], "plain"];

		sleep 1;
		};
		
	if (player getVariable ["InJail",false]) then
		{
		player setVariable ["InJail",false,true];
		[(missionNamespace getVariable ["JailTime",0]),player getVariable ["Bail",0],name player] spawn ZKB_fnc_Jail;
		}
		else
		{
		switch (playerSide) do
			{
			case west: {player setPosASL getPosASL Cop_Respawn;};
			case civilian: {player setPosASL getPosASL Civilian_Respawn;};
			default {player setPosASL getPosASL Civilian_Respawn;};
			};
		};
	player setVariable ["respawning",false,true];
	};
	

player setVariable ["ZKB_MaxINVWeight",SETTING(getNumber,"ZKB_MaxINVWeight"),true];	
ZKB_CopsKilled set [0,0];
player setVariable ["CopKills",ZKB_CopsKilled,true];
ZKB_CivsKilled set [0,0];
player setVariable ["CivKills",ZKB_CivsKilled,true];
[] spawn ZKB_fnc_SavePlayer;
_unit allowDamage true;
player enableStamina false;
[100000] call ZKB_fnc_SetRating;
call ZKB_fnc_AddActions;