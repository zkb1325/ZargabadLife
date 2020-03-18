class ZKB_SpeedBomb
{
idd = 10000;														
name = "ZKB_SpeedBomb";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_SpeedBomb', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_SpeedBomb', displayNull]";

class controls
	{

	class SpeedBomb_BG: IGUIBack
	{
		idc = 10001;
		x = 0.175 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.65 * safezoneW;
		h = 0.2 * safezoneH;
	};
	class SpeedBomb_Frame: ZKB_RscFrame
	{
		idc = 10002;
		x = 0.175 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.65 * safezoneW;
		h = 0.2 * safezoneH;
	};
	class SpeedBomb_StartSpeed: ZKB_RscSlider
	{
		idc = 10010;
		onSliderPosChanged = "((uiNameSpace getVariable ""ZKB_SpeedBomb"") displayCTRL 10020) ctrlSetText format [localize ""STR_ItemMisc_SpeedBombStartSpeed"", round (_this select 1)];";
		x = 0.2 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class SpeedBomb_StartSpeedInfo: ZKB_RscStructuredText
	{
		idc = 10020;
		text = "";
		x = 0.525 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class SpeedBomb_MinSpeed: ZKB_RscSlider
	{
		idc = 10030;
		onSliderPosChanged = "((uiNameSpace getVariable ""ZKB_SpeedBomb"") displayCTRL 10040) ctrlSetText format [localize ""STR_ItemMisc_SpeedBombMinSpeed"", round (_this select 1)];";
		x = 0.2 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.325 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {1,-1,-1,0.25};
	};
	class SpeedBomb_MinSpeedInfo: ZKB_RscStructuredText
	{
		idc = 10040;
		text = "";
		x = 0.525 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class SpeedBomb_Plant: ZKB_RscButton
	{
		idc = 10050;
		text = "Plant"; //--- ToDo: Localize;
		action = "[""Plant"", ""SpeedBomb"", (vehicle player)] spawn ZKB_fnc_SpeedBomb;";
		x = 0.6375 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.14 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class SpeedBomb_Cancel: ZKB_RscButton
	{
		idc = 10060;
		text = "Cancel"; //--- ToDo: Localize;
		x = 0.6375 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.1375 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	};
};
