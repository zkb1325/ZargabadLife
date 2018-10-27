/*
    File: fn_RecieveTicket.sqf
	Function: ZKB_fnc_RecieveTicket
    Author: ZKB1325

    Description:
	Gives a player a ticket
*/
private _ticketAmount = param [0,0,[0]];
private _ticketedBy = param [1,"",[""]];


if ([format [localize "STR_Cop_TicketQuestion",_ticketedBy,[_ticketAmount] call ZKB_fnc_FormatNumber], localize "STR_Cop_PayTicket", localize "STR_Common_Yes", localize "STR_Common_No"] call BIS_fnc_guiMessage) then 
	{
	if ((["Money"] call ZKB_fnc_GetInvItemAmount) >= _ticketAmount) exitWith
		{
		["Money",_ticketAmount] call ZKB_fnc_InvRemoveItem;
		[_ticketAmount,playersNumber west] remoteExecCall ["ZKB_fnc_TicketCollect",west,false];	
		["STR_Cop_PayedTicket",[name player, [_ticketAmount] call ZKB_fnc_FormatNumber]] remoteExecCall ["ZKB_fnc_DynamicText",[west,player],false];
		};
		
	if (ZKB_BankAccount >= _ticketAmount) exitWith
		{
		ZKB_BankAccount = ZKB_BankAccount - _ticketAmount;
		[_ticketAmount,playersNumber west] remoteExecCall ["ZKB_fnc_TicketCollect",west,false];	
		["STR_Cop_PayedTicket",[name player, [_ticketAmount] call ZKB_fnc_FormatNumber]] remoteExecCall ["ZKB_fnc_DynamicText",[west,player],false];
		};
		
	["STR_Cop_DidntPayTicketNoMoney",[name player, [_ticketAmount] call ZKB_fnc_FormatNumber]] remoteExecCall ["ZKB_fnc_DynamicText",[west,player],false];
	}
	else
	{
	["STR_Cop_DidntPayTicket",[name player]]remoteExecCall ["ZKB_fnc_DynamicText",[west,player],false]; 
	};
