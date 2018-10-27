/*
	Author: ZKB1325
	FileName: fn_GetItemLicenseCop.sqf
	Function: ZKB_fnc_GetItemLicenseCop
	Description: Returns the License a cop needs
*/
private ["_classname"];
_classname = param [0,"",[""]];
//(([_classname] call ZKB_fnc_GetItemInfo) select 5) select 1;
getText (missionConfigFile >> "Item_Config" >> _classname >> "copLicense");