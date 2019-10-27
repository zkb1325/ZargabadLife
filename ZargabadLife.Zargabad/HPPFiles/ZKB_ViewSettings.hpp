class ZKB_ViewSettings
{
idd = 26000;														
name = "ZKB_ViewSettings";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_ViewSettings', _this select 0]; ((_this select 0) displayCtrl 26070) cbSetChecked ZKB_EnableDynamicText;";
onUnload = "uiNamespace setVariable ['ZKB_ViewSettings', displayNull]";

class controls
	{

	class ViewSettings_BG: IGUIBack
	{
		idc = 26001;
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class ViewSettings_Frame: ZKB_RscFrame
	{
		idc = 26002;
		text = "$STR_MainMenu_Settings";
		x = 0.3875 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.4 * safezoneH;
	};
	class ViewSettings_ViewDistanceHeader: ZKB_RscStructuredText
	{
		idc = 26010;
		text = "$STR_MainMenu_ViewDistance";
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
		{
		align = "center";
		};
	};
	class ViewSettings_ViewDistanceDownBtn: ZKB_RscButton
	{
		idc = 26020;
		text = "-100";
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.07 * safezoneW;
		h = 0.04 * safezoneH;
		action = "if (viewDistance > 200) then {setViewDistance (viewDistance - 100); player groupChat format[localize 'STR_MainMenu_ViewDistanceChat', viewDistance]; uiNamespace setVariable ['ZKB_ViewDistance',viewDistance];};";
	};
	class ViewSettings_ViewDistanceUpBtn: ZKB_RscButton
	{
		idc = 26030;
		text = "+100";
		x = 0.4875 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.07 * safezoneW;
		h = 0.04 * safezoneH;
		action = "if (viewDistance < 10000) then {setViewDistance (viewDistance + 100); player groupChat format[localize 'STR_MainMenu_ViewDistanceChat', viewDistance]; uiNamespace setVariable ['ZKB_ViewDistance',viewDistance];};";
	};
	class ViewSettings_TerrainHeader: ZKB_RscStructuredText
	{
		idc = 26040;
		text = "$STR_MainMenu_TerrainSettings";
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.46 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		class Attributes
		{
		align = "center";
		};
	};
	class ViewSettings_TerrainDownBtn: ZKB_RscButton
	{
		idc = 26050;
		text = "-";
		x = 0.425 * safezoneW + safezoneX;
		y = 0.52 * safezoneH + safezoneY;
		w = 0.03 * safezoneW;
		h = 0.04 * safezoneH;
		action = "if (ZKB_TerrainGridSelection > 0) then {ZKB_TerrainGridSelection = ZKB_TerrainGridSelection - 1; setTerrainGrid(ZKB_TerrainGridArray select ZKB_TerrainGridSelection); player groupChat format[localize 'STR_MainMenu_TerrainSettingChat', (ZKB_TerrainGridSelection+1), (count ZKB_TerrainGridArray)];};";
	};
	class ViewSettings_TerrainUpBtn: ZKB_RscButton
	{
		idc = 26060;
		text = "+";
		x = 0.52 * safezoneW + safezoneX;
		y = 0.52 * safezoneH + safezoneY;
		w = 0.03 * safezoneW;
		h = 0.04 * safezoneH;
		action = "if (ZKB_TerrainGridSelection < ((count ZKB_TerrainGridArray)-1)) then {ZKB_TerrainGridSelection = ZKB_TerrainGridSelection + 1; setTerrainGrid(ZKB_TerrainGridArray select ZKB_TerrainGridSelection); player groupChat format[localize 'STR_MainMenu_TerrainSettingChat', (ZKB_TerrainGridSelection+1), (count ZKB_TerrainGridArray)];};";
	};
	class ViewSettings_DynamicTextCB: ZKB_RscCheckBox
	{
		idc = 26070;
		toolTip = "$STR_MainMenu_DynamicTextEnabledTT";
		onCheckedChanged = "ZKB_EnableDynamicText = ((_this select 1) isEqualTo 1);";
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.58 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class ViewSettings_DynamicTextCBText: ZKB_RscStructuredText
	{
		idc = 26080;
		text = "$STR_MainMenu_DynamicTextEnabled";
		x = 0.438 * safezoneW + safezoneX;
		y = 0.59 * safezoneH + safezoneY;
		w = 0.125 * safezoneW;
		h = 0.03 * safezoneH;
	};
	class ViewSettings_CloseBtn: ZKB_RscButton
	{
		idc = 26090;
		text = "$STR_Common_Back";
		x = 0.4125 * safezoneW + safezoneX;
		y = 0.64 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0; createDialog ""ZKB_MainMenu"";";
	};
	};
};
