/*
	Author: ZKB1325
	FileName: fn_KeyBindHolsterWeapon.sqf
	Function: ZKB_fnc_KeyBindHolsterWeapon
	
	Description: Key bind function for holstering current weapon
*/
if !(missionNamespace getVariable ["keysEnabled",true]) exitWith {false;};
if (!(currentWeapon player isEqualTo "") and !([player] call ZKB_fnc_IsSurrending) and !([player] call ZKB_fnc_IsKnockedOut) and !([player] call ZKB_fnc_IsRestrained)) then 
	{
	player action ["SwitchWeapon", player, player, 100];
	player switchCamera cameraView;
	};
true;