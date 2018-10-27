/*
	Author: ZKB1325
	File: fn_OpenGangMenu.sqf
	Function: ZKB_fnc_OpenGangMenu
	Description: Handles filling in the gang menu
*/

private ["_display","_ganglist"];
disableserialization;
createDialog "ZKB_GangMenu";

_display = uiNamespace getVariable "ZKB_GangMenu";
_ganglist = _display displayCtrl 17050;


{
_gangarray = missionNameSpace getVariable [format ["GangArray_%1", _x],[]];	
_index = _ganglist lbAdd format [localize "STR_Gang_GangMenuMemberList",(_gangarray select 0), [_gangarray] call ZKB_fnc_GetGangMembers];	
_ganglist lbSetData [_index, format ["GangArray_%1", _x]];
}forEach (missionNameSpace getVariable ["ZKB_GangIndexArray",[]]);