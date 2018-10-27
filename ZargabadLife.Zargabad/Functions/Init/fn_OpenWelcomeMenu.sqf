/*
	Author: ZKB1325
	FileName: fn_OpenWelcomeMenu.sqf
	Function: ZKB_fnc_OpenWelcomeMenu
	
	Description: Displays the welcome menu
*/

if (dialog) exitWith {closeDialog 0;};
private _welcomeMessage = "";

{
_welcomeMessage = _welcomeMessage + _x;
}forEach ZKB_IntroMessage;

disableSerialization;
createDialog "ZKB_GenTextBox";
private _display = uiNamespace getVariable "ZKB_GenTextBox";
private _textBoxCtrl = _display displayCtrl 1510;
private _frameCtrl = _display displayCtrl 1502;
_frameCtrl ctrlSetText "Welcome to Zargabad";
_textBoxCtrl ctrlSetStructuredText parseText _welcomeMessage;

_textBoxCtrl ctrlSetPosition [(ctrlPosition _textBoxCtrl) select 0, (ctrlPosition _textBoxCtrl) select 1, (ctrlPosition _textBoxCtrl) select 2, ctrlTextHeight _textBoxCtrl];
_textBoxCtrl ctrlCommit 0;