#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_AssassinMissionCivWin.sqf
	Function: ZKB_fnc_AssassinMissionCivWin
	Description: Government convoy loop
*/
private _reward = round ((playersNumber west) * SETTING(getNumber,"ZKB_VipKilledReward"));
["STR_Assassin_VipKilledReward",[[_reward] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
["Money",_reward] call ZKB_fnc_InvAddItem;
[player,"Assassinating a VIP",_reward] call ZKB_fnc_AddWanted;