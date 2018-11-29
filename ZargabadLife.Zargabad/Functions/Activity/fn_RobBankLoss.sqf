/*
    File: fn_RobBankLoss.sqf
	Function: ZKB_fnc_RobBankLoss
    Author: ZKB1325

    Description: Runs when bank gets robbed so players lose money and complain

*/
private _robbedAmount = param [0,0];
private _percentlost = (_robbedAmount/1000000) min .1;
private _lostAmount = round ((ZKB_BankAccount*_percentlost) min _robbedAmount); //set the max to what was robbed because its stupid that you could lose more then what was robbed

["STR_Bank_RobbedBankStole",[[_robbedAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;

if ((["BankInsurance"] call ZKB_fnc_GetInvItemAmount) > 0) exitWith
	{
	["BankInsurance",1] call ZKB_fnc_InvRemoveItem;
	["STR_Bank_BankRobbedInsurance"] call ZKB_fnc_DynamicText;
	};
	
if (ZKB_BankAccount <= _lostAmount) exitWith
	{
	ZKB_BankAccount = 0;
	player setVariable ["BankAccount",ZKB_BankAccount,true];
	["STR_Bank_BankRobbedLostAll"] call ZKB_fnc_DynamicText;
	[] spawn ZKB_fnc_SavePlayer;
	};	

ZKB_BankAccount = ZKB_BankAccount - _lostAmount;
player setVariable ["BankAccount",ZKB_BankAccount,true];
["STR_Bank_BankRobbedLostSome",[[_lostAmount] call ZKB_fnc_FormatNumber,[ZKB_BankAccount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
[] spawn ZKB_fnc_SavePlayer;
