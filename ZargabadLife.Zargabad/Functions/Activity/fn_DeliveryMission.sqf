#include "..\..\ConfigMacros.hpp"
/*
    File: fn_DeliveryMission.sqf
	Function: ZKB_fnc_DeliveryMission
    Author: ZKB1325

    Description:
	Starts and handles the patrol mission loop
	
	this addAction [localize "STR_Civ_DeliveryMission",ZKB_fnc_DeliveryMission,"",0,true,true,"","playerSide isEqualTo civilian and !(missionNamespace getVariable [""dpMissionActive"",false])",10];
*/
if (missionNamespace getVariable ["dpMissionActive",false]) exitWith {};

if (count SETTING(getArray,"ZKB_DeliveryPoints") < 2) exitWith {hint "There needs to be at least 2 delivery points";};

private _dpStart = param [0,objNull,[objNull]];
if (isNull _dpStart) exitWith {};

missionNamespace setVariable ["dpMissionActive",true];
["STR_Admin_PlayerLogsDeliveryMissionStart",name player] call ZKB_fnc_AdminAddPlayerLog;

private _deliveryPoint = GMVAR(selectRandom (SETTING(getArray,"ZKB_DeliveryPoints") - [str _dpStart]),objNull);

if (isNil "ZKB_dpMissionTask") then
	{
	ZKB_dpMissionTask = player createSimpleTask ["DPMissionTask"];
	};

ZKB_dpMissionTask setSimpleTaskDescription [localize "STR_Civ_DeliveryPointDesc",localize "STR_Civ_DeliveryMission",localize "STR_Civ_DeliveryPoint"];
ZKB_dpMissionTask setSimpleTaskTarget [_deliveryPoint, true];
ZKB_dpMissionTask setSimpleTaskType "box";
ZKB_dpMissionTask setTaskState "Assigned";
ZKB_dpMissionTask setSimpleTaskAlwaysVisible true;
["TaskCreatedIcon",["\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",localize "STR_Civ_DeliveryPointAdded"]] call BIS_fnc_showNotification;

waitUntil {((player distance _deliveryPoint <= 5) and (isNull objectParent player)) or !(alive player)};
if !(alive player) exitWith 
	{
	missionNamespace setVariable ["dpMissionActive",false];
	ZKB_dpMissionTask setTaskState "Failed";
	["TaskFailedIcon",["\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",localize "STR_Civ_DeliveryPointFailed"]] call BIS_fnc_showNotification;
	};

private _dpPointPay = round ((_dpStart distance _deliveryPoint) * SETTING(getNumber,"ZKB_DeliveryBonus"));
["STR_Civ_DeliveryPointComplete",[[_dpPointPay] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
["Money",_dpPointPay] call ZKB_fnc_InvAddItem;
ZKB_dpMissionTask setTaskState "Succeeded";
["TaskSucceededIcon",["\A3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa",format [localize "STR_Civ_DeliveryPointComplete",[_dpPointPay] call ZKB_fnc_FormatNumber]]] call BIS_fnc_showNotification;

["STR_Admin_PlayerLogsDeliveryMissionCompleted",name player,[_dpPointPay] call ZKB_fnc_FormatNumber] call ZKB_fnc_AdminAddPlayerLog;
missionNamespace setVariable ["dpMissionActive",false];
