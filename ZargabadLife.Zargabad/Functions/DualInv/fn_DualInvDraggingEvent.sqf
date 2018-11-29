/*
	File: fn_DualInvDraggingEvent.sqf
	Function: ZKB_fnc_DualInvDraggingEvent
	Author: ZKB1325
	Description: updates both list and other info
	
	0: Number
		0 = Dragging from left list. 1 = Dragging from right list
	1: Number
		xpos
	2: Number
		ypos
*/
systemChat str _this;
private _overCtrl = param [0];
private _xPos = param [1];
private _yPos = param [2];
private _startIDC = param [3];
private _dragData =(param [4]) select 0;
private _dragIndex = _dragData select 1;
private _display = uiNamespace getVariable "ZKB_DualInvListMenu";
private _startCtrl = _display displayCtrl _startIDC;
if (_overCtrl isEqualTo _startCtrl) exitWith
	{
	_startCtrl ctrlSetForegroundColor [.1,0,1,1];
	};
/*
private _combineListXPos = (ctrlPosition _combineListCtrl) select 0;
private _combineListYPos = (ctrlPosition _combineListCtrl) select 1;
private _combineListWidth = (ctrlPosition _combineListCtrl) select 2;
private _combineListHeight = (ctrlPosition _combineListCtrl) select 3;
private _dataArray = parseSimpleArray ((ZKB_InventoryLBDragData select 0) select 2);
private _combineListSize = lbSize _combineListCtrl;
private _exit = false;
for "_i" from 0 to (_combineListSize - 1) do
	{
	if (((ZKB_InventoryLBDragData select 0) select 2) isEqualTo (_combineListCtrl lbData _i)) exitWith {_exit = true;};
	};
if (_exit) exitWith {};

if ((_xPos >= _combineListXPos) and (_xPos <= (_combineListXPos + _combineListWidth)) and (_yPos >= _combineListYPos) and (_yPos <= (_combineListYPos + _combineListHeight))) then
	{
	private _index = _combineListCtrl lbAdd format ["%1 - (%2)",if (((_dataArray select 2) select 0) isEqualTo "") then {(_dataArray select 0) call ZKB_fnc_GetItemDisplayName}else{((_dataArray select 2) select 0)},(_dataArray select 1)];	
	_combineListCtrl lbSetData [_index, str _dataArray];
	};
*/