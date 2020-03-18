class Admin_PlayerLogs_BG: IGUIBack
{
	idc = 50050;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.625 * safezoneW;
	h = 0.84 * safezoneH;
};
class Admin_PlayerLogs_Frame: ZKB_RscFrame
{
	idc = 50051;
	text = "$STR_Admin_PlayerLogs";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.625 * safezoneW;
	h = 0.84 * safezoneH;
};
class Admin_PlayerLogs_LogsCtrlGroup: ZKB_RscControlsGroup
		{
		idc = 50052;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.6 * safezoneW;
		h = 0.8 * safezoneH;
		class controls
			{
			class Admin_PlayerLogs_Logs: ZKB_RscStructuredText
			{
				idc = 50053;
				text = "";
				x = 0;
				y = 0;
				w = 0.6 * safezoneW;
				h = 0.8 * safezoneH;
			};
			};
		};

