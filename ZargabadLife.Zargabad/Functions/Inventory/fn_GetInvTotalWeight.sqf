/*
	Author: ZKB1325
	FileName: fn_GetInvTotalWeight.sqf
	Function: ZKB_fnc_GetInvTotalWeight
	Description: Returns the total inventory weight of a player
	0: Object
		Player to get the total weight of. Default: Player (must atleast pass [])
*/
private ["_playerunit","_return","_inv"];
_playerunit = param [0,player,[objNull]];
_return = 0;

_inv = _playerunit getVariable ["ZKB_Inventory",[]];

{
_return = _return + ([(_x select 0), _playerunit] call ZKB_fnc_GetInvItemTotalWeight);
}forEach _inv;

_return;