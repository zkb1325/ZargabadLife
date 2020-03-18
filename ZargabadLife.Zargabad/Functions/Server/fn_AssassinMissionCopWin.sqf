#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_AssassinMissionCopWin.sqf
	Function: ZKB_fnc_AssassinMissionCopWin
	Description: Cop bonus for vip making it to cop base
*/
private _convoyReward = SETTING(getNumber,"ZKB_VipReward");
["STR_Assassin_CopReward",[[_convoyReward] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
ZKB_BankAccount = (ZKB_BankAccount + _convoyReward) min SETTING(getNumber,"ZKB_MaxBankAccount");
player setVariable ["BankAccount",ZKB_BankAccount,true];