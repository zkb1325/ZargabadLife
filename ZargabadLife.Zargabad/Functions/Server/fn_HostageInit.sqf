/*
	Author: ZKB1325
	FileName: fn_HostageInit.sqf
	Function: ZKB_fnc_HostageInit
	
	Description: Ran on an NPC placed on the map and sets up the unit to be a hostage. Must run on all clients including server/dedicated server. Do not alter any of the NPC's preferences such as disabling simulation
*/
private _hostage = param [0,objNull,[objNull]];
if (isNull _hostage) exitWith {};

_hostage disableAI "TARGET";
_hostage disableAI "MOVE";
_hostage disableAI "FSM";
_hostage disableAI "SUPPRESSION";
_hostage disableAI "COVER";
_hostage disableAI "AUTOCOMBAT";
_hostage disableAI "MINEDETECTION";
_hostage setSpeaker "NoVoice";
_hostage addEventHandler ["HandleDamage",{false;}];
	
_hostage addEventHandler ["Hit",
	{
	private _unit = param [0];
	private _instigator = param [3];
	if (isPlayer _instigator and (_unit getVariable ["activeHostage",false])) then
		{
		_unit setVariable ["activeHostage",false,true];
		_unit setVariable ["killed",true,true];
		["STR_Hostage_HostageKilled",[_instigator,name _instigator]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		if (side _instigator isEqualTo  civilian) then
			{
			[] remoteExecCall ["ZKB_fnc_HostageKilledKiller",_instigator,false];
			};
		};
	}];

if (isServer) then
	{
	private _hostageMarker = createMarker [format ["hostageMarker_%1",netID _hostage],getpos _hostage];																																																	
	_hostageMarker setMarkerShape "ICON";								
	_hostageMarker setMarkerType "mil_triangle";										
	_hostageMarker setMarkerColor "ColorRed";	
	};

if (isDedicated) exitWith {};

if (playerSide isEqualTo civilian) then
	{
	_hostage addAction [localize "STR_Hostage_TakeHostage",{if (playersNumber west < (getNumber (missionConfigFile >> "ZKB_Settings" >> "ZKB_HostageReqCops"))) exitWith {["STR_Robbing_RequiredCops",[(getNumber (missionConfigFile >> "ZKB_Settings" >> "ZKB_HostageReqCops"))]] call ZKB_fnc_DynamicText;}; [(_this select 0),player] remoteExec ["ZKB_fnc_TakeHostageLoop",2,false]; [player,"Taking a Hostage",100000] call ZKB_fnc_AddWanted;},"",1,true,true,"",'(currentWeapon player != "") and ((playersNumber west) >= 5) and !(_target getVariable ["activeHostage",false]) and !(missionNamespace getVariable ["hostageMissionActive",false]) and ((_target getVariable ["lastHostage",0]) < serverTime)',6];
	};
if (playerSide isEqualTo west) then
	{
	_hostage addAction [localize "STR_Hostage_FreeHostage",{(_this select 0) setVariable ["free",true,true];},"",1,true,true,"",'(_target getVariable ["activeHostage",false])',4];
	};