class dialogBuild
{
	idd = 19041;
	class controls
	{
		class frame: RscText
		{
			idc = -1;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.484 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class listBox: RscListbox
		{
			idc = 190411;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class textTitle: RscText
		{
			idc = -1;
			text = "BUILDING MENU"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class picture: RscPicture
		{
			idc = 190412;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.154 * safezoneH;
		};
		class textPoints: RscText
		{
			idc = -1;
			text = "Remaining points : "; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class textCost: RscText
		{
			idc = -1;
			text = "Cost : "; //--- ToDo: Localize;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ctrlTextPoints: RscText
		{
			idc = 190413;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class ctrlTextCost: RscText
		{
			idc = 190414;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btnBuild: RscButton
		{
			idc = -1;
			text = "BUILD"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.055 * safezoneH;
			action = "[] spawn GDGM_fnc_spawnObjectMenu";
		};
		class btnClose: RscButton
		{
			idc = -1;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.055 * safezoneH;
			action = "closedialog 0";
		};
	};
};