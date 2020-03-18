#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	File: fn_GangCreated.sqf
	Function: ZKB_fnc_GangCreated
	Description: Handles creating a new gang
*/

private ["_display","_gangnametext","_gangname"];
disableserialization;
_display = uiNamespace getVariable "ZKB_GangCreate";
_gangnametext = _display displayCtrl 19020;
_gangname = ctrlText _gangnametext;

if ((["Money"] call ZKB_fnc_GetInvItemAmount) < (SETTING(getNumber,"ZKB_GangCreateCost"))) exitWith {["STR_Shop_NotEnoughMoney"] call ZKB_fnc_DynamicText;};
if ([player] call ZKB_fnc_IsGangMember) exitWith {["STR_Gang_AlreadyInGang"] call ZKB_fnc_DynamicText;};
if ([_gangname] call ZKB_fnc_GangCheckName) exitWith {["STR_Gang_GangNameTaken"] call ZKB_fnc_DynamicText;};
["Money",SETTING(getNumber,"ZKB_GangCreateCost")] call ZKB_fnc_InvRemoveItem;

closeDialog 0;
["STR_Gang_CreatedNewGang", [_gangname]] call ZKB_fnc_DynamicText;
private _gangIndexArray = (missionNameSpace getVariable ["ZKB_GangIndexArray",[]]);
missionNameSpace setVariable [format ["GangArray_%1", (count _gangIndexArray)], [_gangname, [[(getPlayerUID player), (name player)]], true], true];
_gangIndexArray pushBack (count _gangIndexArray);
missionNameSpace setVariable ["ZKB_GangIndexArray",_gangIndexArray,true];
if (SETTING(getNumber,"ZKB_StatSaveEnabled") isEqualTo 1) then
	{
	[] remoteExecCall ["ZKB_fnc_ServerUpdateGangSave",2,false];
	};

["STR_Admin_PlayerLogsCreatedGang",name player,_gangname] call ZKB_fnc_AdminAddPlayerLog;