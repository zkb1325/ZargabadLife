#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_TransferBank.sqf
	Function: ZKB_fnc_TransferBank
	Description: Handles bank funds transfer from 1 player to another
*/
private _transferAmount = param [0,0,[0]];
private _transferOwnerName = param [1,"",[""]];

if ((ZKB_BankAccount + _transferAmount) > SETTING(getNumber,"ZKB_MaxBankAccount")) then 
	{
	private _transferReturnedTax = ((_transferAmount - (SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount)) * ((ZKB_TaxArray select 4)/100));
	["STR_Bank_TransferredMaxBank", [[SETTING(getNumber,"ZKB_MaxBankAccount")] call ZKB_fnc_FormatNumber,[_transferAmount - (SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount)] call ZKB_fnc_FormatNumber,_transferOwnerName]] call ZKB_fnc_DynamicText;
	_transferAmount = SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount;
	[((_transferAmount - (SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount)) + _transferReturnedTax),name player] remoteExecCall ["ZKB_fnc_ReTransferBank",remoteExecutedOwner,false];
	};

ZKB_BankAccount = ZKB_BankAccount + _transferAmount;
player setVariable ["BankAccount",ZKB_BankAccount,true];
["STR_Bank_TransferredRecieve", [_transferOwnerName, [_transferAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
[] spawn ZKB_fnc_SavePlayer;