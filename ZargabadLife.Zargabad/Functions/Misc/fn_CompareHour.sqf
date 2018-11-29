/*

	File: fn_CompareHour.sqf
	Function: ZKB_fnc_CompareHour
	Author: ZKB1325
	Description: Checks if the given year, month, day, and hour is current or passed
	
	0: Array
		Start date array [Year,Month,Day,Hour]
		Default: date
		
	1: Array
		Date to compare the start date to, see if the start date is pass this date. [Year,Month,Day,Hour]
		Default: date

*/

private _checkDate = param [0,date,[[]]];
private _compairDate = param [1,date,[[]]];
private _checkYear = _checkDate select 0;
private _checkMonth = _checkDate select 1;
private _checkDay = _checkDate select 2;
private _checkHour = _checkDate select 3;

private _compairYear = _compairDate select 0;
private _compairMonth = _compairDate select 1;
private _compairDay = _compairDate select 2;
private _compairHour = _compairDate select 3;

private _hourCheck = if (_checkDay > _compairDay) then
	{
	true;
	}
	else
	{
	if (_checkMonth > _compairMonth) then
		{
		true;
		}
		else
		{
		if (_checkYear > _compairYear) then
			{
			true;
			}
			else
			{
			(_checkHour >= _compairHour);
			};
		};
	};

(([[_checkYear,_checkMonth,_checkDay],[_compairYear,_compairMonth,_compairDay]] call ZKB_fnc_CompareDay) and _hourCheck);