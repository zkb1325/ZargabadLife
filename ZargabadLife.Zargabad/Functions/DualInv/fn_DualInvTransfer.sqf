/*
	File: fn_DualInvTransfer.sqf
	Function: ZKB_fnc_DualInvTransfer
	Author: ZKB1325
	Description: Handles moving items from one inventory to another
	
	0: Ctrl
		Transfer from list ctrl
	1: Ctrl
		Transfer to list ctrl
	2: String or Array
		Data to be transfered ["Item",total_amount], "[""Item"",total_amount]"
	3: Number
		Amount to transfer. Default: total_amount
*/
private _transferFromCtrl = _this select 0;
private _transferToCtrl = _this select 1;
private _transferData = param [2,[],["",[]]];
if (typeName _transferData isEqualTo typeName "") then {_transferData = parseSimpleArray _transferData;};
if (_transferData isEqualTo []) exitWith {};
private _transferItem = _transferData select 0;
private _transferItemAmount = _transferData select 1;
private _transferAmount = param [3,_transferItemAmount,[0]];
_transferAmount = floor (abs _transferAmount);
if (_transferAmount < 1) exitWith {};

private _transferFromDataArray = _transferFromCtrl getVariable "listData";
private _transferToDataArray = _transferToCtrl getVariable "listData";

private _transferFromData = (_transferFromDataArray select 0) getVariable [(_transferFromDataArray select 1),[]];
private _transferToData = (_transferToDataArray select 0) getVariable [(_transferToDataArray select 1),[]];

{
if ((_x select 0) == _transferItem) exitWith
	{
	if ((_transferItemAmount - _transferAmount) < 0) then 
		{
		_transferAmount = _transferItemAmount;
		};
	
	private _maxWeight = (_transferToDataArray select 2);
	if !(_maxWeight isEqualTo -1) then
		{
		private _curInvWeight = 0;
		private _transferedTotalWeight = (([_transferItem] call ZKB_fnc_GetItemWeight)*_transferAmount);
		{
		_curInvWeight = _curInvWeight + (([(_x select 0)] call ZKB_fnc_GetItemWeight)*(_x select 1));
		}forEach _transferToData;
		
		if (_curInvWeight + _transferedTotalWeight > _maxWeight) then
			{
			private _weightLeft = _maxWeight - _curInvWeight;
			_transferAmount = floor (_weightLeft / ([(_x select 0)] call ZKB_fnc_GetItemWeight));
			};
		};
	
	if (_transferAmount isEqualTo 0) exitWith {};
	
	if ((_transferItemAmount - _transferAmount) <= 0) then
		{
		_transferFromData deleteAt _forEachIndex;
		(_transferFromDataArray select 0) setVariable [(_transferFromDataArray select 1),_transferFromData,(_transferFromDataArray select 3)];
		}
		else
		{
		private _storageArray = _x;
		_storageArray set [1, (_storageArray select 1) - _transferAmount];
		_transferFromData set [_forEachIndex, _storageArray];
		(_transferFromDataArray select 0) setVariable [(_transferFromDataArray select 1),_transferFromData,(_transferFromDataArray select 3)];
		};
	};
	
}forEach _transferFromData;


	
if (_transferAmount <= 0) exitWith {["STR_Inv_InventoryFull"] call ZKB_fnc_DynamicText;};		

if (({(_x select 0) isEqualTo _transferItem}count _transferToData) <= 0) then
		{
		_transferToData pushBack [_transferItem,_transferAmount];
		(_transferToDataArray select 0) setVariable [(_transferToDataArray select 1),_transferToData,(_transferToDataArray select 3)];
		}
		else
		{
		{
		if ((_x select 0) == _transferItem) exitWith
			{
			_transferToData set [_forEachIndex, [_transferItem, (_x select 1) + _transferAmount]];
			};
		}forEach _transferToData;
		(_transferToDataArray select 0) setVariable [(_transferToDataArray select 1),_transferToData,(_transferToDataArray select 3)];
		};

[(findDisplay 5000) displayCtrl 5010,(findDisplay 5000) displayCtrl 5020] call ZKB_fnc_DualInvUpdateLists;
private _transferFromName = if (isLocalized (_transferFromDataArray select 4)) then {localize (_transferFromDataArray select 4)} else {(_transferFromDataArray select 4)};
private _transferToName = if (isLocalized (_transferToDataArray select 4)) then {localize (_transferToDataArray select 4)} else {(_transferToDataArray select 4)};
["STR_Inv_TransferedItem",[[_transferAmount] call ZKB_fnc_FormatNumber,[_transferItem] call ZKB_fnc_GetItemName,_transferFromName,_transferToName]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsTransferedItem",name player,[_transferAmount] call ZKB_fnc_FormatNumber,[_transferItem] call ZKB_fnc_GetItemName,_transferFromName,_transferToName] call ZKB_fnc_AdminAddPlayerLog;
