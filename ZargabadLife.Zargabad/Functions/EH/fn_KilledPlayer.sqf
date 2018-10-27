#include "..\..\ConfigMacros.hpp"
/*
    File: fn_KilledPlayer.sqf
	Function: ZKB_fnc_KilledPlayer
    Author: ZKB1325

    Description:
    Passed to the player from another players killed eventHandler
	
	0: object
		Player killed
*/

private _killedPlayer = param [0,objNull,[objNull]];
if (isNull _killedPlayer) exitWith {};
private _ranOver = if (!((vehicle player) isEqualTo player) and (driver (vehicle player) isEqualTo player)) then {true;}else{false;};

switch (_ranOver) do
	{
	case true:
		{
		["STR_Killed_PlayerRanOver", [name player, name _killedPlayer]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		if (IsCop) then
			{
			if (side _killedPlayer isEqualTo civilian) then
				{
				private _wantedArray = _killedPlayer getVariable ["Warrants",[]];
				private _bounty = 0;
				if !(_wantedArray isEqualTo []) then 
					{
					_bounty = _wantedArray select 1;
					_bounty = round (_bounty/3);
					};
				
				if (_bounty > 0) then
					{
					["STR_Killed_KilledForBounty",[name _killedPlayer,[_bounty] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
					ZKB_BankAccount = (ZKB_BankAccount + _bounty) min SETTING(getNumber,"ZKB_MaxBankAccount");
					}
					else
					{
					["STR_Killed_KilledNoBounty",[name _killedPlayer]] call ZKB_fnc_DynamicText;
					};
					
				[_killedPlayer] call ZKB_fnc_Pardon;
				
				private _civsKilled = ZKB_CivsKilled select 0;
				private _totalCivsKilled = ZKB_CivsKilled select 1;
				ZKB_CivsKilled set [0,_civsKilled+1];
				ZKB_CivsKilled set [1,_totalCivsKilled+1];
				}
				else
				{
				private _copsKilled = ZKB_CopsKilled select 0;
				private _totalCopsKilled = ZKB_CopsKilled select 1;
				ZKB_CopsKilled set [0,_copsKilled+1];
				ZKB_CopsKilled set [1,_totalCopsKilled+1];
				
				if ((ZKB_BankAccount - SETTING(getNumber,"ZKB_CopKillCopPenalty")) < 0) exitWith
					{
					["STR_Killed_CopTeamKillJail",[name _killedPlayer]] call ZKB_fnc_DynamicText;
					//Add jail function
					};
				ZKB_BankAccount = (ZKB_BankAccount - SETTING(getNumber,"ZKB_CopKillCopPenalty")) max 0;
				["STR_Killed_CopTeamKill",[name _killedPlayer,SETTING(getNumber,"ZKB_CopKillCopPenalty")]] call ZKB_fnc_DynamicText;
				};
			}
			else
			{
			[player,"Hit and Run",30000] call ZKB_fnc_AddWanted;
			
			["STR_Killed_LostVehLicense",["Car_License" call ZKB_fnc_GetLicenseDisplayName, "Truck_License" call ZKB_fnc_GetLicenseDisplayName]] call ZKB_fnc_DynamicText;
			["Car_License"] call ZKB_fnc_RemoveLicense;
			["Truck_License"] call ZKB_fnc_RemoveLicense;
			
			if (side _killedPlayer isEqualTo civilian) then
				{
				private _civsKilled = ZKB_CivsKilled select 0;
				private _totalCivsKilled = ZKB_CivsKilled select 1;
				ZKB_CivsKilled set [0,_civsKilled+1];
				ZKB_CivsKilled set [1,_totalCivsKilled+1];
				}
				else
				{
				private _copsKilled = ZKB_CopsKilled select 0;
				private _totalCopsKilled = ZKB_CopsKilled select 1;
				ZKB_CopsKilled set [0,_copsKilled+1];
				ZKB_CopsKilled set [1,_totalCopsKilled+1];
				};
			};
		};
		
	case false:
		{
		["STR_Killed_PlayerKilledBy", [name _killedPlayer, name player]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
		if (IsCop) then
			{
			if (side _killedPlayer isEqualTo civilian) then
				{
				private _wantedArray = _killedPlayer getVariable ["Warrants",[]];
				private _bounty = 0;
				if !(_wantedArray isEqualTo []) then 
					{
					_bounty = _wantedArray select 1;
					_bounty = round (_bounty/3);
					};
				
				if (_bounty > 0) then
					{
					["STR_Killed_KilledForBounty",[name _killedPlayer,[_bounty] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
					ZKB_BankAccount = (ZKB_BankAccount + _bounty) min SETTING(getNumber,"ZKB_MaxBankAccount");
					}
					else
					{
					["STR_Killed_KilledNoBounty",[name _killedPlayer]] call ZKB_fnc_DynamicText;
					};
					
				[_killedPlayer] call ZKB_fnc_Pardon;	
				
				private _civsKilled = ZKB_CivsKilled select 0;
				private _totalCivsKilled = ZKB_CivsKilled select 1;
				ZKB_CivsKilled set [0,_civsKilled+1];
				ZKB_CivsKilled set [1,_totalCivsKilled+1];
				}
				else
				{
				private _copsKilled = ZKB_CopsKilled select 0;
				private _totalCopsKilled = ZKB_CopsKilled select 1;
				ZKB_CopsKilled set [0,_copsKilled+1];
				ZKB_CopsKilled set [1,_totalCopsKilled+1];
				
				if ((ZKB_BankAccount - SETTING(getNumber,"ZKB_CopKillCopPenalty")) < 0) exitWith
					{
					["STR_Killed_CopTeamKillJail",[name _killedPlayer]] call ZKB_fnc_DynamicText;
					//Add jail function
					};
				ZKB_BankAccount = (ZKB_BankAccount - SETTING(getNumber,"ZKB_CopKillCopPenalty")) max 0;
				["STR_Killed_CopTeamKill",[name _killedPlayer,SETTING(getNumber,"ZKB_CopKillCopPenalty")]] call ZKB_fnc_DynamicText;
				};
			}
			else
			{
			[player,"Murder",30000] call ZKB_fnc_AddWanted;
			
			["STR_Killed_LostWeaponLicense",["Pistol_License" call ZKB_fnc_GetLicenseDisplayName, "Rifle_License" call ZKB_fnc_GetLicenseDisplayName]] call ZKB_fnc_DynamicText;
			["Pistol_License"] call ZKB_fnc_RemoveLicense;
			["Rifle_License"] call ZKB_fnc_RemoveLicense;
			
			if (side _killedPlayer isEqualTo civilian) then
				{
				private _civsKilled = ZKB_CivsKilled select 0;
				private _totalCivsKilled = ZKB_CivsKilled select 1;
				ZKB_CivsKilled set [0,_civsKilled+1];
				ZKB_CivsKilled set [1,_totalCivsKilled+1];
				}
				else
				{
				private _copsKilled = ZKB_CopsKilled select 0;
				private _totalCopsKilled = ZKB_CopsKilled select 1;
				ZKB_CopsKilled set [0,_copsKilled+1];
				ZKB_CopsKilled set [1,_totalCopsKilled+1];
				};
			};
		};
	};
call ZKB_fnc_SavePlayer;
[100000] call ZKB_fnc_SetRating