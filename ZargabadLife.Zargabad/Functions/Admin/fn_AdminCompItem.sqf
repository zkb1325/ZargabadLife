#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_AdminCompItem.sqf
	Function: ZKB_fnc_AdminCompItem
	Description: Comps money to a players bank account
	
	0: String, Object, Bool
		PlayerUID, Player Object, True to comp everyone
	1: String
		Item to give
	2: Number
		Amount to give/spawn

*/
private _compedPlayer = param [0,"",[objNull,"",true]];

if ((_compedPlayer isEqualTo "") and (MYADMINLEVEL >= 5)) exitWith 
	{
	private _item = param [1,"",[""]];
	if (_item isEqualTo "") exitWith {};
	private _amount = param [2,0,[0,""]];
	if (typeName _amount isEqualTo typeName "") then {_amount = parseNumber _amount;};
	if (_amount <= 0) exitWith {};

	[player,_item,_amount] call ZKB_fnc_AdminCompItemReceive;
	["STR_Admin_CompGaveItem",[name player,[_amount] call ZKB_fnc_FormatNumber,[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
	};

if (_compedPlayer isEqualType true) then
	{
	private _item = param [1,"",[""]];
	if (_item isEqualTo "") exitWith {};
	private _amount = param [2,0,[0,""]];
	if (typeName _amount isEqualTo typeName "") then {_amount = parseNumber _amount;};
	if (_amount <= 0) exitWith {};

	[player,_item,_amount] remoteExecCall ["ZKB_fnc_AdminCompItemReceive",0,false];
	["STR_Admin_CompGaveEveryoneItem",[[_amount] call ZKB_fnc_FormatNumber,[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
	
	["STR_Admin_AdminLogGaveItemAll",name player,[_amount] call ZKB_fnc_FormatNumber,[_item] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddAdminLog;
	}
	else
	{
	if (_compedPlayer isEqualTo "" or _compedPlayer isEqualTo objNull) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
	if (typeName _compedPlayer isEqualTo typeName "") then
		{
		_compedPlayer = [_compedPlayer] call ZKB_fnc_GetPlayerFromID;
		};
	if (isnull _compedPlayer) exitWith {["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
	private _item = param [1,"",[""]];
	if (_item isEqualTo "") exitWith {};
	private _amount = param [2,0,[0,""]];
	if (typeName _amount isEqualTo typeName "") then {_amount = parseNumber _amount;};
	if (_amount <= 0) exitWith {};

	[player,_item,_amount] remoteExecCall ["ZKB_fnc_AdminCompItemReceive",_compedPlayer,false];
	["STR_Admin_CompGaveItem",[name _compedPlayer,[_amount] call ZKB_fnc_FormatNumber,[_item] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
	
	["STR_Admin_AdminLogGaveItem",name player,name _compedPlayer,[_amount] call ZKB_fnc_FormatNumber,[_item] call ZKB_fnc_GetItemName] call ZKB_fnc_AdminAddAdminLog;
	};