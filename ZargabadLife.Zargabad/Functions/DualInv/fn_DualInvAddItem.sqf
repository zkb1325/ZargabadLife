/*
	File: fn_DualInvAddItem.sqf
	Function: ZKB_fnc_DualInvAddItem
	Author: ZKB1325
	Description: Adds an item to a storage variable
	
	0: NameSpace
		NameSpace for inventory variable
	1: String
		Inventory Variable
	2: String
		Virtual item to add
	3: Number
		How many items to add
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
private _curAmount = 0;
{
if ((_x select 0) isEqualTo _item) exitWith
	{
	_curAmount = (_x select 1);
	};
}forEach _dataArray;

if (_curAmount <= 0) then
	{
	_dataArray pushBack [_item,_amount];
	_nameSpace setVariable [_var,_dataArray,_global];
	}
	else
	{
	{
	if ((_x select 0) == _item) exitWith
		{
		_dataArray set [_forEachIndex, [_item, (_x select 1) + _amount]];
		};
	}forEach _dataArray;
	_nameSpace setVariable [_var,_dataArray,_global];
	};
	