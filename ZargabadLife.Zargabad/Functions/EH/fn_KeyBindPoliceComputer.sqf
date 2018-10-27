/*
	Author: ZKB1325
	FileName: fn_KeyBindPoliceComputer.sqf
	Function: ZKB_fnc_KeyBindPoliceComputer
	
	Description: Key bind function for opening the police computer
*/
if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};

if (IsCop) then
	{
	if (isNull objectParent player) then
		{
		if (dialog) exitWith {true;};
		call ZKB_fnc_OpenPoliceComputerLite;
		}
		else
		{
		if !((vehicle player) in (player getVariable ["ZKB_Keys",[]])) exitWith {["STR_Cop_PoliceComputerNoKeys"] call ZKB_fnc_DynamicText; true;};
		if (dialog) exitWith {true;};
		call ZKB_fnc_OpenPoliceComputer;
		};
	};
true;