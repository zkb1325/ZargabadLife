/*
	File: fn_ImpoundMenu.sqf
	Function: ZKB_fnc_ImpoundMenu
	Author: ZKB1325
	Description: Opens and fills the impound lot menu for the player to retrieve an impounded vehicle
	
	this addAction [localize "STR_Vehicle_ImpoundLot",ZKB_fnc_ImpoundMenu,ImpoundLotSpawn];
*/

ZKB_ImpoundSpawn = param [3,objNull,[objNull,""]];
createDialog "ZKB_VoteList";

private _display = (uiNamespace getVariable "ZKB_VoteList");
private _frame = _display displayCtrl 21002;
private _impoundList = _display displayCtrl 21010;
private _retreiveBtn = _display displayCtrl 21020;

_frame ctrlSetText localize "STR_Vehicle_ImpoundLot";
_retreiveBtn ctrlSetText localize "STR_Vehicle_ImpoundRetrieve";

{
private _index = _impoundList lbAdd ([_x select 0] call ZKB_fnc_GetItemName);
}forEach (missionNamespace getVariable [format ["%1_Impound",getPlayerUID player],[]]);

_retreiveBtn buttonSetAction "[lbCurSel 21010] call ZKB_fnc_UnImpound";