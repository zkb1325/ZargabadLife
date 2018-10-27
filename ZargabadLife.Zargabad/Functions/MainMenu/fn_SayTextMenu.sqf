/*
	Author: ZKB1325
	File: fn_SayTextMenu.sqf
	Function: ZKB_fnc_SayTextMenu
	Description: Opens up and fills in the say text dialog
*/


private ["_type"];
disableserialization;
_type = param [0,"Open",[""]];

if (_type == "Open") exitWith
	{
	private ["_display","_ShoutText_Text1","_ShoutText_ChatOption1","_ShoutText_Text2","_ShoutText_ChatOption2","_ShoutText_Text3","_ShoutText_ChatOption3","_ShoutText_Text4","_ShoutText_ChatOption4"];
	createDialog "ZKB_ShoutText";

	_display = uiNamespace getVariable "ZKB_ShoutText";

	_ShoutText_Text1 = (_display displayCTRL 7010);
	_ShoutText_ChatOption1 = (_display displayCTRL 7020);
	_ShoutText_Text2 = (_display displayCTRL 7030);
	_ShoutText_ChatOption2 = (_display displayCTRL 7040);
	_ShoutText_Text3 = (_display displayCTRL 7050);
	_ShoutText_ChatOption3 = (_display displayCTRL 7060);
	_ShoutText_Text4 = (_display displayCTRL 7070);
	_ShoutText_ChatOption4 = (_display displayCTRL 7080);

	for [{_i=1}, {_i <= 4}, {_i=_i+1}] do 
		{	
		call compile format["_ShoutText_Text%1 ctrlSetText ZKB_RadioTextMsg_%1;", _i];
		call compile format["_index = _ShoutText_ChatOption%1 lbAdd 'Global'; _ShoutText_ChatOption%1 lbSetData [_index, 'global']; if(ZKB_RadioTextBroadcast_%1 == 'global')then{_ShoutText_ChatOption%1 lbSetCurSel 0;};", _i];
		call compile format["_index = _ShoutText_ChatOption%1 lbAdd 'Side'; _ShoutText_ChatOption%1 lbSetData [_index, 'side']; if(ZKB_RadioTextBroadcast_%1 == 'side'  )then{_ShoutText_ChatOption%1 lbSetCurSel 1;};", _i];
		call compile format["_index = _ShoutText_ChatOption%1 lbAdd 'Direct'; _ShoutText_ChatOption%1 lbSetData [_index, 'direct']; if(ZKB_RadioTextBroadcast_%1 == 'direct')then{_ShoutText_ChatOption%1 lbSetCurSel 2;};", _i];
		};
	};
	
if (_type == "Save") exitWith
	{
	private ["_display","_ShoutText_Text1","_ShoutText_ChatOption1","_ShoutText_Text2","_ShoutText_ChatOption2","_ShoutText_Text3","_ShoutText_ChatOption3","_ShoutText_Text4","_ShoutText_ChatOption4"];
	_display = uiNamespace getVariable "ZKB_ShoutText";

	_ShoutText_Text1 = (_display displayCTRL 7010);
	_ShoutText_ChatOption1 = (_display displayCTRL 7020);
	_ShoutText_Text2 = (_display displayCTRL 7030);
	_ShoutText_ChatOption2 = (_display displayCTRL 7040);
	_ShoutText_Text3 = (_display displayCTRL 7050);
	_ShoutText_ChatOption3 = (_display displayCTRL 7060);
	_ShoutText_Text4 = (_display displayCTRL 7070);
	_ShoutText_ChatOption4 = (_display displayCTRL 7080);	
	
	ZKB_RadioTextMsg_1 = ctrlText _ShoutText_Text1;
	ZKB_RadioTextMsg_2 = ctrlText _ShoutText_Text2;
	ZKB_RadioTextMsg_3 = ctrlText _ShoutText_Text3;
	ZKB_RadioTextMsg_4 = ctrlText _ShoutText_Text4;
	
	ZKB_RadioTextBroadcast_1 = _ShoutText_ChatOption1 lbData (lbCurSel _ShoutText_ChatOption1);								
	ZKB_RadioTextBroadcast_2 = _ShoutText_ChatOption2 lbData (lbCurSel _ShoutText_ChatOption2);												
	ZKB_RadioTextBroadcast_3 = _ShoutText_ChatOption3 lbData (lbCurSel _ShoutText_ChatOption3);	
	ZKB_RadioTextBroadcast_4 = _ShoutText_ChatOption4 lbData (lbCurSel _ShoutText_ChatOption4);	
	};