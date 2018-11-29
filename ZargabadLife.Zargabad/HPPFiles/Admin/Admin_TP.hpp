
	class Admin_TP_BG: IGUIBack
	{
		idc = 50010;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.08 * safezoneH + safezoneY;
		w = 0.175 * safezoneW;
		h = 0.32 * safezoneH;
	};
	class Admin_TP_IncludeVeh: RscCheckbox
	{
		idc = 50011;
		x = 0.325 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Admin_TP_IncludeVehText: RscStructuredText
	{
		idc = 50012;
		text = "$STR_Admin_TeleportIncludeVeh";
		x = 0.35 * safezoneW + safezoneX;
		y = 0.1 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Admin_TP_TpToBtn: RscButton
	{
		idc = 50013;
		text = "$STR_Admin_TeleportTo";
		action = "[lbData [50002,lbCurSel 50002],cbChecked ((findDisplay 50000) displayCtrl 50011)] call ZKB_fnc_AdminTPTo;";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.125 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Admin_TP_TpHere: RscButton
	{
		idc = 50014;
		text = "$STR_Admin_TeleportHere";
		action = "[lbData [50002,lbCurSel 50002],cbChecked ((findDisplay 50000) displayCtrl 50011)] call ZKB_fnc_AdminTPHere;";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.22 * safezoneH + safezoneY;
		w = 0.125 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Admin_TP_TpBack: RscButton
	{
		idc = 50015;
		text = "$STR_Admin_TeleportBack";
		action = "[lbData [50002,lbCurSel 50002]] call ZKB_fnc_AdminTPBack";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.125 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class Admin_TP_MapTp: RscButton
	{
		idc = 50016;
		text = "$STR_Admin_TeleportMap";
		action = "[] call ZKB_fnc_AdminTPMap";
		x = 0.325 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.125 * safezoneW;
		h = 0.04 * safezoneH;
	};