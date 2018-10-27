/*
	Author: ZKB1325
	FileName: fn_GetInvItemAmount.sqf
	Function: ZKB_fnc_GetInvItemAmount
	Description: Returns the total amount of a given item in the inventory
*/
private ["_classname","_playerunit","_return","_inv"];
_classname = param [0,"",[""]];
_playerunit = param [1, player, [objNull]];
_return = 0;

_inv = _playerunit getVariable ["ZKB_Inventory",[]];

{
if ((_x select 0) == _classname) exitWith
	{
	_return = (_x select 1);
	};
}forEach _inv;

_return;