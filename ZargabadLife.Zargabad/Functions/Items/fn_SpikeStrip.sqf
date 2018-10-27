/*
	Author: ZKB1325
	File: fn_SpikeStrip
	Function: ZKB_fnc_SpikeStrip
	Description: Creates a spike strip and preps it.
*/
private["_pos","_spikeStrip"];
_item = _this select 1;
closeDialog 0;
if !(vehicle player == player) exitWith {["STR_Common_CantUseInVeh"] call ZKB_fnc_DynamicText;};

[_item, 1] call ZKB_fnc_InvRemoveItem;

_spikeStrip = "Land_Razorwire_F" createVehicle [0,0,0];
_pos = [(position player select 0) + (sin(getdir player)*7), (position player select 1) + (cos(getdir player)*7), .1];
_spikeStrip setdir ((getdir player) + 90);
_spikeStrip setpos _pos;
_spikeStrip setDammage 1;


[_spikeStrip] remoteExec ["ZKB_fnc_SpikeStripEffect", 0, _spikeStrip];
