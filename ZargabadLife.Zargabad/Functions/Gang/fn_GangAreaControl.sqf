/*
	Author: ZKB1325
	File: fn_GangAreaControl.sqf
	Function: ZKB_fnc_GangAreaControl
	Description: Handles both the neutralising and capturing of gang areas
	this addAction [localize "STR_Gang_NeutraliseGangArea", ZKB_fnc_GangAreaControl, "Neutralise", 1, true, true, "", "!((_target getVariable [""GangControl"",""""]) == ([player] call ZKB_fnc_GetGangName)) and ([player] call ZKB_fnc_IsGangMember) and ((_target getVariable [""NeutralPoints"",0]) > 0) and !ZKB_PerformingAction", 7];
	this addAction [localize "STR_Gang_CaptureGangArea", ZKB_fnc_GangAreaControl, "Capture", 1, true, true, "", "((_target getVariable [""GangControl"",""""]) == """") and ([player] call ZKB_fnc_IsGangMember) and ((_target getVariable [""NeutralPoints"",0]) <= 0) and !ZKB_PerformingAction", 7];
*/
private ["_flag"];
_flag = _this select 0;
_action = _this select 3;

ZKB_PerformingAction = true;
if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
	{
	[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["ZKB_fnc_AnimSync",0];
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

sleep 5;

switch _action do
	{	
	case "Neutralise":
		{
		private _neutralPoints = _flag getVariable ["NeutralPoints",0];
		_neutralPoints = ((_neutralPoints - .25) max 0);
		_flag setVariable ["NeutralPoints",_neutralPoints,true];
		_flag setFlagAnimationPhase _neutralPoints;
		if (_neutralPoints <= 0) then
			{
			format [localize "STR_Gang_GangAreaNeutralised", _flag getVariable ["GangAreaName","Gang Area"], ([player] call ZKB_fnc_GetGangName)] remoteExec ["Hint",0];
			_flag setVariable ["GangControl","",true];
			["STR_Admin_PlayerLogsNeutralisedGangArea",name player,[player] call ZKB_fnc_GetGangName,_flag getVariable ["GangAreaName","Gang Area"]] call ZKB_fnc_AdminAddPlayerLog;
			};
		};
		
	case "Capture":
		{
		format [localize "STR_Gang_GangAreaCaptured", _flag getVariable ["GangAreaName","Gang Area"], ([player] call ZKB_fnc_GetGangName)] remoteExec ["Hint",0];
		_flag setVariable ["GangControl",([player] call ZKB_fnc_GetGangName),true];
		_flag setVariable ["NeutralPoints",1,true];
		_flag setFlagAnimationPhase 1;
		["STR_Admin_PlayerLogsCapturedGangArea",name player,[player] call ZKB_fnc_GetGangName,_flag getVariable ["GangAreaName","Gang Area"]] call ZKB_fnc_AdminAddPlayerLog;
		};
	};
	
ZKB_PerformingAction = false;
