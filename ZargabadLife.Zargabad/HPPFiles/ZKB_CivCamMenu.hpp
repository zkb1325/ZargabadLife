class ZKB_CivCamMenu
{
idd = 24000;														
name = "ZKB_CivCamMenu";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_CivCamMenu', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_CivCamMenu', displayNull]";

class controls
	{

	class CivCamMenu_BG: IGUIBack
	{
		idc = 24001;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.38 * safezoneW;
		h = 0.24 * safezoneH;
	};
	class DynamicButtonMenu_Frame: ZKB_RscFrame
	{
		idc = 24002;
		text = "$STR_Cop_CivcamMenu";
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.24 * safezoneH + safezoneY;
		w = 0.38 * safezoneW;
		h = 0.24 * safezoneH;
	};
	class CivCamMenu_CivSelectTxt: ZKB_RscStructuredText
	{
		idc = 24010;
		text = "$STR_Cop_CivcamMenuSelectCiv";
		x = 0.3375 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.1625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class CivCamMenu_CivSelectList: ZKB_RscCombo
	{
		idc = 24020;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.26 * safezoneH + safezoneY;
		w = 0.17 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class CivCamMenu_WatchLenghtSlider: ZKB_RscSlider
	{
		idc = 24030;
		x = 0.33 * safezoneW + safezoneX;
		y = 0.31 * safezoneH + safezoneY;
		w = 0.35 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class CivCamMenu_DurationTxt: ZKB_RscStructuredText
	{
		idc = 24040;
		text = "$STR_Cop_CivcamMenuDuration";
		x = 0.3375 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class CivCamMenu_CostTxt: ZKB_RscStructuredText
	{
		idc = 24050;
		text = "$STR_Cop_CivcamMenuCost";
		x = 0.525 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class CivCamMenu_WatchBtn: ZKB_RscButton
	{
		idc = 24060;
		text = "$STR_Cop_CivcamMenuWatch";
		x = 0.41 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.17 * safezoneW;
		h = 0.04 * safezoneH;
		action = "[lbData [24020,lbCurSel 24020],round (sliderPosition 24030)] spawn ZKB_fnc_WatchCiv";
	};
	};
};
