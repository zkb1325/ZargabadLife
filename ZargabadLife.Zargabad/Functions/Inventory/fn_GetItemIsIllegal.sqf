/*
	Author: ZKB1325
	FileName: fn_GetItemIsIllegal.sqf
	Function: ZKB_fnc_GetItemIsIllegal
	Description: Returns the display name of an item based on class name
*/
private _classname = param [0,"",[""]];
//(([_classname] call ZKB_fnc_GetItemInfo) select 6) select 2;
getNumber (missionConfigFile >> "Item_Config" >> _classname >> "isIllegal") isEqualTo 1;