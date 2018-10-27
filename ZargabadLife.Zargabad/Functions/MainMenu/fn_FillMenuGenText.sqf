/*
	Author: ZKB1325
	File: fn_FillMenuGenText.sqf
	Function: ZKB_fnc_FillMenuGenText
	Description: Opens up and fills in text for the ZKB_GenTextBox, Used for Tutorial, FAQ, and About buttons of the main menu
*/


private ["_type","_display","_frame","_textbox","_btn"];
disableserialization;
createDialog "ZKB_GenTextBox";
_text = param [0,"",[""]];
_frametext = param [1,"Info",[""]];


_display = uiNamespace getVariable "ZKB_GenTextBox";
_frame = (_display displayCTRL 1502);
_textbox = (_display displayCTRL 1510);
_btn = (_display displayCTRL 1520);

_frame ctrlSetText _frametext;
_textbox ctrlSetStructuredText parseText _text;

_textbox ctrlSetPosition [(ctrlPosition _textbox) select 0, (ctrlPosition _textbox) select 1, (ctrlPosition _textbox) select 2, ctrlTextHeight _textbox];
_textbox ctrlCommit 0;

_btn ctrlSetText localize "STR_Common_Back";
_btn buttonSetAction "closeDialog 0; createDialog ""ZKB_MainMenu"";";