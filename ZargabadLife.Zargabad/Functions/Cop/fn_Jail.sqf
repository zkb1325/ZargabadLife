/*
    File: fn_Jail.sqf
	Function: ZKB_fnc_Jail
    Author: ZKB1325

    Description:
	Handles arresting the player
	
	0: Number
		Jail time in minutes
		
	1: Number
		Bail Default 30,000*minutes in jail
		
	2: String
		Name that arrested the player default: name player
*/
if (player getVariable ["InJail",false]) exitWith {}; //Already in jail

private _jailTimeMinutes = param [0,0,[0]];
missionNamespace setVariable ["JailTime",0];
if (_jailTimeMinutes <= 0) exitWith {};

if (call ZKB_fnc_IsMayor) then
	{
	missionNamespace setVariable ["currentMayor","",true];
	["STR_Jail_MayorArrested"] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	};

private _bail = param [1,0,[0]];
private _bailSub = 0;
if (_bail <= 0) then
	{
	_bail = round(_jailTimeMinutes*30000);
	_bailSub = 500;
	}
	else
	{
	_bailSub = ((_bail/_jailTimeMinutes)/60);
	};

private _jailTimeSeconds = ceil(_jailTimeMinutes*60);

private _arrestedBy = param [2,name player,[""]];
["STR_Jail_UnitArrested", [name player, _arrestedBy, [_jailTimeSeconds,"MM:SS"] call BIS_fnc_secondsToString]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
["STR_Jail_PlayerArrested",[[_jailTimeSeconds,"MM:SS"] call BIS_fnc_secondsToString]] call ZKB_fnc_DynamicText;

missionNamespace setVariable ["JailTime",_jailTimeSeconds];
player setVariable ["InJail",true,true];
player setVariable ["Bail",_bail];

private _servedTime = false;
private _released = false;
private _escapedJail = false;
private _died = false;
private _remainingJailTime = _jailTimeSeconds;

player setpos (getMarkerPos "JailMarker");
player setDamage 0;
player setVariable ["restrained",false,true];
call ZKB_fnc_SavePlayer;

[] spawn 
	{
	kickforce = 2;
	private _soccerMouseZChangedEH = (findDisplay 46) displayAddEventHandler ["MouseZChanged", 
		{
		if (_this select 1 > 0) then 
			{
			kickforce = (kickforce + 1) min 5;
			}
			else
			{
			kickforce = (kickforce - 1) max 0;
			};
			titleText [format ["Kick Force: %1%2",((kickforce/5)*100),"%"],"PLAIN DOWN"];
		}];
		
	private _soccerDraw3DEH = addMissionEventHandler ["Draw3D", 
	{
	drawIcon3D ["", [0,0,1,1], [((getposATL SoccerBall) select 0), ((getposATL SoccerBall) select 1), ((getposATL SoccerBall) select 2) + .25], 1.5, 1.5, 0, "Ball", 0, 0.04, "PuristaMedium","center",true];
	}];
	
	private _playerVel = velocity player;
	private _playerDir = direction player;
	while {true} do 
		{
		if !(player inArea "JailAreaMarker") exitWith {};
		
		waitUntil {player distance SoccerBall <= .5 or !(player inArea "JailAreaMarker")};
		_playerVel = velocity player;
		_playerDir = direction player;
		[SoccerBall,[(_playervel select 0) + (sin _playerDir * kickforce), (_playervel select 1) + (cos _playerDir * kickforce), kickforce/1.5]] remoteExecCall ["ZKB_fnc_AddForce",SoccerBall,false];
		sleep .1;
		};
	(findDisplay 46) displayRemoveEventHandler ["MouseZChanged",_soccerMouseZChangedEH];
	removeMissionEventHandler ["Draw3D",_soccerDraw3DEH];
	};
	
while {true} do
	{
	
	hintsilent format[localize "STR_Jail_ReleaseTimer", [_remainingJailTime,"MM:SS"] call BIS_fnc_secondsToString, [_bail] call ZKB_fnc_FormatNumber];
	
	if (_remainingJailTime <= 0) exitWith {_servedTime = true;};
	if !(player getVariable ["InJail",false]) exitWith {_released = true;};
	if !(player inArea "JailAreaMarker") exitWith {_escapedJail = true;};
	if !(alive player) exitWith {_died = true;};
	sleep 1;
	_remainingJailTime = _remainingJailTime - 1;
	missionNamespace setVariable ["JailTime",_remainingJailTime/60];
	_bail = round (_bail - _bailSub);
	player setVariable ["Bail",_bail];
	ZKB_Hunger = 5;
	};

hintsilent "";	
	
if (_servedTime) exitWith
	{
	["STR_Jail_Free",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	player setVariable ["InJail",false,true];
	player setVariable ["Bail",0];
	[player] call ZKB_fnc_Pardon;
	missionNamespace setVariable ["JailTime",0];
	player setpos (getMarkerPos "JailFreeMarker");
	player setDamage 0;
	ZKB_Suicides = 0;
	call ZKB_fnc_SavePlayer;
	};	
	
if (_released) exitWith
	{
	["STR_Jail_Free",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	player setVariable ["InJail",false,true];
	player setVariable ["Bail",0];
	[player] call ZKB_fnc_Pardon;
	missionNamespace setVariable ["JailTime",0];
	player setpos (getMarkerPos "JailFreeMarker");
	player setDamage 0;
	ZKB_Suicides = 0;
	call ZKB_fnc_SavePlayer;
	};
	
if (_died) exitWith
	{
	
	};
	
if (_escapedJail) exitWith
	{
	["STR_Jail_Escaped",[name player]] remoteExecCall ["ZKB_fnc_DynamicText",0,false];
	player setVariable ["Bail",0];
	player setVariable ["InJail",false,true];
	[player,"Escaping Jail",50000] call ZKB_fnc_AddWanted;
	call ZKB_fnc_SavePlayer;
	};