class Blueprint_BaseBallBatBarbed : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_BaseBallBatBarbed;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_BaseBallBatBarbed;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"MeleeBaseBallBat","CfgWeapons",1},
				{"ItemNails","CfgMagazines",1},
				{"ItemWire","CfgMagazines",1}
			};
			output[] = 
			{
				{"MeleeBaseBallBatBarbed","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};