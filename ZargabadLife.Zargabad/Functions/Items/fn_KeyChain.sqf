/*
	Author: ZKB1325
	File: fn_KeyChain.sqf
	Function: ZKB_fnc_KeyChain
	Description: Handles the actions related to the key chain item
*/
private ["_display","_keylist","_playerlist","_keys","_index","_keyid","_playerkeys","_vcl","_givenuid","_givenplayer","_givenkey","_givenplayerkeys"];
_action = _this select 0;

if (_action == "Use") exitWith
	{
	disableSerialization;
	closeDialog 0;
	createDialog "ZKB_KeyChain";

	_display = uiNameSpace getVariable "ZKB_KeyChain";
	_keylist = (_display displayCTRL 3010);
	_playerlist = (_display displayCTRL 3050);
	
	_keys = player getVariable ["ZKB_Keys", []];
	player setVariable ["ZKB_Keys", (_keys - [objNull]), true];
	
	{
	_index = _keylist lbAdd format [localize "STR_ItemMisc_KeyList", [(typeOf _x)] call ZKB_fnc_GetItemName, _x getVariable ["plate",_x]];	
	_keylist lbSetData [_index, str _index];
	}forEach (player getVariable ["ZKB_Keys",[]]);
	
	{
	_index = _playerlist lbAdd format ["%1",name _x];	
	_playerlist lbSetData [_index, getplayerUID _x];	
	}forEach playableUnits;

	lbSort [_playerlist, "ASC"];
	_playerlist lbSetCurSel 0;	
	};
	
if (_action == "UseKey") exitWith
	{
	if ((_this select 1) == "") exitWith {};
	closeDialog 0;
	
	_keyid = parseNumber (_this select 1);
	_playerkeys = (player getVariable ["ZKB_Keys",[]]);
	
	_vcl = _playerkeys select _keyid;
	
	if (_vcl distance player > 20) exitWith {["STR_Common_VehToFar"] call ZKB_fnc_DynamicText;};
	
	if((locked _vcl) isEqualTo 2) then 
			{
			if(local _vcl) then 
				{
				_vcl lock 0;
				} 
				else 
				{
				[_vcl,0] remoteExecCall ["lock",_vcl];
				};
			["STR_Common_VehUnLocked"] call ZKB_fnc_DynamicText;
			} 
			else 
			{
			if(local _vcl) then 
				{
				_vcl lock 2;
				} 
				else 
				{
				[_vcl,2] remoteExecCall ["lock",_vcl];
				};
			["STR_Common_VehLocked"] call ZKB_fnc_DynamicText;
			};
	};
	
if (_action == "GiveKey") exitWith
	{
	if ((_this select 1) == "") exitWith {};
	closeDialog 0;
	_keyid = parseNumber (_this select 1);
	closeDialog 0;
	_givenuid = _this select 2;
	_givenplayer = [_givenuid] call ZKB_fnc_GetPlayerFromID;
	
	if (isNull _givenplayer) exitWith {["STR_Inv_GiveObjError"] call ZKB_fnc_DynamicText;};
	//if (_givenplayer == player) exitWith {["STR_InvCantGiveSelf"] call ZKB_fnc_DynamicText;};
	if (player distance _givenplayer > 20) exitWith {["STR_Inv_GiveDistError"] call ZKB_fnc_DynamicText;};
	
	_playerkeys = (player getVariable ["ZKB_Keys",[]]);
	_givenkey = _playerkeys select _keyid;
	_givenplayerkeys = (_givenplayer getVariable ["ZKB_Keys",[]]);
	
	//if (_givenkey in _givenplayerkeys) exitWith {["STR_ItemMisc_AlreadyHaveKey", [name _givenplayer]] call ZKB_fnc_DynamicText;};
	
	_givenplayerkeys pushBack _givenkey;
	_givenplayer setVariable ["ZKB_Keys", _givenplayerkeys, true];
	["STR_ItemMisc_GaveKey",[name _givenplayer,(_givenkey getVariable ["plate",_givenkey])]] call ZKB_fnc_DynamicText;
	["STR_ItemMisc_RecievedKey", [name player, _givenkey getVariable ["plate",_givenkey]]] remoteExecCall ["ZKB_fnc_DynamicText", _givenplayer, false];
	["STR_Admin_PlayerLogsPlayerGaveKeys",name player,name _givenplayer,[configName ("getText (_x >> ""className"") isEqualTo (typeOf _givenkey)" configClasses (missionConfigFile >> "Item_Config") select 0)] call ZKB_fnc_GetItemName,(_givenkey getVariable ["plate",_givenkey])] call ZKB_fnc_AdminAddPlayerLog;
	};