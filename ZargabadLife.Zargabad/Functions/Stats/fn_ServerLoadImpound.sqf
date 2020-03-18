/*
	Author: ZKB1325
	FileName: fn_ServerLoadImpound.sqf
	Function: ZKB_fnc_ServerLoadImpound
	
	Description: Loads all impound lot variables
*/

if !("exists" call ZKB_ImpoundDB) exitWith {};
private _allImpoundsInDB = ["read", ["ImpoundLotsArraySection", "ImpoundsArray", []]] call ZKB_ImpoundDB;

{
private _impoundArr = ["read",[_x,"array",[]]] call ZKB_ImpoundDB;
missionNamespace setVariable [_x,_impoundArr,true];
}forEach _allImpoundsInDB;