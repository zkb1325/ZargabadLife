class ZKB_CopToCivMenu
{
idd = 14000;														
name = "ZKB_CopToCivMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_CopToCivMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_CopToCivMenu', displayNull]";

class controls
	{

	class CopToCivMenu_BG: IGUIBack
	{
		idc = 14001;
		x = 0.4 * safezoneW + safezoneX;
		y = 0.25 * safezoneH + safezoneY;
		w = 0.22 * safezoneW;
		h = 0.65 * safezoneH;
	};
	class CopToCivMenu_Frame: RscFrame
	{
		idc = 14002;
		x = 0.4 * safezoneW + safezoneX;
		y = 0.25 * safezoneH + safezoneY;
		w = 0.22 * safezoneW;
		h = 0.65 * safezoneH;
	};
	class CopToCivMenu_DisarmBtn: RscButton
	{
		idc = 14010;
		text = "$STR_Cop_Disarm";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[ZKB_CopInteractionTarget] call ZKB_fnc_Disarm;";
	};
	class CopToCivMenu_DrugSearch: RscButton
	{
		idc = 14020;
		text = "$STR_Cop_Search";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.33 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[ZKB_CopInteractionTarget] call ZKB_fnc_SearchPlayer;";
	};
	class CopToCivMenu_ArrestTimeTxt: RscText
	{
		idc = 14030;
		text = "$STR_Cop_ArrestTime";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class CopToCivMenu_ArrestTimeSlider: RscSlider
	{
		idc = 14040;
		onSliderPosChanged = "ctrlSetText [14030, format [localize ""STR_Cop_ArrestTime"",round (_this select 1)]];";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.43 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class CopToCivMenu_ArrestBtn: RscButton
	{
		idc = 14050;
		text = "$STR_Cop_Arrest";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.48 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[ZKB_CopInteractionTarget,round (sliderPosition 14040)] call ZKB_fnc_ArrestPlayer;";
	};
	class CopToCivMenu_RestrainBtn: RscButton
	{
		idc = 14060;
		text = "$STR_Cop_RestarainRelease";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.53 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[ZKB_CopInteractionTarget] call ZKB_fnc_RestrainPlayer;";
	};
	class CopToCivMenu_TicketAmount: RscEdit
	{
		idc = 14070;
		text = "0";
		onChar = "_this spawn ZKB_fnc_CheckCharNum;";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class CopToCivMenu_TicketBtn: RscButton
	{
		idc = 14080;
		text = "$STR_Cop_GiveTicket";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.63 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[ZKB_CopInteractionTarget,round (parseNumber (ctrlText 14070))] call ZKB_fnc_GiveTicket;";
	};
	class CopToCivMenu_HealBtn: RscButton
	{
		idc = 14090;
		text = "$STR_Cop_Heal";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.68 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[ZKB_CopInteractionTarget] call ZKB_fnc_HealPlayer;";
	};
	class CopToCivMenu_InvCheck: RscButton
	{
		idc = 14100;
		text = "$STR_Cop_CheckInventory";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.73 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[ZKB_CopInteractionTarget] call ZKB_fnc_CheckInventory";
	};
	class CopToCivMenu_Cancel: RscButton
	{
		idc = 14110;
		text = "Cancel"; //--- ToDo: Localize;
		x = 0.41 * safezoneW + safezoneX;
		y = 0.78 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	};
};
