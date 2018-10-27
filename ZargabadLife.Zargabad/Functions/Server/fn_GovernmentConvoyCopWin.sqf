#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_GovernmentConvoyCopWin.sqf
	Function: ZKB_fnc_GovernmentConvoyCopWin
	Description: Cop bonus for government convoy making it to base
*/
private _convoyReward = SETTING(getNumber,"ZKB_GovConvoyCopReward");
["STR_GovConvoy_CopReward",[[_convoyReward] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
ZKB_BankAccount = (ZKB_BankAccount + _convoyReward) min SETTING(getNumber,"ZKB_MaxBankAccount");