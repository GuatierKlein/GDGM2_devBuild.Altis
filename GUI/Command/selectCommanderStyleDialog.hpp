class dialogCommanderSelect {
	idd = 19022;
	class controls {
		class frame: RscPicture
		{
			idc = -1;
			x = 0.293784 * safezoneW + safezoneX;
			y = 0.225024 * safezoneH + safezoneY;
			w = 0.412431 * safezoneW;
			h = 0.549951 * safezoneH;
			text = "Images\paperSquare.jpg";
		};
		class title: RscText
		{
			idc = -1;
			text = "Change commander style:"; //--- ToDo: Localize;
			x = 0.304095 * safezoneW + safezoneX;
			y = 0.247022 * safezoneH + safezoneY;
			w = 0.0979524 * safezoneW;
			h = 0.0549951 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class currentStyle: RscText
		{
			idc = -1;
			text = "current style:"; //--- ToDo: Localize;
			x = 0.304095 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.0515539 * safezoneW;
			h = 0.0439961 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class ctrlCurrentStyle: RscText
		{
			idc = 190221;
			text = "<style>"; //--- ToDo: Localize;
			x = 0.360804 * safezoneW + safezoneX;
			y = 0.313017 * safezoneH + safezoneY;
			w = 0.144351 * safezoneW;
			h = 0.0439961 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class titleChange: RscText
		{
			idc = -1;
			text = "change style:"; //--- ToDo: Localize;
			x = 0.304095 * safezoneW + safezoneX;
			y = 0.368012 * safezoneH + safezoneY;
			w = 0.0515539 * safezoneW;
			h = 0.0549951 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class RscListbox_1500: RscListbox
		{
			idc = 190222;
			x = 0.36596 * safezoneW + safezoneX;
			y = 0.39001 * safezoneH + safezoneY;
			w = 0.0670201 * safezoneW;
			h = 0.164985 * safezoneH;
		};
		class btnChange: RscButton
		{
			idc = 190223;
			text = "CHANGE"; //--- ToDo: Localize;
			x = 0.448446 * safezoneW + safezoneX;
			y = 0.39001 * safezoneH + safezoneY;
			w = 0.0412431 * safezoneW;
			h = 0.0549951 * safezoneH;
		};
		class ctrlSide: RscText
		{
			idc = 190224;
			text = "<side>"; //--- ToDo: Localize;
			x = 0.649506 * safezoneW + safezoneX;
			y = 0.247022 * safezoneH + safezoneY;
			w = 0.0412431 * safezoneW;
			h = 0.0549951 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class btnExit: RscButton
		{
			idc = -1;
			text = "CANCEL"; //--- ToDo: Localize;
			x = 0.644351 * safezoneW + safezoneX;
			y = 0.686983 * safezoneH + safezoneY;
			w = 0.0412431 * safezoneW;
			h = 0.0549951 * safezoneH;
			action = "closedialog 0";
		};
	};
};
