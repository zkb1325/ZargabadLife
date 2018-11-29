/*
	File: fn_DualInvUpdateBtn.sqf
	Function: ZKB_fnc_DualInvUpdateBtn
	Author: ZKB1325
	Description: updates both list and other info
	
	0: Ctrl
		list ctrl for button side
	1: Number
		0 = left side 1 = right side
	1: String or Array
		Item data from the list "[""Item"",item_amount]" or ["Item",item_amount]
	2: Number
		Amount
*/

private _listCtrl = param [0];
private _side = param [1];
private _itemData = param [2,[],["",[]]];
if (_itemData isEqualTo "") exitWith {};
if (typeName _itemData isEqualTo typeName "") then {_itemData = parseSimpleArray _itemData;};
if (_itemData isEqualTo []) exitWith {};
private _amount = param [3,0,[0]];
_amount = floor (abs _amount);
if (_amount < 1) then {_amount = 0;};

private _listDataArray = _listCtrl getVariable "listData";
private _btnText = _listDataArray param [5,"",[""]];
if (isLocalized _btnText) then {_btnText = localize _btnText;};

private _display = uiNamespace getVariable "ZKB_DualInvListMenu";
switch _side do
	{
	case 0:
		{
		private _leftButtonCtrl = _display displayCtrl 5050;
		_leftButtonCtrl ctrlSetText format [_btnText, ([(_itemData select 0)] call ZKB_fnc_GetItemName), ([(([(_itemData select 0)] call ZKB_fnc_GetItemWeight)*_amount)] call ZKB_fnc_FormatNumber)];	
		};
		
	case 1:
		{
		private _rightButtonCtrl = _display displayCtrl 5060;
		_rightButtonCtrl ctrlSetText format [_btnText, ([(_itemData select 0)] call ZKB_fnc_GetItemName), ([(([(_itemData select 0)] call ZKB_fnc_GetItemWeight)*_amount)] call ZKB_fnc_FormatNumber)];	
		};
	};
