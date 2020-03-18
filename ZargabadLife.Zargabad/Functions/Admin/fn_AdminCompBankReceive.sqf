#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_AdminCompBankReceive.sqf
	Function: ZKB_fnc_AdminCompBankReceive
	Description: Comps money to a players bank account

*/
private _compedBy = param [0,objNull,[objNull]];
private _compAmount = param [1,0,[0]];

ZKB_BankAccount = (ZKB_BankAccount + _compAmount) min SETTING(getNumber,"ZKB_MaxBankAccount");
player setVariable ["BankAccount",ZKB_BankAccount,true];
["STR_Admin_CompReceiveBank",[name _compedBy,[_compAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;