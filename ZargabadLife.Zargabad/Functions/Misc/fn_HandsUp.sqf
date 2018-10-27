/*
    File: fn_HandsUp.sqf
	Function: ZKB_fnc_HandsUp
    Author: ZKB1325

    Description:
	Puts hands up for surrendering
*/

if (player getVariable ["surrendering",false]) then 
	{
    player setVariable ["surrendering",false,true];
	} 
	else 
	{
    player setVariable ["surrendering",true,true];
	};

while {player getVariable ["surrendering",false]} do 
	{
    player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    if (!alive player || (vehicle player) != player) then 
		{ 
		player setVariable ["surrendering",false,true]; 
		};
	};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
