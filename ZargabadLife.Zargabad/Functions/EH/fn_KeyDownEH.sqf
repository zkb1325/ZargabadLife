#include "..\..\ConfigMacros.hpp"
/*
	File: fn_KeyDownEH.sqf
	Function: ZKB_fnc_KeyDownEH
	Author: ZKB1325
	Description: Runs when ever a player presses down on a key main reason is to block default key press
*/

private _ctrl = _this select 0; //ignore
private _code = _this select 1; //key id
private _shift = _this select 2; //is shift pressed
private _ctrlKey = _this select 3; //is ctrl pressed
private _alt = _this select 4; //is alt pressed
private _handle = false; //true wont run default key presses for set key

private _mapKey = actionKeys "ShowMap" select 0;
private _escKey = actionKeys "ingamePause" select 0;

switch (_code) do
	{
	
	//Esc Key
	case _escKey:
		{
		[] spawn ZKB_fnc_SavePlayer;
		};
		
	//Map Key
    case _mapKey: 
		{
        switch (playerSide) do 
			{
            case west: {if (!visibleMap) then {[] spawn ZKB_fnc_CopMarkers;}};
            case civilian: {if (!visibleMap) then {[] spawn ZKB_fnc_CivMarkers;}};
			};
		};
	
	//F5
	case 0x3F: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		if (isclass (missionConfigFile >> "Admins" >> (getPlayerUID player))) then
			{
			_handle = call ZKB_fnc_OpenAdminMenu;
			};
		};
	//F1
	case 0x3B: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_OpenWelcomeMenu;
		};
	//F2
	case 0x3C: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		0 fadeSound ((soundVolume - .1) max 0); titleText [format [localize "STR_CBA_VolumeAt",((soundVolume/1)*100),"%"],"PLAIN DOWN"];
		_handle = true;
		};
	//F3
	case 0x3D: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		0 fadeSound ((soundVolume + .1) min 1); titleText [format [localize "STR_CBA_VolumeAt",((soundVolume/1)*100),"%"],"PLAIN DOWN"];
		_handle = true;
		};
	//Tab
	case 0x0F: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		if (missionNamespace getVariable ["keysEnabled",true]) then
			{
			missionNamespace setVariable ["keysEnabled",false];
			titleText [format [localize "STR_Common_KeysEnabled",localize "STR_Common_No"],"PLAIN DOWN"];
			}
			else
			{
			missionNamespace setVariable ["keysEnabled",true];
			titleText [format [localize "STR_Common_KeysEnabled",localize "STR_Common_Yes"],"PLAIN DOWN"];
			};
		};
	//1
	case 0x02: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindOpenInfoMenu;
		};
	//2
	case 0x03: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindOpenInventory;
		};
	//3
	case 0x04: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindHandsUp;
		};
	//4
	case 0x05: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindHandsDown;
		};
	//5
	case 0x06: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindOpenGangMenu;
		};
	//E
	case 0x12: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindInteractionKey;
		};
	//T
	case 0x14: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindOpenTrunk;
		};
	//F
	case 0x21: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = if (_shift) then {call ZKB_fnc_KeyBindKnockOut;} else {call ZKB_fnc_KeyBindSirenOnOff};
		};
	//H
	case 0x23: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		if (_shift) then {_handle = call ZKB_fnc_KeyBindHolsterWeapon;};
		};
	//L
	case 0x26: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindVehicleLock;
		};
	//Tilda `
	case 0x29: 
		{
		if (SETTING(getNumber,"ZKB_UseCBAKeyBinds") isEqualTo 1) exitWith {};
		_handle = call ZKB_fnc_KeyBindPoliceComputer;
		};
	
	
	/*
	//W key
	case 17: 
		{
		_vcl = vehicle player;

		if (_vcl == player or !((driver _vcl) == player) or ((_vcl getvariable ["VehUpgradeLvl", 0]) == 0)) exitwith {};



		if (isEngineOn _vcl) then
			{

				_vel = velocity _vcl;
				_dir = direction _vcl;
				_speed = _vcl getvariable ["VehUpgradeLvl", 0]; //.035 = upgrade 1, .05 = upgrade 2, .075 = upgrade 3, .09 = upgrade 4, .125 = upgrade 5
				_vcl setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)];
			
			};

		};
	*/
	};
_handle;