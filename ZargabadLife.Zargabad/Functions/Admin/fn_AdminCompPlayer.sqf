/*
	Author: ZKB1325
	FileName: fn_AdminCompPlayer.sqf
	Function: ZKB_fnc_AdminCompPlayer
	Description: Comps money to a players bank account
	
	0: String, Object, Bool
		PlayerUID, Player Object, True to comp everyone
	1: Number
		Amount to comp
	2: Bool
		True/False if amount should be added to invenotry. Default: False

*/
private _compedPlayer = param [0,"",[objNull,"",true]];
if (_compedPlayer isEqualType true) then
	{
	private _compAmount = param [1,0,[0,""]];
	private _inInventory = param [2,false,[false]];
	if (typeName _compAmount isEqualTo typeName "") then {_compAmount = parseNumber _compAmount;};
	if (_compAmount <= 0) exitWith {};

	if (_inInventory) then
		{
		[player,"Money",_compAmount] remoteExecCall ["ZKB_fnc_AdminCompItemReceive",0,false];
		["STR_Admin_CompGivenEveryoneCompInv",[[_compAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
		
		["STR_Admin_AdminLogCompAllInv",name player,[_compAmount] call ZKB_fnc_FormatNumber] call ZKB_fnc_AdminAddAdminLog;
		}
		else
		{
		[player,_compAmount] remoteExecCall ["ZKB_fnc_AdminCompBankReceive",0,false];
		["STR_Admin_CompGivenEveryoneCompBank",[[_compAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
		
		["STR_Admin_AdminLogCompAllBank",name player,[_compAmount] call ZKB_fnc_FormatNumber] call ZKB_fnc_AdminAddAdminLog;
		};
	}
	else
	{
	if (_compedPlayer isEqualTo "" or _compedPlayer isEqualTo objNull) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
	if (typeName _compedPlayer isEqualTo typeName "") then
		{
		_compedPlayer = [_compedPlayer] call ZKB_fnc_GetPlayerFromID;
		};
	if (isnull _compedPlayer) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
	private _compAmount = param [1,0,[0,""]];
	private _inInventory = param [2,false,[false]];
	if (typeName _compAmount isEqualTo typeName "") then {_compAmount = parseNumber _compAmount;};
	if (_compAmount <= 0) exitWith {};

	if (_inInventory) then
		{
		[player,"Money",_compAmount] remoteExecCall ["ZKB_fnc_AdminCompItemReceive",_compedPlayer,false];
		["STR_Admin_CompGivenCompInv",[name _compedPlayer,[_compAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
		
		["STR_Admin_AdminLogCompInv",name player,name _compedPlayer,[_compAmount] call ZKB_fnc_FormatNumber] call ZKB_fnc_AdminAddAdminLog;
		}
		else
		{
		[player,_compAmount] remoteExecCall ["ZKB_fnc_AdminCompBankReceive",_compedPlayer,false];
		["STR_Admin_CompGivenCompBank",[name _compedPlayer,[_compAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
		
		["STR_Admin_AdminLogCompBank",name player,name _compedPlayer,[_compAmount] call ZKB_fnc_FormatNumber] call ZKB_fnc_AdminAddAdminLog;
		};
	};