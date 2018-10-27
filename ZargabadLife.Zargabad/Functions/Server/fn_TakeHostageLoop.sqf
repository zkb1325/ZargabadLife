#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_TakeHostageLoop.sqf
	Function: ZKB_fnc_TakeHostageLoop
	
	Description: Runs on the server when a player takes a hostage
*/
private _hostageUnit = param [0,objNull,[objNull]];
private _hostageTaker = param [1,objNull,[objNull]];
if (isnull _hostageUnit or isnull _hostageTaker) exitWith {};

private _hostagePos = getPosATL _hostageUnit;
private _animation = selectRandom ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05"];
_hostageUnit playMoveNow _animation;
_hostageUnit setVariable ["activeHostage",true,true];
missionNamespace setVariable ["hostageMissionActive",true,true]; //Removing or commenting out this line will allow multiple hostages at once, don't do if there is a single marker for the timer
private _hostageEndTime = (time + (SETTING(getNumber,"ZKB_HostageTime") * 60));

["STR_Hostage_Start"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
//private _hostageMarker = format ["hostageMarker_%1",netID _hostageUnit];	//Old method where it puts the timer on the hostage																																																
private _hostageMarker = "HostageAreaMarker";																																																	
//_hostageMarker setMarkerText format [localize "STR_Hostage_Timer",[_hostageEndTime - time,"MM:SS"] call BIS_fnc_secondsToString]; //Old method where it puts the timer on the hostage	
_hostageMarker setMarkerText format [localize "STR_Hostage_TimerCenter",[_hostageEndTime - time,"MM:SS"] call BIS_fnc_secondsToString];
_hostageMarker setMarkerColor "ColorRed";	

while {true} do
	{
	if !(_hostageTaker inArea "HostageArea") exitWith 
		{
		["STR_Hostage_TakerFailed"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		[] remoteExecCall ["ZKB_fnc_HostageCopWin",west,false];
		};
		
	if (_hostageUnit getVariable ["killed",false]) exitWith
		{
		[] remoteExecCall ["ZKB_fnc_HostageKilled",west,false];
		};
		
	if (_hostageUnit getVariable ["free",false]) exitWith
		{
		["STR_Hostage_Freed"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		[] remoteExecCall ["ZKB_fnc_HostageCopWin",west,false];
		};
		
	if (time > _hostageEndTime) exitWith
		{
		["STR_Hostage_TimePassed",[SETTING(getNumber,"ZKB_HostageTime")]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		[] remoteExecCall ["ZKB_fnc_HostageCivWin",_hostageTaker,false];
		};
	
	_hostageMarker setMarkerText format [localize "STR_Hostage_TimerCenter",[_hostageEndTime - time,"MM:SS"] call BIS_fnc_secondsToString];
	sleep .5;
	};
_hostageMarker setMarkerText localize "STR_Markers_HostageArea";
_hostageMarker setMarkerColor "colorBlack";

if (_hostageUnit getVariable ["killed",false]) then
	{
	[_hostageUnit,getDir _hostageUnit,_hostagePos] spawn 
		{
		(_this select 0) setUnconscious true;
		sleep 10;
		(_this select 0) setUnconscious false;
		sleep 1;
		[(_this select 0),"",false] remoteExecCall ["ZKB_fnc_AnimSync",0,false];
		(_this select 0) setPosATL (_this select 2);
		(_this select 0) setDir (_this select 1);
		};
	}
	else
	{
	[_hostageUnit,"Acts_AidlPsitMstpSsurWnonDnon_out",false] remoteExecCall ["ZKB_fnc_AnimSync",0,false];
	};
	
_hostageUnit setVariable ["activeHostage",false,true];
_hostageUnit setVariable ["free",false,true];
_hostageUnit setVariable ["killed",false,true];
_hostageUnit setVariable ["lastHostage",serverTime + 1800,true]; //30 minutes between taking the unit hostage 'Per Unit'
missionNamespace setVariable ["hostageMissionActive",false,true];