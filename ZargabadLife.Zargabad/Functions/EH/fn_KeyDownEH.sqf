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
		call ZKB_fnc_SavePlayer;
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
	/*	
	//1
	case 2:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (dialog) exitWith {};
		_handle = true;
		};	
		
	//2	
	case 3: {if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {}; if (([player] call ZKB_fnc_IsRestrained) or ([player] call ZKB_fnc_IsSurrending)) exitWith {}; _handle = true;};
	
	//3
	case 4:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if ([player] call ZKB_fnc_IsSurrending) exitWith {};
		if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
		if !(isNull objectParent player) exitWith {};
		_handle = true;
		};
		
	//4
	case 5:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if !(isNull objectParent player) exitWith {};
		_handle = true;
		};
		
	//5
	case 6: 
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if ([player] call ZKB_fnc_IsSurrending) exitWith {};
		if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
		if (IsCiv) then {_handle = true;};
		};
	
	//E Interaction
	case 18:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if ([player] call ZKB_fnc_IsSurrending) exitWith {};
		if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
		
		if ((isPlayer cursorObject) and IsCop and (side cursorObject isEqualTo civilian) and (player distance cursorObject < 3)) exitWith
			{
			_handle = true;
			};
			
		if ((isPlayer cursorObject) and IsCiv and (player distance cursorObject < 3)) exitWith
			{
			_handle = true;
			};
		
		if ((vehicle player == player) and ((locked cursorObject) == 0) and (!isNil {cursorObject getVariable "plate"}) and (player distance cursorObject < 5)) exitWith
			{
			_vcl = cursorObject;	
			if(_vcl emptyPositions "Driver" > 0)exitwith {_handle = true;};
			if(_vcl emptyPositions "Gunner" > 0)exitwith {_handle = true;};
			if(_vcl emptyPositions "Commander" > 0)exitwith {_handle = true;};
			if(_vcl emptyPositions "Cargo" > 0)exitwith {_handle = true;};	
			};
			
		if (!(vehicle player == player) and ((locked (vehicle player) == 0))) exitWith 
			{
			_vcl = (vehicle player);
			if((locked _vcl) == 2)exitwith{};
			if((speed _vcl) > 30)exitwith{};
			_handle = true;	
			};
		
		if ((count (cursorObject getVariable ["ShopData",[]]) > 0) and (player distance cursorObject < 5)) exitWith {if ((str cursorObject) in SETTING(getArray,"ZKB_GangAreas")) exitWith {};_handle = true;};
		
		if ((str cursorObject)in SETTING(getArray,"ZKB_ATMArray")) exitWith {_handle = true;};
		};
	
	//T
	case 20:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (dialog) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		_handle = true;
		};
		
	//F
	case 33:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (_shift and !isNull cursorObject and cursorObject isKindOf "Man" and isPlayer cursorObject and alive cursorObject and cursorObject distance player < 4 and speed cursorObject < 3 and (vehicle player isEqualTo player) and !((playerSide isEqualTo west) and (side cursorObject isEqualTo west))) exitWith 
			{
			if (!([cursorObject] call ZKB_fnc_IsKnockedOut) and (currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) and currentWeapon player != "" and !([player] call ZKB_fnc_IsKnockedOut) and !(missionNamespace getVariable ["knockingOut",false]) and !([player] call ZKB_fnc_IsSurrending)) then 
				{
                _handle = true;	
				};
			};
			
		if (vehicle player == player or !(driver (vehicle player) == player) or !IsCop) exitWith {};
		if ((vehicle player) getVariable ["SirenOn",false]) then
			{
			_handle = true;		
			};
		};
		
	//L Lock/Unlock
	case 38:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if ([player] call ZKB_fnc_IsSurrending) exitWith {};
		if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
		if (vehicle player == player) then
			{
			_veh = cursorObject;	
			}
			else
			{
			_veh = vehicle player;	
			};
		if (!(_veh in (player getVariable ["ZKB_Keys",[]])) and !((_veh getVariable ["VehicleOwner",""]) == "")) exitWith {};
		if (!(_veh in (player getVariable ["ZKB_Keys",[]]) or player distance _veh > 8)) exitWith {};
		_handle = true;	
		};
		
	//Tilda `/~
	case 41:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (IsCop) then
			{
			if (isNull objectParent player) then
				{
				if (dialog) exitwith {};
				_handle = true;
				}
				else
				{
				if !((vehicle player) in (player getVariable ["ZKB_Keys",[]])) exitwith {};
				if (dialog) exitwith {};
				_handle = true;
				};
			};
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