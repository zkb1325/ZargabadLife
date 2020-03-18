class Admin_PlayerInfo_BG: IGUIBack
{
	idc = 50060;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.72 * safezoneH;
};
class Admin_PlayerInfo_Frame: ZKB_RscFrame
{
	idc = 50061;
	text = "";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.2 * safezoneW;
	h = 0.72 * safezoneH;
};
class Admin_PlayerInfo_InfoCtrlGroup: ZKB_RscControlsGroup
		{
		idc = 50062;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.68 * safezoneH;
		class controls
			{
			class Admin_PlayerInfo_Info: ZKB_RscStructuredText
			{
				idc = 50063;
				x = 0;
				y = 0;
				w = 0.175 * safezoneW;
				h = 0.68 * safezoneH;
			};
			};
		};
class Admin_PlayerInfo_BG2: IGUIBack
{
	idc = 50064;
	x = 0.525 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.72 * safezoneH;
};
class Admin_PlayerInfo_Frame2: ZKB_RscFrame
{
	idc = 50065;
	text = "";
	x = 0.525 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.425 * safezoneW;
	h = 0.72 * safezoneH;
};
class Admin_PlayerInfo_LogsCtrlGroup: ZKB_RscControlsGroup
		{
		idc = 50066;
		x = 0.5375 * safezoneW + safezoneX;
				y = 0.1 * safezoneH + safezoneY;
				w = 0.4 * safezoneW;
				h = 0.68 * safezoneH;
		class controls
			{
			class Admin_PlayerInfo_Logs: ZKB_RscStructuredText
			{
				idc = 50067;
				x = 0;
				y = 0;
				w = 0.4 * safezoneW;
				h = 0.68 * safezoneH;
			};
			};
		};
