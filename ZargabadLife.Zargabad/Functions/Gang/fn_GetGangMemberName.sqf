/*
	Author: ZKB1325
	File: fn_GetGangMemberName.sqf
	Function: ZKB_fnc_GetGangMemberName
	Description: Takes a player UID and returns the players name thats in a gang
*/
private _gangMemberUID = param [0,"",[""]];
private _gangMembers = [_gangMemberUID] call ZKB_fnc_GetGangMembers;
private _return = "";

{
if (_x isEqualTo _gangMemberUID) exitWith
	{
	_return = ((_gangMembers select 1) select _forEachIndex); 
	};
}forEach (_gangMembers select 0);

_return;