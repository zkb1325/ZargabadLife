#include "..\..\ConfigMacros.hpp"
/*
    File: fn_PayBailCopReward.sqf
	Function: ZKB_fnc_PayBailCopReward
    Author: ZKB1325

    Description:
	Cop side of civ paying bail
*/
private _bailPlayer = param [0,objNull,[objNull]];
private _bailReward = param [1,0,[0]];

ZKB_BankAccount = (ZKB_BankAccount + _bailReward) min SETTING(getNumber,"ZKB_MaxBankAccount");
["STR_Jail_BailCopReward",[[_bailReward] call ZKB_fnc_FormatNumber,name _bailPlayer]] call ZKB_fnc_DynamicText;