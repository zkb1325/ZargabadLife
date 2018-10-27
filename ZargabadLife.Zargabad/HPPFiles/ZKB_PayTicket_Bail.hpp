class ZKB_PayTicket_Bail
{
idd = 20000;														
name = "ZKB_PayTicket_Bail";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_PayTicket_Bail', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_PayTicket_Bail', displayNull]";

class controls
	{
	class PayTicket_Bail_BG: IGUIBack
	{
		idc = 20001;
		x = 0.2925 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.32 * safezoneH;
	};
	class PayTicket_Bail_Header: RscStructuredText
	{
		idc = 20010;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.42 * safezoneH + safezoneY;
		w = 0.3625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class PayTicket_Bail_YesBtn: RscButton
	{
		idc = 20020;
		text = "Pay Bail"; //--- ToDo: Localize;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.47 * safezoneH + safezoneY;
		w = 0.1775 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	class PayTicket_Bail_NoBtn: RscButton
	{
		idc = 20030;
		text = "Cancel"; //--- ToDo: Localize;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.47 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0;";
	};
	};
};