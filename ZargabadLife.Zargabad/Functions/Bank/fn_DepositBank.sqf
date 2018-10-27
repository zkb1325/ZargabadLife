#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_DepositBank.sqf
	Function: ZKB_fnc_DepositBank
	Description: Handles bank deposit and transfer
*/
private _transferAmount = floor (abs (parseNumber (param [0,0,[""]])));
private _selectedPlayerUID = param [1,getPlayerUID player,[""]];
private _cash = ["Money"] call ZKB_fnc_GetInvItemAmount;

if (_transferAmount < 1) exitWith {};

if (_selectedPlayerUID isEqualTo getPlayerUID player) exitWith
	{
	if (_cash < _transferAmount) exitWith {["STR_Bank_DepositNotEnough", [[_transferAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;};
	if ((ZKB_BankAccount + _transferAmount) > SETTING(getNumber,"ZKB_MaxBankAccount")) then 
		{
		["STR_Bank_DepositMaxBank", [[SETTING(getNumber,"ZKB_MaxBankAccount")] call ZKB_fnc_FormatNumber,[_transferAmount - (SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount)] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
		_transferAmount = SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount;
		};

	["Money",_transferAmount] call ZKB_fnc_InvRemoveItem;
	ZKB_BankAccount = ZKB_BankAccount + _transferAmount;
	["STR_Bank_Deposited", [[_transferAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
	};
	
private _selectedAccountUnit = [_selectedPlayerUID] call ZKB_fnc_GetPlayerFromID;
if (isNull _selectedAccountUnit) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
private _transferTax = (_transferAmount * ((ZKB_TaxArray select 4)/100));

if (ZKB_BankAccount < (_transferAmount + _transferTax)) exitWith {["STR_Bank_TransferNotEnough", [[_transferAmount] call ZKB_fnc_FormatNumber, name _selectedAccountUnit,[_transferTax] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;};

ZKB_BankAccount = ZKB_BankAccount - (_transferAmount + _transferTax);
[_transferAmount,name player] remoteExecCall ["ZKB_fnc_TransferBank",_selectedAccountUnit,false];
["STR_Bank_Transferred", [[_transferAmount] call ZKB_fnc_FormatNumber, name _selectedAccountUnit,[_transferTax] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
call ZKB_fnc_SavePlayer;


