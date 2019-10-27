class HudTags
{
idd = 30000;
duration = 999999;
fadein = 1;
fadeout = 1;
name = "HudTags";
onLoad = "uiNamespace setVariable ['HudTags', _this select 0]";
onUnload = "uiNamespace setVariable ['HudTags', displayNull]";

class controls	
{
	class HudTags_Tag: ZKB_RscStructuredText
	{
		idc = 30001;
		text = "Hud Tag";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.55 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.05 * safezoneH;
		class Attributes
			{
			align = "center";
			};
	};	
	
	class HudTags_Interaction: ZKB_RscStructuredText
	{
		idc = 30002;
		text = "Hud Tag";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.6 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.05 * safezoneH;
		class Attributes
			{
			align = "center";
			};
	};
};
};
