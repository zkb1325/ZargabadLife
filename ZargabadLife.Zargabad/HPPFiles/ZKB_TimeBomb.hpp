class ZKB_TimeBomb
{
idd = 9000;														
name = "ZKB_TimeBomb";
movingEnabled = true;
enableSimulation = true;
onLoad = "uiNamespace setVariable ['ZKB_TimeBomb', _this select 0]";
onUnload = "uiNamespace setVariable ['ZKB_TimeBomb', displayNull]";

class controls
	{

	class TimeBomb_BG: IGUIBack
	{
		idc = 9001;
		x = 0.225 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.55 * safezoneW;
		h = 0.08 * safezoneH;
	};
	class TimeBomb_Frame: ZKB_RscFrame
	{
		idc = 9002;
		x = 0.225 * safezoneW + safezoneX;
		y = 0.32 * safezoneH + safezoneY;
		w = 0.55 * safezoneW;
		h = 0.08 * safezoneH;
	};
	class TimeBomb_TimeSlider: ZKB_RscSlider
	{
		idc = 9010;
		onSliderPosChanged = "((uiNameSpace getVariable ""ZKB_TimeBomb"") displayCTRL 9020) ctrlSetText format [localize ""STR_ItemMisc_BombTimer"", [round (_this select 1),""MM:SS""] call BIS_fnc_secondsToString]";
		x = 0.25 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.2375 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TimeBomb_Info: ZKB_RscStructuredText
	{
		idc = 9020;
		x = 0.4875 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.0875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TimeBomb_Plant: ZKB_RscButton
	{
		idc = 9030;
		text = $STR_ItemMisc_PlantBomb;
		action = "[""Plant"",""TimeBomb"", round (sliderPosition 9010), (vehicle player)] spawn ZKB_fnc_TimeBomb;";
		x = 0.575 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.0875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class TimeBomb_Cancel: ZKB_RscButton
	{
		idc = 9040;
		text = $STR_Common_Close;
		x = 0.675 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.0875 * safezoneW;
		h = 0.04 * safezoneH;
		action = "closedialog 0";
	};
	};
};
