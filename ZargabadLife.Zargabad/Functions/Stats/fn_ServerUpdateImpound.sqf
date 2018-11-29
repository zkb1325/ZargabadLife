/*
	Author: ZKB1325
	FileName: fn_ServerUpdateImpound.sqf
	Function: ZKB_fnc_ServerUpdateImpound
	
	Description: Takes passed impound var and saves it
*/
private _impoundVar = param [0,"",[""]];
if (isNil {missionNamespace getVariable _impoundVar}) exitWith {};

private _allImpoundsInDB = ["read", ["ImpoundLotsArraySection", "ImpoundsArray", []]] call ZKB_ImpoundDB;
if !(_impoundVar in _allImpoundsInDB) then
	{
	_allImpoundsInDB pushBack _impoundVar;
	["write",["ImpoundLotsArraySection","ImpoundsArray",_allImpoundsInDB]] call ZKB_ImpoundDB;
	
	["write",[_impoundVar,"array",(missionNamespace getVariable [_impoundVar,[]])]] call ZKB_ImpoundDB;
	}
	else
	{
	["write",[_impoundVar,"array",(missionNamespace getVariable [_impoundVar,[]])]] call ZKB_ImpoundDB;
	};