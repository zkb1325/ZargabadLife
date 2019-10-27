/*
	Author: ZKB1325
	File: fn_LockPick.sqf
	Function: ZKB_fnc_LockPick
	Description: Runs when player uses the lockpick
*/
private ["_item","_nearvehicles","_veh","_keys"];
if (ZKB_PerformingAction) exitWith {["STR_Common_AlreadyPerformingAction"] call ZKB_fnc_DynamicText;};
if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};
_nearvehicles = (nearestObjects [player, ["motorcycle","Car","Tank","Ship","Air"], 8]);
if (count _nearvehicles < 1) exitWith {["STR_ItemMisc_NotNearVcl"] call ZKB_fnc_DynamicText;};
_veh = _nearvehicles select 0;
if (_veh inArea "CarPark") exitWith {["STR_ItemMisc_LockpickInSafezone"] call ZKB_fnc_DynamicText;};
if (_veh in (player getVariable ["ZKB_Keys",[]])) exitWith {["STR_ItemMisc_LockpickAlreadyOwn"] call ZKB_fnc_DynamicText;};
ZKB_PerformingAction = true;
_item = _this select 1;

if ((random 100) < 40) then
	{
	playSound3D ["A3\Sounds_F_Orange\MissionSFX\Car_Alarm_6s.wss", _veh, false, getPosASL _veh, 5, 1, 150];
	};

[_item, 1] call ZKB_fnc_InvRemoveItem;

if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
	{
	[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

sleep 7;

if ((random 100) < 15) then
	{
	_keys = (player getVariable ["ZKB_Keys",[]]);	
	_keys pushBack _veh;
	player setVariable ["ZKB_Keys", _keys, true];
	["STR_ItemMisc_LockpickSuccess"] call ZKB_fnc_DynamicText;
	["STR_Admin_PlayerLogsLockPicked",name player,_veh getVariable ["plate",_veh]] call ZKB_fnc_AdminAddPlayerLog;
	if (IsCop) exitWith {};
	if ({((_x distance player) < 100) and !((group _x) isEqualTo (group player))}count playableUnits > 0) then
		{
		[player,"GTA",2500] call ZKB_fnc_AddWanted;
		};
	}
	else
	{
	["STR_ItemMisc_LockpickFail"] call ZKB_fnc_DynamicText;
	if (IsCop) exitWith {};
	if ({((_x distance player) < 100) and !((group _x) isEqualTo (group player))}count playableUnits > 0) then
		{
		[player,"Attempted GTA",1500] call ZKB_fnc_AddWanted;
		};
	};
ZKB_PerformingAction = false;
