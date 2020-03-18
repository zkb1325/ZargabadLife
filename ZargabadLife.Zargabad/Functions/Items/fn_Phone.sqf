/*
	Author: ZKB1325
	File: fn_Phone.sqf
	Function: ZKB_fnc_Phone
	Description: Handles the phone dialog and sending of the messages
*/
private ["_action","_display","_sendbtn","_message","_playerlist","_selectedplayeruid","_index","_selectedplayer"];
_action = _this select 0;

if (_action == "Use") exitWith
	{
	disableSerialization;
	closeDialog 0;
	createDialog "ZKB_Phone";
	_display = uiNameSpace getVariable "ZKB_Phone";
	_playerlist = (_display displayCTRL 8020);

	{
	_index = _playerlist lbAdd	format ["%1", name _x];
	_playerlist lbSetData [_index, getPlayerUID _x];
	}forEach playableUnits;
	
	lbSort [_playerlist, "ASC"];
	_playerlist lbSetCurSel 0;
	
	};
	
if (_action == "SendMessage") exitWith
	{
	disableSerialization;
	_display = uiNameSpace getVariable "ZKB_Phone";
	_messagebox = (_display displayCTRL 8010);
	_playerlist = (_display displayCTRL 8020);
	_selectedplayeruid = _playerlist lbData (lbCurSel _playerlist);
	_message = ctrlText _messagebox;
	
	if (_message == "") exitWith {};
	if (_selectedplayeruid == (getPlayerUID player)) exitWith {["STR_ItemMisc_PhoneSendSelf"] call ZKB_fnc_DynamicText;};
	_selectedplayer = [_selectedplayeruid] call ZKB_fnc_GetPlayerFromID;
	if (isNull _selectedplayer) exitWith {["STR_Inv_GiveObjError"] call ZKB_fnc_DynamicText;};
	closeDialog 0;
	
	["STR_ItemMisc_PhoneSent", [name _selectedplayer, _message]] call ZKB_fnc_DynamicText;
	["STR_ItemMisc_PhoneRecieved", [name player, _message],30] remoteExecCall ["ZKB_fnc_DynamicText", _selectedplayer, false];
	["STR_Admin_PlayerLogsSentPhoneMessage",name player,name _selectedplayer,_message] call ZKB_fnc_AdminAddPlayerLog;
	};