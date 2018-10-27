/*
	File: fn_SatCam.sqf
	Function: ZKB_fnc_SatCam
	Author: ZKB1325
	Description: Opens the jail cam
*/

createDialog "ZKB_MainCam";
private _display = uiNamespace getVariable "ZKB_MainCam";
private _zoomSliderCtrl = _display displayCtrl 25020;
private _upDownSliderCtrl = _display displayCtrl 25030;
private _upDownTextCtrl = _display displayCtrl 25040;
private _leftRightSliderCtrl = _display displayCtrl 25050;
private _leftRightTextCtrl = _display displayCtrl 25060;
private _infoTextCtrl = _display displayCtrl 25090;

_zoomSliderCtrl sliderSetRange [25,250];
_zoomSliderCtrl sliderSetSpeed [5,10];
_zoomSliderCtrl sliderSetPosition 50;

_upDownSliderCtrl sliderSetRange [-(getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize")),0];
_upDownSliderCtrl sliderSetSpeed [50,100];
_upDownSliderCtrl sliderSetPosition -((position player) select 1);

_leftRightSliderCtrl sliderSetRange [0,getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize")];
_leftRightSliderCtrl sliderSetSpeed [50,100];
_leftRightSliderCtrl sliderSetPosition ((position player) select 0);

private _cam = "camera" camCreate (position player);
_cam camSetPos ([(position player) select 0,(position player) select 1,(sliderPosition _zoomSliderCtrl)]);
//_cam camSetTarget [(position player) select 0,(position player) select 1,0];
_cam camSetFOV 0.700;
_cam camCommit 0;
waitUntil {camCommitted _cam};
_cam setVectorUp [(sin 0)*(cos -89),-(sin -89),(cos 0)*(cos -89)];

_cam cameraEffect ["internal", "back"];

while {!(isNull _display)} do
	{
	_cam camSetPos ([(sliderPosition _leftRightSliderCtrl),abs(sliderPosition _upDownSliderCtrl),(sliderPosition _zoomSliderCtrl)]);
	_cam camCommit 0;
	waitUntil {camCommitted _cam};
	
	_upDownTextCtrl ctrlSetStructuredText parseText format [localize "STR_Cop_SatCamMoveUpDown",abs(sliderPosition _upDownSliderCtrl)];
	_leftRightTextCtrl ctrlSetStructuredText parseText format [localize "STR_Cop_SatCamMoveLeftRight",(sliderPosition _leftRightSliderCtrl)];
	_infoTextCtrl ctrlSetStructuredText parseText format [localize "STR_Cop_SatCamMapGrid",mapGridPosition _cam];
	
	_upDownSliderCtrl sliderSetSpeed [(sliderPosition _zoomSliderCtrl)/2,(sliderPosition _zoomSliderCtrl)];
	_leftRightSliderCtrl sliderSetSpeed [(sliderPosition _zoomSliderCtrl)/2,(sliderPosition _zoomSliderCtrl)];
	
	if !(alive player) exitWith {};
	sleep .01;
	};

_cam cameraEffect ["terminate","back"];
titleCut ["","Black in",1];
closeDialog 0;
camDestroy _cam;