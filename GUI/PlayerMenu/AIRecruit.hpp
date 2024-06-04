class dialogRecruitment 
{
	idd = 21041;
	class controls
	{
		class frame: RscText
		{
			idc = -1;
			x = 0.345312 * safezoneW + safezoneX; //0.345312
			y = 0.258 * safezoneH + safezoneY; //0.258 
			w = 0.47 * safezoneW;
			h = 0.473 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class textTitle: RscText
		{
			idc = -1;
			text = "AI RECRUITMENT MENU"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class listbox: RscListbox
		{
			idc = 210411;
			x = 0.365938 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.297 * safezoneH;
		};
		class listboxGrp: RscListbox
		{
			idc = 210413;
			x = 0.65 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.297 * safezoneH;
		};
		class picture: RscPicture
		{
			idc = 210412;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.5 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class btnRecruit: RscButton
		{
			idc = -1;
			text = "TP group to me"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			action = "[] spawn GDGM_fnc_tpGroupOnMe";
		};
		class btnClose: RscButton
		{
			idc = -1;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			action = "closedialog 0";
		};
		class btnDismiss: RscButton
		{
			idc = -1;
			text = "DISMISS"; //--- ToDo: Localize;
			x = 0.680468 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			action = "[] spawn GDGM_fnc_despawnRecruit";
		};
	};
};