/*
    File: fn_Restrain.sqf
	Function: ZKB_fnc_Restrain
    Author: ZKB1325

    Description:
	Restrain/unRestrain the player
	
	AwopPercMstpSgthWnonDnon_end //knock out unarmed //switchMove
	AwopPercMstpSgthWpstDnon_Part3 //knock out pistol //switchMove
	AwopPercMstpSgthWrflDnon_End1 //knock out rifle //switchMove
	Acts_CivilHiding_2 //Restrained
	
	
	private _animation = switch (animationState player) do
		{
		case "AmovPercMstpSnonWnonDnon_Ease": {"AmovPercMstpSlowWrflDnon_SaluteIn"};
		case "acts_executionvictim_loop": {"Acts_ExecutionVictim_Unbow"};
		case "revive_secured": {"amovppnemstpsnonwnondnon"};
		case "acts_aidlpsitmstpssurwnondnon_loop";
		case "Acts_AidlPsitMstpSsurWnonDnon01";
		case "Acts_AidlPsitMstpSsurWnonDnon02";
		case "Acts_AidlPsitMstpSsurWnonDnon03";
		case "Acts_AidlPsitMstpSsurWnonDnon04";
		case "Acts_AidlPsitMstpSsurWnonDnon05": {"Acts_AidlPsitMstpSsurWnonDnon_out"};
		default {"amovpercmstpsnonwnondnon"};
		};
	
	
	
	private _animation = switch (true) do
		{
		case (animationState player in ((("SIT_LOW" call BIS_fnc_ambientAnimGetParams) select 0) + (("SIT_LOW_U" call BIS_fnc_ambientAnimGetParams) select 0))): {selectRandom ["Acts_AidlPsitMstpSsurWnonDnon01","Acts_AidlPsitMstpSsurWnonDnon02","Acts_AidlPsitMstpSsurWnonDnon03","Acts_AidlPsitMstpSsurWnonDnon04","Acts_AidlPsitMstpSsurWnonDnon05"]};
		case (stance player isEqualTo "STAND"): {"AmovPercMstpSnonWnonDnon_Ease"};
		case (stance player isEqualTo "CROUCH"): {"Acts_ExecutionVictim_Loop"};
		case (stance player isEqualTo "PRONE"): {"revive_secured"};
		default {"AmovPercMstpSnonWnonDnon_Ease"};
		};
	
*/

if (player getVariable ["restrained",false]) exitWith {};

player setVariable ["restrained",true,true];
player setVariable ["surrendering",false,true];
closeDialog 0;

if ([player] call ZKB_fnc_IsKnockedOut) then
	{
	waitUntil {!([player] call ZKB_fnc_IsKnockedOut)};
	[player,"amovppnemstpsnonwnondnon",false] remoteExecCall ["ZKB_fnc_AnimSync",0,false];
	};

[] spawn
	{
	private _checkTime = time + (5*60);
	while {player getVariable ["restrained",false]} do
		{
		waitUntil {time > _checkTime};
		if (!(player getVariable ["restrained",false])) exitWith {};
		if ({_x != player && side _x isEqualTo west && alive _x && _x distance player < 50} count playableUnits isEqualTo 0) then 
			{
			player setVariable ["restrained",false,true];
			};
		};
	};
	
while {player getVariable ["restrained",false]} do
	{
	if ((isNull objectParent player) and (animationState player != "revive_secured")) then
		{
		[player,"revive_secured",false] remoteExecCall ["ZKB_fnc_AnimSync",0,false];
		};
		
	_state = vehicle player;
	waitUntil {(vehicle player != _state) or (animationState player != "revive_secured") or !(player getVariable ["restrained",false])};
	
	if !(player getVariable ["restrained",false]) exitWith {};
	
	if (vehicle player != player) then
		{
		player action["eject",vehicle player];
		};
	
	
	};
	
if (alive player) then
	{
	[player,"amovppnemstpsnonwnondnon",false] remoteExecCall ["ZKB_fnc_AnimSync",0,false];
	};
player setVariable ["restrained",false,true];
["STR_Cop_UnRestrained"] call ZKB_fnc_DynamicText;
	
	
	
	