/*

	File: fn_CompareYear.sqf
	Function: ZKB_fnc_CompareYear
	Author: ZKB1325
	Description: Checks if the given year is current or passed
	
	0: Array
		Start date array [Year]
		Default: date
		
	1: Array
		Date to compare the start date to, see if the start date is pass this date. [Year]
		Default: date

*/

private _checkDate = param [0,date,[[]]];
private _compairDate = param [1,date,[[]]];
private _checkYear = _checkDate select 0;

private _compairYear = _compairDate select 0;

(_checkYear >= _compairYear);