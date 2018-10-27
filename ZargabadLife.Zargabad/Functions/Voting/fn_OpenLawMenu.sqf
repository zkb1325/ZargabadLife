/*
	Author: ZKB1325
	FileName: fn_OpenLawMenu.sqf
	Function: ZKB_fnc_OpenLawMenu
	Description: Opens the mayors law menu
	
	this addAction [localize "STR_Law_LawMenu",ZKB_fnc_OpenLawMenu,"",0,true,true,"","call ZKB_fnc_IsMayor",8];
*/
disableSerialization;
createDialog "ZKB_LawEditMenu";
private _display = uiNamespace getVariable "ZKB_LawEditMenu";
private _lawListCtrl = _display displayCtrl 22010;

{
private _index = _lawListCtrl lbAdd format ["%1: %2",_forEachIndex+1,_x];
_lawListCtrl lbSetData [_index,_x];
}forEach ZKB_LawArray;