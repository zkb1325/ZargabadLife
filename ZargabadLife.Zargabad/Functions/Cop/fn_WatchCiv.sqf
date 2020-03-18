/*
	File: fn_WatchCiv.sqf
	Function: ZKB_fnc_WatchCiv
	Author: ZKB1325
	Description: Watches the civ from civcam menu
*/
private _player = param [0,"",[objNull,""]];
if (typeName _player isEqualTo typeName "") then {_player = [_player] call ZKB_fnc_GetPlayerFromID;};
if (isNull _player) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
private _duration = param [1,5,[0]];
private _cost = round (_duration*750);
if (ZKB_BankAccount < _cost) exitWith {["STR_Cop_CivcamMenuWatchNoMoney",[[_cost] call ZKB_fnc_FormatNumber,name _player]] call ZKB_fnc_DynamicText;};
closeDialog 0;
ZKB_BankAccount = ZKB_BankAccount - _cost;
player setVariable ["BankAccount",ZKB_BankAccount,true];
["STR_Admin_PlayerLogsCivCammed",name player,name _player,[_duration,"MM:SS"] call BIS_fnc_secondsToString] call ZKB_fnc_AdminAddPlayerLog;

createDialog "ZKB_MainCam";
private _display = uiNamespace getVariable "ZKB_MainCam";
private _zoomSliderCtrl = _display displayCtrl 25020;
private _timeLeftCtrl = _display displayCtrl 25090;

{
(_display displayCtrl _x) ctrlShow false;
}forEach [25030,25040,25050,25060];

_zoomSliderCtrl sliderSetRange [15,150];
_zoomSliderCtrl sliderSetSpeed [5,10];
_zoomSliderCtrl sliderSetPosition 50;

private _cam = "camera" camCreate (position _player);
_cam camSetPos ([(getPos _player) select 0,(getPos _player) select 1,((getPos _player) select 2) + (sliderPosition _zoomSliderCtrl)]);
_cam camSetTarget _player;
_cam camSetFOV 0.700;
_cam camCommit 0;
waitUntil {camCommitted _cam};

_cam cameraEffect ["internal", "back"];

private _camTime = time + _duration;


while {(time < _camTime) and !(isNull _display)} do
	{
	_cam camSetPos ([(getPos _player) select 0,(getPos _player) select 1,((getPos _player) select 2) + (sliderPosition _zoomSliderCtrl)]);
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	_timeLeftCtrl ctrlSetStructuredText parseText format [localize "STR_Cop_CameraTimeLeft",[_camTime - time,"MM:SS.MS"] call BIS_fnc_secondsToString];
	if !(alive player) exitWith {};
	sleep .01;
	};

_cam cameraEffect ["terminate","back"];
titleCut ["","Black in",1];
closeDialog 0;
camDestroy _cam;