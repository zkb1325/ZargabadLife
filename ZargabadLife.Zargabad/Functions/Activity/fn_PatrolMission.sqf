#include "..\..\ConfigMacros.hpp"
/*
    File: fn_PatrolMission.sqf
	Function: ZKB_fnc_PatrolMission
    Author: ZKB1325

    Description:
	Starts and handles the patrol mission loop
	
	this addAction [localize "STR_Cop_GetPatrolMission",ZKB_fnc_PatrolMission,"",0,true,true,"","playerSide isEqualTo west and !(missionNamespace getVariable [""patrolMissionActive"",false])",10];
	this addAction [localize "STR_Cop_CancelPatrolMission",{missionNamespace setVariable ["patrolMissionActive",false];},"",0,true,true,"","missionNamespace getVariable [""patrolMissionActive"",false]",10];
*/
if (missionNamespace getVariable ["patrolMissionActive",false]) exitWith {};

private _logicArray = (nearestObjects [player, ["Logic"],(getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize"))]);
private _patrolPoints = [];
{
if ((str _x) find "PatrolPoint_" > -1) then
	{
	_patrolPoints pushBackUnique _x;
	};
}forEach _logicArray;

if (count _patrolPoints < 2) exitWith {hint "There needs to be at least 2 patrol points on the map any objects named PatrolPoint_ then what ever you want";};
missionNamespace setVariable ["patrolMissionActive",true];

private _patrolPoint = objNull;
private _startPoint = position player;
private _patrolPointMarker = "";
private _patrolPointAreaMarker = "";
private _patrolPointPay = 0;
_patrolPoint = selectRandom (_patrolPoints - [_patrolPoint]);
["STR_Cop_NewPatrolPoint"] call ZKB_fnc_DynamicText;
if (isNil "ZKB_patrolMissionTask") then
	{
	ZKB_patrolMissionTask = player createSimpleTask ["PatrolMissionTask"];
	};


while {(missionNamespace getVariable ["patrolMissionActive",false])} do
	{
	
	sleep 10;

	_patrolPointMarker = createMarkerLocal ["PatrolPointMarker",_patrolPoint];
	_patrolPointMarker setMarkerShapeLocal "ICON";
	_patrolPointMarker setMarkerTypeLocal "mil_warning";
	_patrolPointMarker setMarkerTextLocal localize "STR_Cop_PatrolPoint";
	_patrolPointMarker setMarkerColorLocal "ColorYellow";
	
	_patrolPointAreaMarker = createMarkerLocal ["PatrolPointAreaMarker",_patrolPoint];
	_patrolPointAreaMarker setMarkerShapeLocal "ELLIPSE";
	_patrolPointAreaMarker setMarkerBrushLocal "Grid";
	_patrolPointAreaMarker setMarkerColorLocal "ColorYellow";
	_patrolPointAreaMarker setMarkerSizeLocal [10,10];

	ZKB_patrolMissionTask setSimpleTaskDescription [localize "STR_Cop_PatrolPoint",localize "STR_Cop_PatrolPoint",localize "STR_Cop_PatrolPoint"];
	ZKB_patrolMissionTask setSimpleTaskTarget [_patrolPoint, true];
	ZKB_patrolMissionTask setSimpleTaskType "move";
	ZKB_patrolMissionTask setTaskState "Assigned";
	ZKB_patrolMissionTask setSimpleTaskAlwaysVisible true;
	["TaskCreatedIcon",["\A3\ui_f\data\igui\cfg\simpleTasks\types\move_ca.paa",localize "STR_Cop_NewPatrolPointAdded"]] call BIS_fnc_showNotification;
	
	waitUntil {(vehicle player inArea _patrolPointAreaMarker) or !(missionNamespace getVariable ["patrolMissionActive",false])};
	deleteMarkerLocal _patrolPointMarker;
	deleteMarkerLocal _patrolPointAreaMarker;
	if !(missionNamespace getVariable ["patrolMissionActive",false]) exitWith {};
	
	_patrolPointPay = round ((_startPoint distance _patrolPoint) * SETTING(getNumber,"ZKB_PatrolPointBonus"));
	ZKB_BankAccount = (ZKB_BankAccount + _patrolPointPay) min SETTING(getNumber,"ZKB_MaxBankAccount");
	ZKB_patrolMissionTask setTaskState "Succeeded";
	["TaskSucceededIcon",["\A3\ui_f\data\igui\cfg\simpleTasks\types\move_ca.paa",format [localize "STR_Cop_PatrolPointComplete",[_patrolPointPay] call ZKB_fnc_FormatNumber]]] call BIS_fnc_showNotification;
	
	["STR_Cop_NewPatrolPoint"] call ZKB_fnc_DynamicText;
	_startPoint = _patrolPoint;
	_patrolPoint = selectRandom (_patrolPoints - [_patrolPoint]);
	};
	
["STR_Cop_PatrolMissionEnded"] call ZKB_fnc_DynamicText;
ZKB_patrolMissionTask setTaskState "CANCELED";