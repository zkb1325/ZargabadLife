/*
	Author: ZKB1325
	FileName: fn_InvSelChange.sqf
	Function: ZKB_fnc_InvSelChange
	Description: Handles filling the Inventory UI with info
*/
private ["_item","_display","_infobox","_infotext"];
disableserialization;
_item = call compile (_this select 0);
_itemclass = _item select 0;
_itemamount = _item select 1;

_display = uiNamespace getVariable "ZKB_Inventory";
_infobox = (_display displayCTRL 2080);

_infotext = "";

_infotext = _infotext + format [localize "STR_Inv_ItemName" + "<br/>", [_itemclass] call ZKB_fnc_GetItemName];
_infotext = _infotext + format [localize "STR_Inv_ItemAmount" + "<br/>", [_itemamount] call ZKB_fnc_FormatNumber];
_infotext = _infotext + format [localize "STR_Inv_ItemWeight" + "<br/>", [[_itemclass] call ZKB_fnc_GetItemWeight] call ZKB_fnc_FormatNumber];
_infotext = _infotext + format [localize "STR_Inv_ItemTotalWeight" + "<br/>", [[_itemclass] call ZKB_fnc_GetInvItemTotalWeight] call ZKB_fnc_FormatNumber];
_infotext = _infotext + format [localize "STR_Inv_ItemDesc" + "<br/><br/>", [_itemclass] call ZKB_fnc_GetItemDesc];
_infotext = _infotext + format [localize "STR_Inv_ItemCanDrop" + "<br/>", if ([_itemclass] call ZKB_fnc_GetItemCanDrop) then {localize "STR_Common_Yes"}else{localize "STR_Common_No"}];
_infotext = _infotext + format [localize "STR_Inv_ItemCanGive" + "<br/>", if ([_itemclass] call ZKB_fnc_GetItemCanGive) then {localize "STR_Common_Yes"}else{localize "STR_Common_No"}];
_infotext = _infotext + format [localize "STR_Inv_ItemIsIllegal", if ([_itemclass] call ZKB_fnc_GetItemIsIllegal) then {localize "STR_Common_Yes"}else{localize "STR_Common_No"}];

_infobox ctrlSetStructuredText parseText _infotext;