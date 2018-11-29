/*
	File: fn_DualInvRemoveItem.sqf
	Function: ZKB_fnc_DualInvRemoveItem
	Author: ZKB1325
	Description: Removes an item from a storage variable
	
	0: NameSpace
		NameSpace for inventory variable
	1: String
		Inventory Variable
	2: String
		Virtual item to remove
	3: Number
		How many items to remove
	4: Bool
		True/False if the variable is global. Default: False
			
*/
private _nameSpace = param [0];
private _var = param [1];
private _item = param [2];
private _amount = param [3,0];
if (_amount <= 0) exitWith {};
private _global = param [4,false];

private _dataArray = _nameSpace getVariable [_var,[]];

{
if ((_x select 0) == _item) exitWith
	{
	if (((_x select 1) - _amount) <= 0) then
		{
		_dataArray deleteAt _forEachIndex;
		_nameSpace setVariable [_var,_dataArray,_global];
		}
		else
		{
		private _storageArray = _x;
		_storageArray set [1, (_storageArray select 1) - _amount];
		_dataArray set [_forEachIndex, _storageArray];
		_nameSpace setVariable [_var,_dataArray,_global];
		};	
	};
}forEach _dataArray;