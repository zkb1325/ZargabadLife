/*

	File: fn_CompareMonth.sqf
	Function: ZKB_fnc_CompareMonth
	Author: ZKB1325
	Description: Checks if the given year and month is current or passed
	
	0: Array
		Start date array [Year,Month]
		Default: date
		
	1: Array
		Date to compare the start date to, see if the start date is pass this date. [Year,Month]
		Default: date

*/

private _checkDate = param [0,date,[[]]];
private _compairDate = param [1,date,[[]]];
private _checkYear = _checkDate select 0;
private _checkMonth = _checkDate select 1;

private _compairYear = _compairDate select 0;
private _compairMonth = _compairDate select 1;

private _monthCheck = if (_checkYear > _compairYear) then
	{
	true;
	}
	else
	{
	(_checkMonth >= _compairMonth);
	};



(([[_checkYear],[_compairYear]] call ZKB_fnc_CompareYear) and _monthCheck);