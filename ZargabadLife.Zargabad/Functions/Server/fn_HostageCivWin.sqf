#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_HostageCivWin.sqf
	Function: ZKB_fnc_HostageCivWin
	Description: Civ winning government convoy
*/
private _hostageReward = SETTING(getNumber,"ZKB_HostageCivReward");
["STR_Hostage_CivReward",[SETTING(getNumber,"ZKB_HostageTime"),[_hostageReward] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
["Money",_hostageReward] call ZKB_fnc_InvAddItem;