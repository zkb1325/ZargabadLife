/*
	Author: ZKB1325
	File: fn_ManageGang.sqf
	Function: ZKB_fnc_ManageGang
	Description: Handles filling in the gang manage menu
*/

private ["_display","_memberlist","_joinallowlist","_index"];
if !([player] call ZKB_fnc_IsGangLeader) exitWith {["STR_Gang_NotGangLeader"] call ZKB_fnc_DynamicText;};
disableserialization;
closeDialog 0;
createDialog "ZKB_GangManager";

_display = uiNamespace getVariable "ZKB_GangManager";
_memberlist = _display displayCtrl 18020;
_joinallowlist = _display displayCtrl 18050;

_playersgang = (([player] call ZKB_fnc_FindGang) select 0);

{

_index = _memberlist lbAdd format ["%1", (_x select 1)];
_memberlist lbSetData [_index, (_x select 0)];

}forEach (_playersgang select 1);

_index = _joinallowlist lbAdd localize "STR_Common_Yes";
_joinallowlist lbSetData [_index, "Yes"];

_index = _joinallowlist lbAdd localize "STR_Common_No";
_joinallowlist lbSetData [_index, "No"];
