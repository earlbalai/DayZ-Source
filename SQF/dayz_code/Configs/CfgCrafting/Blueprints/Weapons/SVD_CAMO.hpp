class Blueprint_SVD_CAMO : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_SVD_CAMO;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_SVD_CAMO;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"SVD","CfgWeapons",1},
				{"Skin_Sniper1_DZ","CfgMagazines",1},
				{"Attachment_CAMO","CfgMagazines",1}
			};
			output[] = 
			{
				{"SVD_CAMO","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};