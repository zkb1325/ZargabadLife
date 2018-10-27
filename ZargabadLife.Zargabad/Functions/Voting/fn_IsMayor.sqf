/*
	Author: ZKB1325
	FileName: fn_IsMayor.sqf
	Function: ZKB_fnc_IsMayor
	Description: return true/false if person called by is mayor
*/

((missionNamespace getVariable ["currentMayor",""]) isEqualTo (getPlayerUID player));