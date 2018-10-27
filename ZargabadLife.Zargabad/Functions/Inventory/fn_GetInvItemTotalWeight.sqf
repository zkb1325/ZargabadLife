/*
	Author: ZKB1325
	FileName: fn_GetInvItemTotalWeight.sqf
	Function: ZKB_fnc_GetInvItemTotalWeight
	Description: Returns the total weight of a given item in the inventory
*/
private ["_classname", "_playerunit"];
_classname = param [0,"",[""]];
_playerunit = param [1, player, [objNull]];
(([_classname] call ZKB_fnc_GetItemWeight) * ([_classname, _playerunit] call ZKB_fnc_GetInvItemAmount));