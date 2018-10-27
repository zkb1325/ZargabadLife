/*
	Author: Copied from original Arma 2 Zargabad Life mission
	File: fn_SetUpRadioTriggers.sqf
	Function: ZKB_fnc_SetUpRadioTriggers
	Description: Sets up the radio triggers for text broadcasting
	
*/

RadioTrigger_1 = createTrigger      ["EmptyDetector", [0,0,0]];
RadioTrigger_1 setTriggerArea       [0, 0, 0, false];
RadioTrigger_1 setTriggerActivation ["ALPHA", "NOT PRESENT", true];
RadioTrigger_1 setTriggerStatements ["this", "createDialog ""ZKB_MainMenu"";", ""];
1 setRadioMsg localize "STR_MainMenu_MainMenu";


RadioTrigger_6 = createTrigger      ["EmptyDetector", [0,0,0]];
RadioTrigger_6 setTriggerArea       [0, 0, 0, false];
RadioTrigger_6 setTriggerActivation ["FOXTROT", "NOT PRESENT", true];
RadioTrigger_6 setTriggerStatements ["this", "[ZKB_RadioTextMsg_1, ZKB_RadioTextBroadcast_1, player] remoteExec [""ZKB_fnc_SayRadioText"", playableUnits, false];", ""];
6 setRadioMsg "Say Text 1";
RadioTrigger_7 = createTrigger      ["EmptyDetector", [0,0,0]];
RadioTrigger_7 setTriggerArea       [0, 0, 0, false];
RadioTrigger_7 setTriggerActivation ["GOLF", "NOT PRESENT", true];
RadioTrigger_7 setTriggerStatements ["this", "[ZKB_RadioTextMsg_2, ZKB_RadioTextBroadcast_2, player] remoteExec [""ZKB_fnc_SayRadioText"", playableUnits, false];", ""];
7 setRadioMsg "Say Text 2";
RadioTrigger_8 = createTrigger      ["EmptyDetector", [0,0,0]];
RadioTrigger_8 setTriggerArea       [0, 0, 0, false];
RadioTrigger_8 setTriggerActivation ["HOTEL", "NOT PRESENT", true];
RadioTrigger_8 setTriggerStatements ["this", "[ZKB_RadioTextMsg_3, ZKB_RadioTextBroadcast_3, player] remoteExec [""ZKB_fnc_SayRadioText"", playableUnits, false];", ""];
8 setRadioMsg "Say Text 3";
RadioTrigger_9 = createTrigger      ["EmptyDetector", [0,0,0]];
RadioTrigger_9 setTriggerArea       [0, 0, 0, false];
RadioTrigger_9 setTriggerActivation ["INDIA", "NOT PRESENT", true];
RadioTrigger_9 setTriggerStatements ["this", "[ZKB_RadioTextMsg_4, ZKB_RadioTextBroadcast_4, player] remoteExec [""ZKB_fnc_SayRadioText"", playableUnits, false];", ""];
9 setRadioMsg "Say Text 4";