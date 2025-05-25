class dialogPlayerShare
{
	idd = 25051;
	class controls 
	{
		class Frame: RscText
		{
			idc = -1;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class Title: RscText
		{
			idc = -1;
			text = "CHANGE PLAYER SHARE"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Slider: RscSlider
		{
			idc = 250511;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
			colorActive[] = {1,1,1,1};
		};
		class BtnClose: RscButton
		{
			idc = -1;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			action = "closedialog 0";
		};
		class BtnSet: RscButton
		{
			idc = -1;
			text = "SET"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			action = "call GDGM_fnc_changePlayerShare";
		};
		class CtrlTime: RscText
		{
			idc = 250512;
			text = "0"; //--- ToDo: Localize;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};