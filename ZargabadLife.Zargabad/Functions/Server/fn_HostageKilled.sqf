#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_HostageKilled.sqf
	Function: ZKB_fnc_HostageKilled
	
	Description: Runs on cops when hostage is killed
*/
["STR_Hostage_HostageKilledCop",[[SETTING(getNumber,"ZKB_HostageKilledLoss")] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
ZKB_BankAccount = (ZKB_BankAccount - SETTING(getNumber,"ZKB_HostageKilledLoss")) max 0;
player setVariable ["BankAccount",ZKB_BankAccount,true];