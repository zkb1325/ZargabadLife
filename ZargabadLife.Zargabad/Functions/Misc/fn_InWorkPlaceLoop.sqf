/*
	Author: ZKB1325
	File: fn_InWorkPlaceLoop.sqf
	Function: ZKB_fnc_InWorkPlaceLoop
	Description: Adds time to a counter while the player is within a workplace area
*/
private _trigger = param [0];
while {(player inArea _trigger) and (isNull objectParent player)} do
	{
	sleep 1;
	ZKB_TimeInWorkPlace = ZKB_TimeInWorkPlace + 1;
	};