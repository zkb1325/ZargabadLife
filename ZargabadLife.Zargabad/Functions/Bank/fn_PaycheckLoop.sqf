#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_PaycheckLoop.sqf
	Function: ZKB_fnc_PaycheckLoop
	Description: Opens Bank/ATM screen
*/

private _payCheck = 0;

while {true} do 
	{

	_payCheck = 0;
	
	sleep 60;
	["STR_Bank_PayCheckIn", [3]] call ZKB_fnc_DynamicText;
	sleep 60;
	["STR_Bank_PayCheckIn", [2]] call ZKB_fnc_DynamicText;
	sleep 60;
	["STR_Bank_PayCheckIn", [1]] call ZKB_fnc_DynamicText;
	sleep 60;

	switch (true) do 
		{
		case IsCop: {
			_payCheck = _payCheck + SETTING(getNumber,"ZKB_CopPayCheck");
			
			if ("Patrol_Officer_Training" call ZKB_fnc_HasLicenses) then
				{
				_payCheck = _payCheck + (1500 + random 1000 - random 500);
				};
				
			if ("Armed_Response_Officer_Training" call ZKB_fnc_HasLicenses) then
				{
				_payCheck = _payCheck + (3000 + random 1500 - random 500);
				};	
				
			if ("SOBR_Training" call ZKB_fnc_HasLicenses) then
				{
				_payCheck = _payCheck + (5000 + random 2000 - random 1000);
				};	
				
			if ("Air_Support_Officer_Training" call ZKB_fnc_HasLicenses) then
				{
				_payCheck = _payCheck + (2000 + random 750 - random 250);
				};
				
			if (call ZKB_fnc_IsChief) then
				{
				_payCheck = _payCheck + SETTING(getNumber,"ZKB_ChiefPayCheck");
				};
				
			if ((ZKB_BankAccount + _payCheck) > SETTING(getNumber,"ZKB_MaxBankAccount")) then 
				{
				["STR_Bank_PayCheckMaxBank", [[SETTING(getNumber,"ZKB_MaxBankAccount")] call ZKB_fnc_FormatNumber,[_payCheck - (SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount)] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
				_payCheck = SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount;
				};
			
			ZKB_BankAccount = ZKB_BankAccount + (round _payCheck);
			player setVariable ["BankAccount",ZKB_BankAccount,true];
			
			["STR_Bank_CopPaycheck", [name player, [_payCheck] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
			
			if (call ZKB_fnc_IsChief) then
				{
				["STR_Bank_CheifPaycheck", [[SETTING(getNumber,"ZKB_ChiefPayCheck")] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
				};
			};
			
		case IsCiv: {
			if (player getVariable ["respawning",false]) exitWith {["STR_Bank_PaycheckDead"] call ZKB_fnc_DynamicText;};
			_payCheck = _payCheck + SETTING(getNumber,"ZKB_CivPayCheck");
			
			//Paycheck bonus for owning workplace
			{
			if ((_x select 0) in (missionNamespace getVariable ["ownedWorkplaces",[]])) then
				{
				_payCheck = _payCheck + (_x select 2);
				};
			}forEach SETTING(getArray,"ZKB_WorkPlaces");
				
			//paycheck for sitting in workplace
			_payCheck = _payCheck + (ZKB_TimeInWorkPlace * SETTING(getNumber,"ZKB_InWorkPlaceBonus"));
			ZKB_TimeInWorkPlace = 0;
			
			//Gang paycheck
			if ([player] call ZKB_fnc_IsGangMember) then
				{
				private _activeMembers = ({!isNull ([_x select 0] call ZKB_fnc_GetPlayerFromID)}count ((([player] call ZKB_fnc_FindGang) select 0) select 1));
				_payCheck = _payCheck + ((({(GMVAR(_x,objNull) getVariable ["GangControl",""]) isEqualTo ([player] call ZKB_fnc_GetGangName)}count SETTING(getArray,"ZKB_GangAreas")) * SETTING(getNumber,"ZKB_GangAreaBonus")) / _activeMembers);
				};
			
			["STR_Bank_CivPaycheck", [name player, [_payCheck] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
			
			if (call ZKB_fnc_IsMayor) then
				{
				_payCheck = _payCheck + SETTING(getNumber,"ZKB_MayorPayCheck");
				private _taxes = 0;
				{
				_taxes = _taxes + ((_x select 0) getVariable ["curTax",0]);
				(_x select 0) setVariable ["curTax",0,true];
				}forEach ZKB_ShopDefines;
				_payCheck = _payCheck + _taxes;
				["STR_Bank_MayorPaycheck", [[SETTING(getNumber,"ZKB_MayorPayCheck")] call ZKB_fnc_FormatNumber, [_taxes] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
				};
			
			if ((ZKB_BankAccount + _payCheck) > SETTING(getNumber,"ZKB_MaxBankAccount")) then 
				{
				["STR_Bank_PayCheckMaxBank", [[SETTING(getNumber,"ZKB_MaxBankAccount")] call ZKB_fnc_FormatNumber,[_payCheck - (SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount)] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
				_payCheck = SETTING(getNumber,"ZKB_MaxBankAccount") - ZKB_BankAccount;
				};
				
			ZKB_BankAccount = ZKB_BankAccount + (round _payCheck);
			player setVariable ["BankAccount",ZKB_BankAccount,true];
			};
		};
	[] spawn ZKB_fnc_SavePlayer;
	};