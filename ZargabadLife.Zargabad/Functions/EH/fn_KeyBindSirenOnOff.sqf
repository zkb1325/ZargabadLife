/*
	Author: ZKB1325
	FileName: fn_KeyBindSirenOnOff.sqf
	Function: ZKB_fnc_KeyBindSirenOnOff
	
	Description: Key bind function for toggling siren on/off
*/
if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
	
if (vehicle player == player or !(driver (vehicle player) isEqualTo player) or !IsCop) exitWith {true;};
if (SirenLock) exitWith {systemchat "Anti Siren Spam"; true;};
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
true;