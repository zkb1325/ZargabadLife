/*
    File: fn_PayBail.sqf
	Function: ZKB_fnc_PayBail
    Author: ZKB1325

    Description:
	Player paying bail
	
	this addAction ["Pay Bail",ZKB_fnc_PayBail,"",1,true,true,"","(player getVariable [""InJail"",false]) and (playerSide isEqualTo civilian)"];
*/

private _curBail = round (player getVariable ["Bail",0]);

if (_curBail <= 0) exitWith {};
private _numOfCops = (playersNumber west);

if ((["Money"] call ZKB_fnc_GetInvItemAmount) >= _curBail) exitWith
	{
	["Money",_curBail] call ZKB_fnc_InvRemoveItem;
	if (_numOfCops > 0) then
		{
		[player,round (_curBail/_numOfCops)] remoteExec ["ZKB_fnc_PayBailCopReward",west,false];	
		};
	["STR_Jail_PaidBail",[name player,[_curBail] call ZKB_fnc_FormatNumber]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	["STR_Jail_PaidBail",name player,[_curBail] call ZKB_fnc_FormatNumber] call ZKB_fnc_AdminAddPlayerLog;
	player setVariable ["InJail",false,true];
	};
	
if (ZKB_BankAccount >= _curBail) exitWith
	{
	ZKB_BankAccount = ZKB_BankAccount - _curBail;
	player setVariable ["BankAccount",ZKB_BankAccount,true];
	if (_numOfCops > 0) then
		{
		[player,round (_curBail/_numOfCops)] remoteExec ["ZKB_fnc_PayBailCopReward",west,false];	
		};
	["STR_Jail_PaidBail",[name player,[_curBail] call ZKB_fnc_FormatNumber]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	["STR_Jail_PaidBail",name player,[_curBail] call ZKB_fnc_FormatNumber] call ZKB_fnc_AdminAddPlayerLog;
	player setVariable ["InJail",false,true];
	};
	
["STR_Jail_NoMoney"] call ZKB_fnc_DynamicText;