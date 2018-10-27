#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_HostageCopWin.sqf
	Function: ZKB_fnc_HostageCopWin
	Description: Cop bonus for hostage being safe freed/hostage taker fails
*/
private _hostageSafeReward = SETTING(getNumber,"ZKB_HostageSafeReward");
["STR_Hostage_HostageSafeCopBonus",[[_hostageSafeReward] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
ZKB_BankAccount = (ZKB_BankAccount + _hostageSafeReward) min SETTING(getNumber,"ZKB_MaxBankAccount");