/*
	File: fn_ClearGear.sqf
	Function: ZKB_fnc_ClearGear
	Author: ZKB1325
	Description: Completely removes all gear from the player
*/

removeUniform player;
removeVest player;
removeBackpackGlobal player;
removeHeadgear player;
removeAllWeapons player;
removeAllAssignedItems player;