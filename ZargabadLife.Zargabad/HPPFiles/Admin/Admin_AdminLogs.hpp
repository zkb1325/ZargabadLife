class Admin_AdminLogs_BG: IGUIBack
{
	idc = 50040;
	x = 0.3 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.625 * safezoneW;
	h = 0.84 * safezoneH;
};
class Admin_AdminLogs_Frame: RscFrame
{
	idc = 50041;
	text = "$STR_Admin_AdminLogs";
	x = 0.3 * safezoneW + safezoneX;
	y = 0.08 * safezoneH + safezoneY;
	w = 0.625 * safezoneW;
	h = 0.84 * safezoneH;
};
class Admin_AdminLogs_LogsCtrlGroup: RscControlsGroup
		{
		idc = 50042;
		x = 0.3125 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.6 * safezoneW;
		h = 0.8 * safezoneH;
		class controls
			{
			class Admin_AdminLogs_Logs: RscStructuredText
			{
				idc = 50043;
				text = "";
				x = 0;
				y = 0;
				w = 0.6 * safezoneW;
				h = 0.8 * safezoneH;
			};
			};
		};

