#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_InitServer.sqf
	Function: ZKB_fnc_InitServer
	
	Description: Init for the server, the client wont load until this function is done
*/
diag_log "----------------------------------------------------------------------------------------------------";
private _initStartTime = diag_tickTime;
diag_log format ["Server Init - Started: %1",_initStartTime];
addMissionEventHandler ["PlayerConnected",{["STR_Admin_AdminLogPlayerConnected",(_this select 2)] call ZKB_fnc_AdminAddAdminLog;}]; //Move connection logs to player logs
addMissionEventHandler ["HandleDisconnect",{deleteVehicle (_this select 0); ["STR_Admin_AdminLogPlayerDisconnected",(_this select 3)] call ZKB_fnc_AdminAddAdminLog;}];

[] execFSM "FSM\ZKB_TimeMultiplier.fsm";

//Array of laws have as many as you want or just add "" to let the player come up with some on there own
ZKB_LawArray = ["Always Drive on the RIGHT side of the road","Always Holster weapons in Towns.","Speed limits 60 in town 90 out","","","","","","","","","","","",""];
publicVariable "ZKB_LawArray";
ZKB_TaxArray = [5, 5, 5, 5, 5]; //Array of Taxes [Item Tax, Vehicle Tax, Magazine Tax, Weapon Tax, Bank Transfer Tax]
publicVariable "ZKB_TaxArray";


_handle = [] execVM "Configs\Shops.sqf";
waitUntil {scriptDone _handle};

diag_log format ["Server Init - ZKB_StatSaveEnabled: %1 - %2",(SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1),diag_tickTime];
if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
	{
	waitUntil {time > 1};
	diag_log format ["Server Init - Stat loading started: %1",diag_tickTime];
	ZKB_PlayerDB = ["new", "PlayerStats"] call OO_INIDBI;
	ZKB_VehicleDB = ["new", "Vehicles"] call OO_INIDBI;
	ZKB_ImpoundDB = ["new", "Impound"] call OO_INIDBI;
	ZKB_GangsDB = ["new", "Gangs"] call OO_INIDBI;
	ZKB_ServerStats = ["new", "ServerStats"] call OO_INIDBI;
	private _ZKB_StatWipe = ["new", "StatWipe"] call OO_INIDBI;
	
	private _nextWipe = ["read",["nextWipe","nextWipe",[]]] call _ZKB_StatWipe;
	diag_log format ["Server Init - Read next stat wipe: %1",_nextWipe];
	if (_nextWipe isEqualTo []) then
		{
		diag_log format ["Server Init - No stat wipe data: %1",_nextWipe];
		_nextWipe = SETTING(getArray,"ZKB_StatWipeStartDate");
		["write",["nextWipe","nextWipe",_nextWipe]] call _ZKB_StatWipe;
		diag_log format ["Server Init - Write next stat wipe: %1",_nextWipe];
		};
	diag_log format ["Server Init - Comparing date 1: %1 - %2 - Stat Wipe?:%3",missionStart,_nextWipe,([missionStart,_nextWipe] call ZKB_fnc_CompareMinute)];
	if ([missionStart,_nextWipe] call ZKB_fnc_CompareMinute) then
		{
		"delete" call ZKB_PlayerDB;
		"delete" call ZKB_VehicleDB;
		"delete" call ZKB_ImpoundDB;
		"delete" call ZKB_GangsDB;
		"delete" call ZKB_ServerStats;
		_nextWipe = [(_nextWipe select 0) + ((SETTING(getArray,"ZKB_StatWipeDelay")) select 0),(_nextWipe select 1) + ((SETTING(getArray,"ZKB_StatWipeDelay")) select 1),(_nextWipe select 2) + ((SETTING(getArray,"ZKB_StatWipeDelay")) select 2),(_nextWipe select 3) + ((SETTING(getArray,"ZKB_StatWipeDelay")) select 3),(_nextWipe select 4) + ((SETTING(getArray,"ZKB_StatWipeDelay")) select 3)];
		_nextWipe = _nextWipe call BIS_fnc_fixDate;
		diag_log format ["Server Init - Next wipe: %1",_nextWipe];
		diag_log format ["Server Init - Comparing date 2: %1 - %2 - First wipe date passed?:%3",missionStart,_nextWipe,([missionStart,_nextWipe] call ZKB_fnc_CompareMinute)];
		if ([missionStart,_nextWipe] call ZKB_fnc_CompareMinute) then
			{
			diag_log format ["Compared date still true: %1",_nextWipe];
			_nextWipe = [(missionStart select 0)+((SETTING(getArray,"ZKB_StatWipeDelay")) select 0),(missionStart select 1)+((SETTING(getArray,"ZKB_StatWipeDelay")) select 1),(missionStart select 2)+((SETTING(getArray,"ZKB_StatWipeDelay")) select 2),((SETTING(getArray,"ZKB_StatWipeDelay")) select 3),((SETTING(getArray,"ZKB_StatWipeDelay")) select 4)];
			_nextWipe = _nextWipe call BIS_fnc_fixDate;
			diag_log format ["New next wipe: %1",_nextWipe];
			};
		["write",["nextWipe","nextWipe",_nextWipe]] call _ZKB_StatWipe;
		diag_log format ["Server Init - Wrote date to db: %1",_nextWipe];
		};
		
	ZKB_ServerStartTime = missionStart;
	publicVariable "ZKB_ServerStartTime";
	ZKB_NextStatWipe = _nextWipe;
	publicVariable "ZKB_NextStatWipe";
	
	diag_log format ["Server Init - Loading vehicles to map: %1",diag_tickTime];
	call ZKB_fnc_ServerLoadVehicles;
	diag_log format ["Server Init - Loading Impound: %1",diag_tickTime];
	call ZKB_fnc_ServerLoadImpound;
	diag_log format ["Server Init - Loading Gangs: %1",diag_tickTime];
	call ZKB_fnc_ServerLoadGangs;
	diag_log format ["Server Init - Loading Server Stats %1",diag_tickTime];
	call ZKB_fnc_ServerLoadStats;
	
	addMissionEventHandler ["EntityKilled",{
	params ["_killed", "_killer", "_instigator"];
	if !(isNil {_killed getVariable "VehicleUniqueID"}) then
		{
		[_killed getVariable "VehicleUniqueID"] call ZKB_fnc_ServerDeleteVehicle;
		};
	}];
	//addMissionEventHandler ["HandleDisconnect",{["shopstocks"] call ZKB_fnc_ServerSaveStats; ["date"] call ZKB_fnc_ServerSaveStats;}];
	diag_log format ["Server Init - Stat loading done: %1",diag_tickTime];
	
	[] spawn
		{
		while {true} do
			{
			sleep 300;
			["shopstocks"] call ZKB_fnc_ServerSaveStats; 
			["date"] call ZKB_fnc_ServerSaveStats;
			};
		};
	};

[] spawn ZKB_fnc_ElectionLoop;


[] spawn ZKB_fnc_GovernmentConvoy;
[] spawn ZKB_fnc_AssassinMission;

ZKB_ServerInt = true;
publicVariable "ZKB_ServerInt";
diag_log format ["Server Init - Done: %1 - Time Taken: %2",diag_tickTime,[diag_tickTime - _initStartTime,"MM:SS.MS"] call BIS_fnc_secondsToString];
diag_log "----------------------------------------------------------------------------------------------------";