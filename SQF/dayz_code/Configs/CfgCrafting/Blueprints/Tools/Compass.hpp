class Blueprint_Compass : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Compass;
	descriptionShort = $STR_CRAFT_DESC_Compass;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"ItemTrashRazor","CfgMagazines",1},
				{"ItemWaterbottle","CfgMagazines",1},
				{"equip_scrap_metal","CfgMagazines",1}
			};
			output[] = 
			{
				{"ItemCompass","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};