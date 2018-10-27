/*
	Author: ZKB1325
	FileName: fn_WithdrawBank.sqf
	Function: ZKB_fnc_WithdrawBank
	Description: Handles bank deposit and transfer
*/
private _withdrawAmount = floor (abs (parseNumber (param [0,0,[""]])));

if (_withdrawAmount < 1) exitWith {};

if (ZKB_BankAccount < _withdrawAmount) exitWith {["STR_Bank_WithdrawNotEnough", [[_withdrawAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;};

ZKB_BankAccount = ZKB_BankAccount - _withdrawAmount;
["Money",_withdrawAmount] call ZKB_fnc_InvAddItem;
["STR_Bank_Withdrew", [[_withdrawAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;