/*
	Author: ZKB1325
	FileName: fn_ReTransferBank.sqf
	Function: ZKB_fnc_ReTransferBank
	Description: Handles bank funds transfer from 1 player to another when transferee's bank is maxed
*/
private _reTransferAmount = param [0,0];
private _transferreeName = param [1,""];

["STR_Bank_TransferredBack", [[_reTransferAmount] call ZKB_fnc_FormatNumber, _transferreeName]] call ZKB_fnc_DynamicText;
ZKB_BankAccount = ZKB_BankAccount + _reTransferAmount;
player setVariable ["BankAccount",ZKB_BankAccount,true];