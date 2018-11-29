/*
    File: fn_GiveTicket.sqf
	Function: ZKB_fnc_GiveTicket
    Author: ZKB1325

    Description:
	Gives a player a ticket
*/
_ticketedPlayer = param [0,objNull,[objNull]];
if (isNull _ticketedPlayer) exitWith {closeDialog 0; ["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
_ticketAmount = param [1,0,[0]];
if (_ticketAmount <= 0) exitWith {};

["STR_Cop_GaveTicket",[name player,name _ticketedPlayer,[_ticketAmount] call ZKB_fnc_FormatNumber]]remoteExecCall ["ZKB_fnc_DynamicText",[west,_ticketedPlayer],false]; 
[_ticketAmount,name player] remoteExec ["ZKB_fnc_RecieveTicket",_ticketedPlayer,false];
["STR_Admin_PlayerLogsGaveTicket",name player,[_ticketAmount] call ZKB_fnc_FormatNumber,name _ticketedPlayer] call ZKB_fnc_AdminAddPlayerLog;