#include "..\..\ConfigMacros.hpp"
/*
    File: fn_TicketCollect.sqf
	Function: ZKB_fnc_TicketCollect
    Author: ZKB1325

    Description:
	Collects the paid ticket and shares it between cops
*/
private _ticketAmount = param [0,0,[0]];
private _ticketSpreadMultiplier = (param [1,1,[1]]) max 1;

private _ticketCollected = floor (_ticketAmount/_ticketSpreadMultiplier);

ZKB_BankAccount = (ZKB_BankAccount + _ticketCollected) min SETTING(getNumber,"ZKB_MaxBankAccount");
player setVariable ["BankAccount",ZKB_BankAccount,true];