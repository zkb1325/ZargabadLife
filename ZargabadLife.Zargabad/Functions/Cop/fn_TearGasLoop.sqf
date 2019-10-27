/*
    File: fn_TearGasLoop.sqf
	Function: ZKB_fnc_TearGasLoop
    Author: ZKB1325

    Description:
	Tear gas loop for imparing vision while near tear gas
*/
if (playerSide isEqualTo west) exitWith {};
"dynamicBlur" ppEffectEnable true;
While {true} do
	{
	"dynamicBlur" ppEffectAdjust [0];  
	"dynamicBlur" ppEffectCommit 10; 
	
	waituntil{_nearGas = ((player nearObjects ["SmokeShellYellow",10]) + (player nearObjects ["G_40mm_SmokeYellow",10])); count _nearGas > 0 and ({speed _x <= 1}count _nearGas) > 0};

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [20];   
	"dynamicBlur" ppEffectCommit 0;
	sleep 5;
	};
