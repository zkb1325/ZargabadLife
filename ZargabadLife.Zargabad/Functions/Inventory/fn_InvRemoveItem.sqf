/*
	Author: ZKB1325
	FileName: fn_InvRemoveItem.sqf
	Function: ZKB_fnc_InvRemoveItem
	Description: Handles removing virtual items from the players virtual inventory, returns true/false depending if item could be removed
	
	0: String
		Item to remove from inventory
		
	1: Number
		Amount to remove
*/
private _item = _this select 0;
private _amount = _this select 1;
private _return = false;
private _inv = player getVariable ["ZKB_Inventory",[]];

{
if ((_x select 0) == _item) exitWith
	{
	if (((_x select 1) - _amount) <= 0) then
		{
		_inv set [_forEachIndex, "Remove"];
		_inv = _inv - ["Remove"];
		player setVariable ["ZKB_Inventory", _inv, true];
		}
		else
		{
		private _itemarr = _x;
		_itemarr set [1, (_itemarr select 1) - _amount];
		_inv set [_forEachIndex, _itemarr];
		player setVariable ["ZKB_Inventory", _inv, true];
		};
	_return = true;
	};
}forEach _inv;
call ZKB_fnc_SavePlayer;
_return;