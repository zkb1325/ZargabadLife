/*
	File: fn_DualInvUpdateLists.sqf
	Function: ZKB_fnc_DualInvUpdateLists
	Author: ZKB1325
	Description: updates both list and other info
	
	0: Ctrl
		Left list ctrl
	1: Ctrl
		right list ctrl
*/
private _leftListCtrl = param [0];
private _rightListCtrl = param [1];
private _leftListDataArray = _leftListCtrl getVariable "listData";
private _rightListDataArray = _rightListCtrl getVariable "listData";

private _leftNameSpace = _leftListDataArray select 0;
private _leftVar = _leftListDataArray select 1;
private _leftMaxWeight = _leftListDataArray param [2,-1,[0]];
private _leftTitle = _leftListDataArray param [4,"",[""]];
private _leftWhiteBlackList = _leftListDataArray param [6,[],[[]]];
if !(_leftWhiteBlackList isEqualTo []) then {if !((_leftWhiteBlackList select 0) isEqualType false) then {_leftWhiteBlackList = [false] + _leftWhiteBlackList;};};
private _leftCheckCanGive = _leftListDataArray param [7,false,[false]];
private _leftCheckDrop = _leftListDataArray param [8,false,[false]];

private _rightNameSpace = _rightListDataArray select 0;
private _rightVar = _rightListDataArray select 1;
private _rightMaxWeight = _rightListDataArray param [2,-1,[0]];
private _rightTitle = _rightListDataArray param [4,"",[""]];
private _rightWhiteBlackList = _rightListDataArray param [6,[],[[]]];
if !(_rightWhiteBlackList isEqualTo []) then {if !((_rightWhiteBlackList select 0) isEqualType false) then {_rightWhiteBlackList = [false] + _rightWhiteBlackList;};};
private _rightCheckCanGive = _rightListDataArray param [7,false,[false]];
private _rightCheckDrop = _rightListDataArray param [8,false,[false]];

private _curWeight = 0;
private _leftListData = _leftNameSpace getVariable [_leftVar,[]];
private _rightListData = _rightNameSpace getVariable [_rightVar,[]];

private _display = uiNamespace getVariable "ZKB_DualInvListMenu";
private _leftInfoCtrl = _display displayCtrl 5090;
private _rightInfoCtrl = _display displayCtrl 5095;
lbClear _leftListCtrl;
lbClear _rightListCtrl;

private ["_canGive","_canDrop","_canList","_index"];
{
_canGive = if (_leftCheckCanGive) then {[(_x select 0)] call ZKB_fnc_GetItemCanGive} else {true};
_canDrop = if (_leftCheckDrop) then {[(_x select 0)] call ZKB_fnc_GetItemCanDrop} else {true};
_canList = if !(_rightWhiteBlackList isEqualTo []) then {(((_rightWhiteBlackList select 0) and ((_x select 0) in _rightWhiteBlackList)) or (!(_rightWhiteBlackList select 0) and !((_x select 0) in _rightWhiteBlackList)))} else {true;};
if (_canGive and _canDrop and _canList) then
	{
	_index = _leftListCtrl lbAdd format [localize "STR_Fac_FacStoreList", ([(_x select 0)] call ZKB_fnc_GetItemName), ([(_x select 1)] call ZKB_fnc_FormatNumber), ([([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1)] call ZKB_fnc_FormatNumber)];	
	_leftListCtrl lbSetData [_index, str _x];
	};
}forEach _leftListData;
_leftListCtrl lbSetCurSel 0;

if !(_leftMaxWeight isEqualTo -1) then
	{
	_curWeight = 0;
	{	
	_curWeight = _curWeight + (([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1));
	}forEach _leftListData;

	_leftInfoCtrl ctrlSetText format [localize "STR_Vehicle_VehicleStorage",_curWeight,[_leftMaxWeight] call ZKB_fnc_FormatNumber];
	};
	
{
_canGive = if (_rightCheckCanGive) then {[(_x select 0)] call ZKB_fnc_GetItemCanGive} else {true};
_canDrop = if (_rightCheckDrop) then {[(_x select 0)] call ZKB_fnc_GetItemCanDrop} else {true};
_canList = if !(_leftWhiteBlackList isEqualTo []) then {(((_leftWhiteBlackList select 0) and ((_x select 0) in _leftWhiteBlackList)) or (!(_leftWhiteBlackList select 0) and !((_x select 0) in _leftWhiteBlackList)))} else {true};
if (_canGive and _canDrop and _canList) then
	{
	_index = _rightListCtrl lbAdd format [localize "STR_Fac_FacStoreList", ([(_x select 0)] call ZKB_fnc_GetItemName), ([(_x select 1)] call ZKB_fnc_FormatNumber), ([([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1)] call ZKB_fnc_FormatNumber)];	
	_rightListCtrl lbSetData [_index, str _x];
	};
}forEach _rightListData;
_rightListCtrl lbSetCurSel 0;

if !(_rightMaxWeight isEqualTo -1) then
	{
	_curWeight = 0;
	{	
	_curWeight = _curWeight + (([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1));
	}forEach _rightListData;

	_rightInfoCtrl ctrlSetText format [localize "STR_Vehicle_VehicleStorage",_curWeight,[_rightMaxWeight] call ZKB_fnc_FormatNumber];
	};