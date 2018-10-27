/*
	File: fn_RobPlayer.sqf
	Function: ZKB_fnc_RobPlayer
	Author: ZKB1325
	Description: Robs all money and the most valuable items from a player
	
	0: Object
		player to rob
*/
private _robbedPlayer = param [0,objNull,[objNull]];
if (isNull _robbedPlayer) exitWith {closeDialog 0; ["STR_Bank_TransferPlayerNotInGame"] call ZKB_fnc_DynamicText;};
if (!([_robbedPlayer] call ZKB_fnc_IsSurrending) and !([_robbedPlayer] call ZKB_fnc_IsKnockedOut) and !([_robbedPlayer] call ZKB_fnc_IsRestrained)) exitWith {["STR_Cop_NotSurrendering",[name _robbedPlayer]] call ZKB_fnc_DynamicText;};
if ((_robbedPlayer getVariable ["lastRobbed",0]) > serverTime) exitWith {["STR_Civ_InteractionMenuRobbedRecently",[name _robbedPlayer]] call ZKB_fnc_DynamicText;};
_robbedPlayer setVariable ["lastRobbed",serverTime + 120,true];
["STR_Civ_InteractionMenuRobbedPlayer",[name player,name _robbedPlayer]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];

[player,"Armed Robbery",15000] call ZKB_fnc_AddWanted;
[player] remoteExecCall ["ZKB_fnc_RobPlayerDropItems",_robbedPlayer,false];