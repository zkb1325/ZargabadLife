/*

	Author: ZKB1325
	File: fn_LSD.sqf
	Function: ZKB_fnc_LSD
	Description: Effect the happens when the player uses LSD
	
[
ShapeName, 
AnimationName, 
Type, 
TimerPeriod, 
LifeTime, 
Position, 
MoveVelocity, 
RotationVelocity, 
Weight, 
Volume, 
Rubbing, 
Size, 
Color, 
AnimationPhase, 
RandomDirectionPeriod, 
RandomDirectionIntensity, 
OnTimer, 
BeforeDestroy, 
Object, 
Angle, 
OnSurface, 
BounceOnSurface, 
EmissiveColor
]

["\CUP\terrains\CUP_Terrains_Plants\banana.p3d", 8, 3, 1], 
"SpaceObject",

for "_i" from 1 to 10000 do 
	{
	drop [
	["\Ca\Data\ParticleEffects\Pstone\Pstone.p3d", 8, 3, 1],   
	"",   
	"SpaceObject",   
	1,   
	20,   
	[(random 1000) - (random 1000),(random 1000) - (random 1000),(random 550) + 25],   
	[0,0,0],   
	.1,   
	50,   
	1,   
	.01,   
	[2+(random 10),2+(random 10)],   
	[[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]],   
	[0,1],   
	0,   
	0,   
	"",   
	"",   
	player,  
	0,  
	false,  
	1  
	]
	};

//Falling bouncing rocks
[ 
["\Ca\Data\ParticleEffects\Pstone\Pstone.p3d", 8, 3, 1],  
"",  
"SpaceObject",  
1,  
20,  
[(random 200) - (random 200),(random 200) - (random 200),(random 50) + 25],  
[0,0,0],  
.1,  
50,  
1,  
.01,  
[2+(random 10),2+(random 10)],  
[[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]],  
[0,1],  
0,  
0,  
"",  
"",  
player, 
0, 
false, 
1 
]
*/
private _item = param [1,""];
[_item, 1] call ZKB_fnc_InvRemoveItem;

if ((player getVariable ["lsdInSystem",0]) > 0) exitWith
	{
	player setVariable ["lsdInSystem",(player getVariable ["lsdInSystem",0])+1];
	["STR_ItemMisc_TakenMoreDrugs"] call ZKB_fnc_DynamicText;
	};
player setVariable ["lsdInSystem",(player getVariable ["lsdInSystem",0])+1];	
private _effectDuration = 180;
private _effectTime = serverTime;

while {(_effectTime + (_effectDuration*(player getVariable ["lsdInSystem",0]))) > serverTime} do 
	{
	if !(alive player) exitWith {};
	
	"wetDistortion" ppEffectEnable true;
	"wetDistortion" ppEffectAdjust [0.5, 1, 1, 4.1, 3.7, 2.5, 1.85, 0.0051, 0.0051, 0.0051, 0.0051, 0.5, 0.3, 10, 6.0];
	"wetDistortion" ppEffectCommit 5;
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [0.2,0.2,true]; 
	"chromAberration" ppEffectCommit 1;

	private _f1 = random 1;
	private _f2 = random 1;
	private _f3 = random 1;
		
	Drop [
		"\ca\data\cl_basic", 
		"", 
		"Billboard", 
		1, 
		20, //Duration/Life Time
		[(random 200) - (random 200),(random 200) - (random 200),(random 15) + 5],  //Position relative to player
		[random 0.05, random 0.05, 0.1 - random 0.075], //Movement velocity
		1, //Rotation velocity
		1.275, //Weight
		1, //Volume
		0, //Gravity effect 0 = vacuum
		[random 5, random 10, random 5], //Size
		[[_f1, _f2, _f3, 1],[_f2, _f1, _f3, 1],[_f3, _f2, _f1, 1]], //Color No idea why 3 arrays
		[0, 0, 0], 
		3, 
		0.2, 
		"", 
		"", 
		player];
		
	if ((player getVariable ["lsdInSystem",0]) > 2) then
		{
		drop [ 
			["\CUP\terrains\CUP_Terrains_Plants\banana.p3d", 8, 3, 1],  //Change to ["\Ca\Data\ParticleEffects\Pstone\Pstone.p3d", 8, 3, 1] if CUP is removed because bananas are cup only
			"",  
			"SpaceObject",  
			1,  
			10,  //Duration/Life Time
			[(random 200) - (random 200),(random 200) - (random 200),(random 50) + 25],  //Position relative to player
			[0,0,0],  //Movement velocity
			.1,  //Rotation velocity
			50,  //Weight
			1,  //Valume
			.01,  //Gravity effect 0 = vacuum
			[2+(random 8),2+(random 8)],  //Size
			[[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]],  
			[0,1],  
			0,  
			0,  
			"",  
			"",  
			player, 
			0, 
			false, 
			1 
			]
		};
		
	sleep 0.01;	
	};

player setVariable ["lsdInSystem",0];
["STR_ItemMisc_DrugEffectDiminish"] call ZKB_fnc_DynamicText;
	
"wetDistortion" ppEffectEnable false;
"chromAberration" ppEffectEnable false;