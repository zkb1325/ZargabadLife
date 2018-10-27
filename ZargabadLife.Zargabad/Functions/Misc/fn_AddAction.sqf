/*
	Author: ZKB1325
	FileName: fn_AddAction.sqf
	Function: ZKB_fnc_AddAction
	
	Description: A function that just adds actions to objects if passed condition is met. Meant to be remoteExecuted because remoteExecuting addAction on its own is not JIP reliable if target is civilian
	There is no error checking in this function so make sure you are using it right
	Array of arrays for actions [["Condition",object,[action array]],...]
	
	0: Array
		The array of arrays for the addAction as explained above
		
		0: String
			String of the condition to add the action, must at least be "True" to add the action
		1: Object
			Object to add the action to
		2: Array
			Action array
*/
{
if (call compile (_x select 0)) then
	{
	(_x select 1) addAction (_x select 2);
	};
}forEach _this;