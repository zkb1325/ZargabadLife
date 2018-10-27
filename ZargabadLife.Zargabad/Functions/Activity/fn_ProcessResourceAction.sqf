/*
	Author: ZKB1325
	File: fn_ProcessResourceAction
	Function: ZKB_fnc_ProcessResourceAction
	Description: Handles processing 1 thing into another passed through addaction
	
	0: Any
	1: Any
	2: Any
	3: Array
		0: String
			Processed Item
		1: String
			Final item to be processed into
		2: Number
			The amount of Processed Item = 1 Final item
		3: String
			The required license to process "" = no license required
		
	eg. [0,0,0,["UnProcessedLSD", "LSD", 5, "GA1_LSD_Drug_Processors_License"]] call ZKB_fnc_ProcessResourceAction;
	this addaction ["Process LSD",ZKB_fnc_ProcessResourceAction,["UnProcessedLSD", "LSD", 5, "GA1_LSD_Drug_Processors_License"],1,true,true,"","((_target getVariable [""GangControl"",""""]) == ([player] call ZKB_fnc_GetGangName)) and ([player] call ZKB_fnc_IsGangMember) and !ZKB_PerformingAction", 7];
	Will turn every 5 UnProcessed LSD in the players inventory into 1 LSD if they have GA1 LSD Drug Processors License
*/
private ["_rawitem","_finalitem","_amountperfinal","_reqlicense","_invamount","_amountreturn","_amounttoremove"];
_actionarray = _this select 3;
_rawitem = _actionarray select 0;
_finalitem = _actionarray select 1;
_amountperfinal = _actionarray select 2;
_reqlicense = _actionarray select 3;

_invamount = ([_rawitem] call ZKB_fnc_GetInvItemAmount);

_amountreturn = floor(_invamount/_amountperfinal);
_amounttoremove = _amountperfinal*_amountreturn; 

if (!(_reqlicense in (player getVariable ["ZKB_Licenses",[]])) and !(_reqlicense == "")) exitWith {["STR_Common_NoLicenseProcess"] call ZKB_fnc_DynamicText;};
if (_amountreturn == 0) exitWith {["STR_Common_NotEnoughToProcess"] call ZKB_fnc_DynamicText;};

[_rawitem, _amounttoremove] call ZKB_fnc_InvRemoveItem;
[_finalitem, _amountreturn] call ZKB_fnc_InvAddItem;

["STR_ItemMisc_Processed", [_amounttoremove, [_rawitem] call ZKB_fnc_GetItemName, _amountreturn, [_finalitem] call ZKB_fnc_GetItemName]] call ZKB_fnc_DynamicText;
call ZKB_fnc_SavePlayer;