/*
	Author: ZKB1325
	FileName: fn_GetItemLicenseBoth.sqf
	Function: ZKB_fnc_GetItemLicenseBoth
	Description: Returns the License both cop and civ need
*/
private ["_classname"];
_classname = param [0,"",[""]];
//(([_classname] call ZKB_fnc_GetItemInfo) select 5) select 2;
getText (missionConfigFile >> "Item_Config" >> _classname >> "sharedLicense");