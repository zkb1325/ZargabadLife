/*
    File: fn_KilledEH.sqf
	Function: ZKB_fnc_KilledEH
    Author: ZKB1325

    Description:
    Killed EventHandler Function
*/

private _unit = param [0,player];
private _killer = param [1,objNull];
private _instigator = param [2,objNull];
if ((isNull _instigator) or !(isPlayer _instigator)) then {_instigator = UAVControl vehicle _killer select 0;};
if (isNull _instigator) then {_instigator = driver _killer;};
if !(isPlayer _instigator) then {_instigator = player};
closeDialog 0;
player setVariable ["respawning",true,true];
player setVariable ["restrained",false,true];

//if (IsCop) then {ZKB_RespawnLoadOut = getUnitLoadout player;};

ZKB_Deaths = ZKB_Deaths + 1;

if !(_instigator == player) then
	{
	[_unit] remoteExecCall ["ZKB_fnc_KilledPlayer",_instigator,false];
	ZKB_Suicides = 0;
	}
	else
	{
	
	["STR_Killed_PlayerSuicide"] call ZKB_fnc_DynamicText;
	ZKB_Suicides = ZKB_Suicides + 1;
	
	switch (true) do
		{
		case (ZKB_Hunger >= 100): {["STR_Killed_PlayerStarved", [name _unit]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];};
		default {["STR_Killed_PlayerDied", [name _unit]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];};
		};
	};
	
if (call ZKB_fnc_IsMayor) then
	{
	missionNamespace setVariable ["currentMayor","",true];
	["STR_Killed_MayorDied"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	};	

ZKB_Hunger = 5;

{
[_x,(_x select 1)] call ZKB_fnc_DropItem;
}forEach (player getVariable ["ZKB_Inventory",[]]);
["BlueInk",(["BlueInk"] call ZKB_fnc_GetInvItemAmount)] call ZKB_fnc_InvRemoveItem;