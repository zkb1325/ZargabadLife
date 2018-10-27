/*
	File: fn_JailCam.sqf
	Function: ZKB_fnc_JailCam
	Author: ZKB1325
	Description: Opens the jail cam
*/

createDialog "ZKB_MainCam";
private _display = uiNamespace getVariable "ZKB_MainCam";
private _zoomSliderCtrl = _display displayCtrl 25020;

{
(_display displayCtrl _x) ctrlShow false;
}forEach [25030,25040,25050,25060];

_zoomSliderCtrl sliderSetRange [10,125];
_zoomSliderCtrl sliderSetSpeed [5,10];
_zoomSliderCtrl sliderSetPosition 100;

private _cam = "camera" camCreate (getMarkerPos "JailTextMarker");
_cam camSetPos ([(getMarkerPos "JailTextMarker") select 0,(getMarkerPos "JailTextMarker") select 1,(sliderPosition _zoomSliderCtrl)]);
_cam camSetFOV 0.700;
_cam camCommit 0;
waitUntil {camCommitted _cam};
_cam setVectorUp [(sin 0)*(cos -89),-(sin -89),(cos 0)*(cos -89)];

_cam cameraEffect ["internal", "back"];

while {!(isNull _display)} do
	{
	_cam camSetPos ([(getMarkerPos "JailTextMarker") select 0,(getMarkerPos "JailTextMarker") select 1,(sliderPosition _zoomSliderCtrl)]);
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	if !(alive player) exitWith {};
	sleep .01;
	};

_cam cameraEffect ["terminate","back"];
titleCut ["","Black in",1];
closeDialog 0;
camDestroy _cam;