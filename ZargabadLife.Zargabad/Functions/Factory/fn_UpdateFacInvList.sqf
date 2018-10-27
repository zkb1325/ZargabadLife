/*
	File: fn_UpdateFacInvList.sqf
	Function: ZKB_fnc_UpdateFacInvList
	Author: ZKB1325
	Description: Updates the inv side list for factories
*/
private ["_display","_facinvelist"];
disableserialization;


_display = uiNameSpace getVariable "ZKB_ListMenu";

_facinvelist = _display displayCtrl 5020;
lbClear _facinvelist;



{
if (([_x] call ZKB_fnc_GetInvItemAmount) > 0) then
	{	
	_index = _facinvelist lbAdd format [localize "STR_Fac_FacStoreList", ([_x] call ZKB_fnc_GetItemName), ([([_x] call ZKB_fnc_GetInvItemAmount)] call ZKB_fnc_FormatNumber), ([([_x] call ZKB_fnc_GetItemWeight)*([_x] call ZKB_fnc_GetInvItemAmount)] call ZKB_fnc_FormatNumber)];	
	_facinvelist lbSetData [_index, str [_x,([_x] call ZKB_fnc_GetInvItemAmount)]];
	};

}forEach ZKB_FactoryResources;