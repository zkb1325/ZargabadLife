/*

	Author: ZKB1325
	File: fn_Marijuana.sqf
	Function: ZKB_fnc_Marijuana
	Description: Effect the happens when the player uses Marijuana
	
*/
private _item = param [1,""];
[_item, 1] call ZKB_fnc_InvRemoveItem;

if ((player getVariable ["weedInSystem",0]) > 0) exitWith
	{
	player setVariable ["weedInSystem",(player getVariable ["weedInSystem",0])+1];
	["STR_ItemMisc_TakenMoreDrugs"] call ZKB_fnc_DynamicText;
	};
player setVariable ["weedInSystem",(player getVariable ["weedInSystem",0])+1];	
private _effectDuration = 180;
private _effectTime = serverTime;
player setCustomAimCoef 0;

private _smokeGrenade = "SmokeShellGreen" createVehicle position player;

[_effectTime,_effectDuration] spawn
	{
	private _effectTime = (_this select 0);
	private _effectDuration = (_this select 1);
	private _curEffects = [];
	
	while {(_effectTime + (_effectDuration*(player getVariable ["weedInSystem",0]))) > serverTime} do 
		{
		if !(alive player) exitWith {};
				
		if ((player getVariable ["weedInSystem",0]) > 2 and ((count (missionNamespace getVariable ["weedPS",[]])) < (10*(player getVariable ["weedInSystem",0])))) then
			{
				
			_PS = "#particlesource" createVehicleLocal getpos player;
			_ps setParticleCircle [0, [0, 0, 0]];
			_ps setParticleRandom [0, [0.5, 0.5, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
			_ps setParticleParams [
						["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 1, 6], 
						"", 
						"Billboard", 
						1, 
						30, 
						[(random 300) - (random 300),(random 300) - (random 300),0], 
						[0, 0, 4.5], 
						0, 
						10, 
						7.9, 
						0.5, 
						[4, 12, 20],  
						[[1, 0, 0, 0.8], [0, 1, 0, 0.5], [0, 0, 1, 0]], 
						[0.125], 
						1, 
						0, 
						"", 
						"", 
						""
						];
			_ps setDropInterval 0.1;
			_curEffects = missionNamespace getVariable ["weedPS",[]];
			_curEffects pushBack _PS;
			missionNamespace setVariable ["weedPS",_curEffects];
			
			[_PS] spawn
				{
				sleep 5;
				_PS = (_this select 0);
				private _curEffects = missionNamespace getVariable ["weedPS",[]];
				_curEffects = _curEffects - [_PS];
				missionNamespace setVariable ["weedPS",_curEffects];
				deleteVehicle _PS;
				};

			};
			
		sleep .2;	
		};
	};

while {(_effectTime + (_effectDuration*(player getVariable ["weedInSystem",0]))) > serverTime} do 
	{
	if !(alive player) exitWith {};
	
	if (isNull _smokeGrenade) then
		{
		_smokeGrenade = "SmokeShellGreen" createVehicle position player;
		};
		
	if (vehicle player isEqualTo player) then
		{
		_smokeGrenade attachTo [player,[0,0,0]];
		}
		else
		{
		_smokeGrenade attachTo [vehicle player,[0,0,0]];
		};
		
		
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 1,random 1,random 1,random 1], [random 1,random 1,random 1, random 1]];  
	"colorCorrections" ppEffectCommit 1;	
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [(random 1) - (random 1),(random 1) - (random 1),true]; 
	"chromAberration" ppEffectCommit 1;	
		
	sleep 3;	
	};
player setCustomAimCoef 1;
player setVariable ["weedInSystem",0];
["STR_ItemMisc_DrugEffectDiminish"] call ZKB_fnc_DynamicText;

"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1], [0.299, 0.587, 0.114, 0]]; 
"colorCorrections" ppEffectCommit 10;
waitUntil {ppEffectCommitted "colorCorrections"}; 
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
