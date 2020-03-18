/*
	File: fn_SkipBriefing.sqf
	Function: ZKB_fnc_SkipBriefing
	Author: KillZoneKid
	Description: Forces the client to skip the briefing screen
*/

if (hasInterface) then 
	{
    0 = [] spawn 
		{
        waitUntil {
            if (getClientState == "BRIEFING READ") exitWith {true};
            if (!isNull findDisplay (getNumber (configfile >> "RscDisplayServerGetReady" >> "idd"))) exitWith 
				{
                ctrlActivate (findDisplay (getNumber (configfile >> "RscDisplayServerGetReady" >> "idd")) displayCtrl 1);
                true
				};
            false
			};
		};
	};