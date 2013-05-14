class Blueprint_NailedBaseballBat : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_NailedBaseballBat;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_NailedBaseballBat;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"MeleeBaseBallBat","CfgWeapons",1},
				{"ItemNails","CfgMagazines",2}
			};
			output[] = 
			{
				{"MeleeBaseBallBatNails","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};