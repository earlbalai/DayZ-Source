class Blueprint_MAKAROVSD : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_MAKAROVSD;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_MAKAROVSD;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"Makarov","CfgWeapons",1},
				{"Attachment_Silencer","CfgMagazines",1}
			};
			output[] = 
			{
				{"MakarovSD","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};