/*
	File: fn_RobPlayerDropItems.sqf
	Function: ZKB_fnc_RobPlayerDropItems
	Author: ZKB1325
	Description: Passed from a robber makes the player drop all dropable items
*/
private _robber = param [0,objNull,[objNull]];
["STR_Civ_InteractionMenuRobbedBy",[name _robber]] call ZKB_fnc_DynamicText;

{
[_x,(_x select 1)] call ZKB_fnc_DropItem;
}forEach (player getVariable ["ZKB_Inventory",[]]);