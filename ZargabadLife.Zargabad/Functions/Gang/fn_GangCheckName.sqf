/*
	Author: ZKB1325
	File: fn_GangCheckName.sqf
	Function: ZKB_fnc_GangCheckName
	Description: Takes a stringed gang name and returns true/false if the name is taken
*/
private ["_gangname","_return","_gangarray"];
_gangname = _this select 0;
_return = false;

if (_gangname == "Cops" or _gangname == "Not A Gang Name" or _gangname == "" or _gangname == (localize "STR_Gang_GangName")) exitWith {true;};
{
_gangarray = missionNameSpace getVariable [format ["GangArray_%1", _x],[]];	
if ((_gangarray select 0) == _gangname) exitWith {_return = true;};

}forEach (missionNameSpace getVariable ["ZKB_GangIndexArray",[]]);

_return;