/*
	Author: ZKB1325
	File: fn_SuicideBomb.sqf
	Function: ZKB_fnc_SuicideBomb
	Description: Removes all virtual items from the ground within a 10 meter radius
*/
private ["_item","_bomb"];
closeDialog 0;
if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};

"Allah Hu Akbar infidels!" remoteExec ["Hint",0];

_item = _this select 1;
[_item, 1] call ZKB_fnc_InvRemoveItem;

for [{_i=5}, {_i >= 0}, {_i=_i-1}] do 
	{
	titletext [format [localize "STR_ItemMisc_SuicideBombCountDown", _i],"plain"];
	sleep 1;
	};
	
if !(alive player) exitWith {};
_bomb = "Bo_GBU12_LGB" createVehicle (getposATL player);
[_bomb, player] remoteExecCall ["ZKB_fnc_SetShotParents", 2];