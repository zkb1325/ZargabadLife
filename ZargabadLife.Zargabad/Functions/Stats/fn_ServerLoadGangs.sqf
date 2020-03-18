/*
	Author: ZKB1325
	FileName: fn_ServerLoadGangs.sqf
	Function: ZKB_fnc_ServerLoadGangs
	
	Description: Loads all impound lot variables
*/

if !("exists" call ZKB_GangsDB) exitWith {};

missionNameSpace setVariable ["ZKB_GangIndexArray",["read",["GangIndex","Indexes",[]]] call ZKB_GangsDB,true];
{
missionNameSpace setVariable [format ["GangArray_%1",_x],["read",[format ["GangArray_%1",_x],"gangArray",[]]] call ZKB_GangsDB,true];
}forEach (missionNameSpace getVariable ["ZKB_GangIndexArray",[]]);