/*
	File: fn_DualInvOpen.sqf
	Function: ZKB_fnc_DualInvOpen
	Author: ZKB1325
	Description: Handles opening dual inventory menu
	
	0: Array
		Info for the left list box
		0: NameSpace
			NameSpace for inventory variable
		1: String
			Inventory Variable
		2: Number
			Max weight. Default: -1. -1 = not checked.
		3: Bool
			True/False if the variable is global. Default: False
		4: String
			List Title, string or localized string. Default: ""
		5: String
			Button text formated with weight, string or localized string. Example: "Take %1 (%2kg)" or "Store %1 (%2kg)". Default: ""
		6: Array
			Inventory Blacklist or Whitelist, Items that can NOT be put into this inventory or ONLY Items allowed to show up. Example: Blacklist = [false,"Item1","Item2"] Whitelist = [true,"Item1","Item2"] Default: [] or [false,...] "Blacklist" if not BOOL is provided at index 0
		7: Bool
			True/False if ZKB_fnc_GetItemCanGive should be used. Default: False
		8: Bool
			True/False if ZKB_fnc_GetItemCanDrop should be used Default: False
			
	1: Array
		Info for the right list box
		0: NameSpace
			NameSpace for inventory variable
		1: String
			Inventory Variable
		2: Number
			Max weight. Default: -1. -1 = not checked.
		3: Bool
			True/False if the variable is global. Default: False
		4: String
			List Title, string or localized string. Default: ""
		5: String
			Button text formated with weight, string or localized string. Example: "Take %1 (%2kg)" or "Store %1 (%2kg)". Default: ""
		6: Array
			Inventory Blacklist or Whitelist, Items that can NOT be put into this inventory or ONLY Items allowed to show up. Example: Blacklist = [false,"Item1","Item2"] Whitelist = [true,"Item1","Item2"] Default: [] or [false,...] "Blacklist" if not BOOL is provided at index 0
		7: Bool
			True/False if ZKB_fnc_GetItemCanGive should be used. Default: False
		8: Bool
			True/False if ZKB_fnc_GetItemCanDrop should be used Default: False
			
*/
private _leftListDataArray = param [0,[],[[]]];
if (_leftListDataArray isEqualTo []) exitWith {};
private _rightListDataArray = param [1,[],[[]]];
if (_rightListDataArray isEqualTo []) exitWith {};

private _leftNameSpace = _leftListDataArray select 0;
private _leftVar = _leftListDataArray select 1;
private _leftMaxWeight = _leftListDataArray param [2,-1,[0]];
private _leftGlobal = _leftListDataArray param [3,false,[false]];
private _leftTitle = _leftListDataArray param [4,"",[""]];
private _leftButtonText = _leftListDataArray param [5,"",[""]];
private _leftWhiteBlackList = _leftListDataArray param [6,[],[[]]];
private _leftCheckCanGive = _leftListDataArray param [7,false,[false]];
private _leftCheckDrop = _leftListDataArray param [8,false,[false]];

private _rightNameSpace = _rightListDataArray select 0;
private _rightVar = _rightListDataArray select 1;
private _rightMaxWeight = _rightListDataArray param [2,-1,[0]];
private _rightGlobal = _rightListDataArray param [3,false,[false]];
private _rightTitle = _rightListDataArray param [4,"",[""]];
private _rightButtonText = _rightListDataArray param [5,"",[""]];
private _rightWhiteBlackList = _rightListDataArray param [6,[],[[]]];
private _rightCheckCanGive = _rightListDataArray param [7,false,[false]];
private _rightCheckDrop = _rightListDataArray param [8,false,[false]];

disableSerialization;
if !(createDialog "ZKB_DualInvListMenu") exitWith {};
private _display = uiNamespace getVariable "ZKB_DualInvListMenu";
private _leftListCtrl = _display displayCtrl 5010;
private _leftFrameCtrl = _display displayCtrl 5002;
private _leftAmountCtrl = _display displayCtrl 5030;
private _rightListCtrl = _display displayCtrl 5020;
private _rightFrameCtrl =_display displayCtrl 5004;
private _rightAmountCtrl = _display displayCtrl 5040;

_leftListCtrl setVariable ["listData",_leftListDataArray];
_rightListCtrl setVariable ["listData",_rightListDataArray];

_leftFrameCtrl ctrlSetText (if (isLocalized _leftTitle) then {localize _leftTitle} else {_leftTitle});
_rightFrameCtrl ctrlSetText (if (isLocalized _rightTitle) then {localize _rightTitle} else {_rightTitle});

[_leftListCtrl,_rightListCtrl] call ZKB_fnc_DualInvUpdateLists;

private _leftAmountText = ctrlText _leftAmountCtrl;
private _rightAmountText = ctrlText _rightAmountCtrl;

while {ctrlVisible 5030} do
	{
	
	if !(_leftAmountText == (ctrlText _leftAmountCtrl)) then {_leftAmountText = ctrlText _leftAmountCtrl; [_leftListCtrl,0,_leftListCtrl lbData (lbCurSel _leftListCtrl),parseNumber _leftAmountText] call ZKB_fnc_DualInvUpdateBtn;};
	if !(_rightAmountText == (ctrlText _rightAmountCtrl)) then {_rightAmountText = ctrlText _rightAmountCtrl; [_rightListCtrl,1,_rightListCtrl lbData (lbCurSel _rightListCtrl),parseNumber _rightAmountText] call ZKB_fnc_DualInvUpdateBtn;};
	sleep .1;
	};
	
[] spawn ZKB_fnc_SavePlayer;