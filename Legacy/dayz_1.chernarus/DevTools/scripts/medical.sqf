private["_case"];
_case = _this select 1;


Switch (_case) do
{
	case "Bandage":
	{
		hint "Adding Medical Supply Bandage";
		player addMagazine 'ItemBandage';
	};
	Case "Painkillers":
	{
		hint "Adding Medical Supply Painkillers";
		player addMagazine 'ItemPainkiller';
	};
	Case "Morphine Auto-Injector":
	{
		hint "Adding Medical Supply Morphine Auto-Injector";
		player addMagazine 'ItemMorphine';
	};
	Case "Epi-Pen":
	{
		hint "Adding Medical Supply Epi-Pen";
		player addMagazine 'ItemEpinephrine';
	};
	Case "Bloodbag":
	{
		hint "Adding Medical Supply Bloodbag";
		player addMagazine 'ItemBloodbag';
	};
	Case "Heatpack":
	{
		hint "Adding Medical Supply Heatpack";
		player addMagazine 'ItemHeatPack';
	};
	Case "Antibiotics":
	{
		hint "Adding Medical Supply Antibiotics";
		player addMagazine 'ItemAntibiotic';
	};
};
