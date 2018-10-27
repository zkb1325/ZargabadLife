#include "..\..\ConfigMacros.hpp"
/*
	File: fn_KeyUpEH.sqf
	Function: ZKB_fnc_KeyUpEH
	Author: ZKB1325
	Description: Runs when ever a player presses Up on a key
*/

private _ctrl = _this select 0; //ignore
private _code = _this select 1; //key id
private _shift = _this select 2; //is shift pressed
private _ctrlKey = _this select 3; //is ctrl pressed
private _alt = _this select 4; //is alt pressed
private _handle = false; //true wont run default key presses for set key

switch (_code) do
	{
	//Tab
	case 15:
		{
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
	case 2:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (dialog) exitWith {closeDialog 0;};
		[] spawn ZKB_fnc_OpenInfoMenu;
		_handle = true;
		};	
		
	//2
	case 3:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (dialog) exitWith {closeDialog 0;};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if ([player] call ZKB_fnc_IsSurrending) exitWith {};
		if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
		call ZKB_fnc_OpenInventory;
		_handle = true;
		};
		
	//3
	case 4:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
		if !(isNull objectParent player) exitWith {};
		[] spawn ZKB_fnc_HandsUp;
		_handle = true;
		};
		
	//4
	case 5:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if !(isNull objectParent player) exitWith {};
		player setVariable ["surrendering",false,true]; 
		_handle = true;
		};
		
		
	//5
	case 6: 
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (IsCiv) then
			{
			if (dialog) exitWith {closeDialog 0;};
			if ([player] call ZKB_fnc_IsRestrained) exitWith {};
			if ([player] call ZKB_fnc_IsSurrending) exitWith {};
			if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
			
			call ZKB_fnc_OpenGangMenu;
			_handle = true;
			};
		};
	
	//E Interaction
	case 18:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (Dialog) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if ([player] call ZKB_fnc_IsSurrending) exitWith {};
		if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
		
		if ((isPlayer cursorObject) and IsCop and (side cursorObject isEqualTo civilian) and (player distance cursorObject < 3)) exitWith
			{
			if (dialog) then {closeDialog 0;};
			[cursorObject] spawn ZKB_fnc_CivInteractionMenu;
			};
			
		if ((isPlayer cursorObject) and IsCiv and (player distance cursorObject < 3)) exitWith
			{
			if (dialog) then {closeDialog 0;};
			[cursorObject] spawn ZKB_fnc_InteractionMenu;
			};
			
		if ((vehicle player == player) and ((locked cursorObject) == 0) and (!isNil {cursorObject getVariable "plate"}) and (player distance cursorObject < 5)) exitWith
			{
			_vcl = cursorObject;	
			if(_vcl emptyPositions "Driver" > 0)exitwith {player action ["getInDriver", _vcl]};
			if(_vcl emptyPositions "Gunner" > 0)exitwith {player action ["getInGunner", _vcl]};
			if(_vcl emptyPositions "Commander" > 0)exitwith {player action ["getInCommander", _vcl]};
			if(_vcl emptyPositions "Cargo" > 0)exitwith {player action ["getInDriver", _vcl];_vcl spawn {sleep 0.5;player moveincargo _this;};};	
			};
			
		if (!(vehicle player == player)) exitWith 
			{
			_vcl = (vehicle player);
			if((locked _vcl) == 2) exitwith {["STR_Common_VehIsLocked"] call ZKB_fnc_DynamicText;};
			if((speed _vcl) > 30) exitwith {["STR_Common_VehMovingToFast"] call ZKB_fnc_DynamicText;};
			player action ["getOut", _vcl];	
			};
			
		if ((count (cursorObject getVariable ["ShopData",[]]) > 0) and (player distance cursorObject < 5)) exitWith 
			{
			if ((str cursorObject) in SETTING(getArray,"ZKB_GangAreas")) exitWith {};
			if (cursorObject in [CocaineShop,MarijuanaShop,LSDShop,HeroinShop] and IsCop) exitWith
				{
				[cursorObject] call ZKB_fnc_SearchShop;
				};
			[cursorObject] spawn ZKB_fnc_OpenShop;
			};
		
		if ((str cursorObject)in SETTING(getArray,"ZKB_ATMArray")) exitWith {[] spawn ZKB_fnc_OpenBank;};
		};
		
	//T Trunk
	case 20:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (dialog) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		[(vehicle player)] spawn ZKB_fnc_OpenVehicleTrunk;
		_handle = true;
		};
	
	//F Siren/Knockout
	case 33:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (_shift and !isNull cursorObject and cursorObject isKindOf "Man" and isPlayer cursorObject and alive cursorObject and cursorObject distance player < 4 and speed cursorObject < 3 and (vehicle player isEqualTo player) and !((playerSide isEqualTo west) and (side cursorObject isEqualTo west))) exitWith 
			{
			if (!([cursorObject] call ZKB_fnc_IsKnockedOut) and (currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) and currentWeapon player != "" and !([player] call ZKB_fnc_IsKnockedOut) and !(missionNamespace getVariable ["knockingOut",false]) and !([player] call ZKB_fnc_IsSurrending)) then 
				{
                [cursorObject] spawn ZKB_fnc_knockoutAction;
				};
			};
			
		if (vehicle player == player or !(driver (vehicle player) isEqualTo player) or !IsCop) exitWith {};
		if (SirenLock) exitWith {systemchat "Anti Siren Spam";};
		[] spawn {SirenLock = true; sleep 3; SirenLock = false;};
		if ((vehicle player) getVariable ["SirenOn",false]) then
			{
			[false, (vehicle player)] remoteExecCall ["ZKB_fnc_PoliceSiren", 0, false];
			titletext [localize "STR_Cop_SirenOff", "PLAIN DOWN"];
			}
			else
			{		
			[true, (vehicle player)] remoteExecCall ["ZKB_fnc_PoliceSiren", 0, false];
			titletext [localize "STR_Cop_SirenOn", "PLAIN DOWN"];			
			};
		_handle = true;
		};
	
	//H
	case 35:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if (_shift and !(currentWeapon player isEqualTo "") and !([player] call ZKB_fnc_IsSurrending) and !([player] call ZKB_fnc_IsKnockedOut) and !([player] call ZKB_fnc_IsRestrained)) then 
			{
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
			};
		};
	//L Lock/Unlock
	case 38:
		{
		if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {};
		if ([player] call ZKB_fnc_IsRestrained) exitWith {};
		if ([player] call ZKB_fnc_IsSurrending) exitWith {};
		if ([player] call ZKB_fnc_IsKnockedOut) exitWith {};
		
		_vcls = nearestobjects [getpos player, ["motorcycle","Car","Tank","Ship","Air"], 7];
		_vcl = _vcls select 0;

		if (isNil "_vcl") exitWith {};
		if (!(_vcl in (player getVariable ["ZKB_Keys",[]])) and !((_vcl getVariable ["VehicleOwner",""]) == "")) exitWith {["STR_Common_VehLockNotYours"] call ZKB_fnc_DynamicText;};
		
		_keys = player getVariable ["ZKB_Keys", []];
		player setVariable ["ZKB_Keys", (_keys - [objNull]), true];
		
		if((locked _vcl) isEqualTo 2) then 
			{
			if(local _vcl) then 
				{
				_vcl lock 0;
				} 
				else 
				{
				[_vcl,0] remoteExecCall ["lock",_vcl];
				};
			["STR_Common_VehUnLocked"] call ZKB_fnc_DynamicText;
			} 
			else 
			{
			if(local _vcl) then 
				{
				_vcl lock 2;
				} 
				else 
				{
				[_vcl,2] remoteExecCall ["lock",_vcl];
				};
			["STR_Common_VehLocked"] call ZKB_fnc_DynamicText;
			};
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
				call ZKB_fnc_OpenPoliceComputerLite;
				}
				else
				{
				if !((vehicle player) in (player getVariable ["ZKB_Keys",[]])) exitwith {["STR_Cop_PoliceComputerNoKeys"] call ZKB_fnc_DynamicText;};
				if (dialog) exitwith {};
				call ZKB_fnc_OpenPoliceComputer;
				};
			};
		};

	
	};
_handle;