/*
	Author: ZKB1325
	FileName: fn_IsChief.sqf
	Function: ZKB_fnc_IsChief
	Description: return true/false if person called by is police chief
*/

((missionNamespace getVariable ["currentChief",""]) isEqualTo (getPlayerUID player));