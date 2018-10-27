/*
	Author: ZKB1325
	FileName: fn_HireWorker.sqf
	Function: ZKB_fnc_HireWorker
	Description: Handles filling the dialog for the factory storage
*/
private ["_fac"];
_fac = _this select 0;
_facarray = _fac getVariable "FactoryInfo";
_workervar = (_facarray select 6)+"Workers";
_curworkers = missionNameSpace getVariable [_workervar,0];

if (_curworkers >= ZKB_MaxWorkers) exitWith {["STR_Fac_MaxWorkers"] call ZKB_fnc_DynamicText;};
if ((["Money"] call ZKB_fnc_GetInvItemAmount) < ZKB_WorkerCost) exitWith {["STR_Shop_NotEnoughMoney"] call ZKB_fnc_DynamicText;};

["Money", ZKB_WorkerCost] call ZKB_fnc_InvRemoveItem;
missionNameSpace setVariable [_workervar, _curworkers + 1];
["STR_Fac_CurrentWorkers",[missionNameSpace getVariable [_workervar,0]]] call ZKB_fnc_DynamicText;