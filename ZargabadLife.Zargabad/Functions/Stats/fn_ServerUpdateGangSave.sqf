/*
	Author: ZKB1325
	FileName: fn_ServerUpdateGangSave.sqf
	Function: ZKB_fnc_ServerUpdateGangSave
	
	Description: Takes passed impound var and saves it
*/
["write",["GangIndex","Indexes",(missionNameSpace getVariable ["ZKB_GangIndexArray",[]])]] call ZKB_GangsDB;
{
["write",[format ["GangArray_%1",_x],"gangArray",(missionNameSpace getVariable format ["GangArray_%1",_x])]] call ZKB_GangsDB;
}forEach (missionNameSpace getVariable ["ZKB_GangIndexArray",[]]);