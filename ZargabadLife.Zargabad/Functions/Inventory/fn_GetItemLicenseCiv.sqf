/*
	Author: ZKB1325
	FileName: fn_GetItemLicenseCiv.sqf
	Function: ZKB_fnc_GetItemLicenseCiv
	Description: Returns the License a civ needs
*/
private ["_classname"];
_classname = param [0,"",[""]];
//(([_classname] call ZKB_fnc_GetItemInfo) select 5) select 0;
getText (missionConfigFile >> "Item_Config" >> _classname >> "civLicense");