#include "..\..\ConfigMacros.hpp"
/*
	Author: ZKB1325
	FileName: fn_BuySlave.sqf
	Function: ZKB_fnc_BuySlave
	
	Description: Buys and groups a slave to the player
	this addAction [localize "STR_Slave_Buy",ZKB_fnc_BuySlave,"",1,true,true,"","playerSide isEqualTo civilian",8];
*/
if ([player] call ZKB_fnc_IsGangMember) exitWith {["STR_Slave_InGang"] call ZKB_fnc_DynamicText;};
if ((["Money"] call ZKB_fnc_GetInvItemAmount) < SETTING(getNumber,"ZKB_SlaveCost")) exitWith {["STR_Slave_NoMoney",[[SETTING(getNumber,"ZKB_SlaveCost")] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;};
private _ownedSlaves = player getVariable ["ownedSlave",[]];
_ownedSlaves = _ownedSlaves - [objNull];
if ((count _ownedSlaves) >= SETTING(getNumber,"ZKB_MaxSlaves")) exitWith {["STR_Slave_Max",[SETTING(getNumber,"ZKB_MaxSlaves")]] call ZKB_fnc_DynamicText;};
["Money",SETTING(getNumber,"ZKB_SlaveCost")] call ZKB_fnc_InvRemoveItem;

private _slave = (group player) createUnit [SETTING(getText,"ZKB_SlaveClass"), (group player), [], 2, "FORM"];
_slave allowFleeing 0;
removeBackpackGlobal _slave;
removeHeadgear _slave;
removeAllWeapons _slave;
removeAllAssignedItems _slave;

_ownedSlaves pushBack _slave;
player setVariable ["ownedSlave",_ownedSlaves];
_slave setVariable ["owner",getPlayerUID player,true];
_slave setVariable ["money",0,true];

[_slave] spawn ZKB_fnc_SlaveLoop;
 
_slave addMPEventHandler ["MPKilled",
	{
	private _unit = param [0];
	private _killer = param [1];
	private _instigator = param [2];
	if ((isNull _instigator) or !(isPlayer _instigator)) then {_instigator = UAVControl vehicle _killer select 0;};
	if (isNull _instigator) then {_instigator = driver _killer;};
	
	if (isDedicated) exitWith {};
	if ((_instigator isEqualTo player) and !(playerSide isEqualTo west)) then
		{
		[_instigator,"Murder",30000] call ZKB_fnc_AddWanted;
		};
	}];
/*	
[_slave,[localize "STR_Slave_CollectMoney",{
private _slave = param [0]; 
private _collectedAmount = _slave getVariable ["money",0]; 
_slave setVariable ["money",0,true];
["Money",_collectedAmount] call ZKB_fnc_InvAddItem; 
["STR_Slave_CollectedMoney",[[_collectedAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
},"",1,true,true,"",'_target getVariable ["money",0] > 0',7]] remoteExecCall ["ZKB_fnc_AddAction",civilian,_slave];
*/
[
["playerSide isEqualTo civilian",_slave,[localize "STR_Slave_CollectMoney",{
private _slave = param [0]; 
private _collectedAmount = _slave getVariable ["money",0]; 
_slave setVariable ["money",0,true];
["Money",_collectedAmount] call ZKB_fnc_InvAddItem; 
["STR_Slave_CollectedMoney",[[_collectedAmount] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
["STR_Admin_PlayerLogsCollectSlaveMoney",name player,[_collectedAmount] call ZKB_fnc_FormatNumber,[_slave getVariable ["owner",""]] call ZKB_fnc_GetPlayerFromID] call ZKB_fnc_AdminAddPlayerLog;
},"",1,true,true,"",'(_target getVariable ["money",0] > 0) and (playerSide isEqualTo civilian)',7]],

["playerSide isEqualTo west",_slave,[localize "STR_Slave_Free",{
private _slave = param [0];
private _slaveOwnerUID = _slave getVariable ["owner",""];
private _slaveOwner = [_slaveOwnerUID] call ZKB_fnc_GetPlayerFromID;
if (isNull _slaveOwner) then
	{
	["STR_Slave_OwnerNotOnline",[[SETTING(getNumber,"ZKB_SlaveFreeReward")] call ZKB_fnc_FormatNumber]] call ZKB_fnc_DynamicText;
	deleteVehicle _slave;
	["Money",SETTING(getNumber,"ZKB_SlaveFreeReward")] call ZKB_fnc_InvAddItem;
	}
	else
	{
	["STR_Slave_SetFree",[[SETTING(getNumber,"ZKB_SlaveFreeReward")] call ZKB_fnc_FormatNumber,name _slaveOwner]] call ZKB_fnc_DynamicText;
	_slave setVariable ["free",true,true];
	["Money",SETTING(getNumber,"ZKB_SlaveFreeReward")] call ZKB_fnc_InvAddItem;
	};
},"",1,true,true,"",'!(_target getVariable ["free",false]) and (playerSide isEqualTo west)',7]]
] remoteExecCall ["ZKB_fnc_AddAction",0,_slave];

["STR_Admin_PlayerLogsBoughtSlave",name player] call ZKB_fnc_AdminAddPlayerLog;
