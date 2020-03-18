/*
	File: fn_DualInvDropEvent.sqf
	Function: ZKB_fnc_DualInvDropEvent
	Author: ZKB1325
	Description: Handles the drag and drop event for the dual inventory
	
	0: Ctrl
		Drop ctrl
	1: Number
		xpos where dropped
	2: Number 
		ypos where dropped
*/
private _dropListCtrl = param [0];
private _xPos = param [1];
private _yPos = param [2];
private _dragFromIDC = param [3];
private _dropData = param [4];
private _dragListCtrl = (uiNamespace getVariable "ZKB_DualInvListMenu") displayCtrl _dragFromIDC;

if (_dropListCtrl isEqualTo _dragListCtrl) exitWith {};

private _dataArray = ((_dropData select 0) select 2);

[_dragListCtrl,_dropListCtrl,_dataArray] call ZKB_fnc_DualInvTransfer;