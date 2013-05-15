class Blueprint_G36K_camo : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_G36K_camo;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_G36K_camo;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"G36K","CfgWeapons",1},
				{"Attachment_CAMO","CfgMagazines",1}
			};
			output[] = 
			{
				{"G36K_CAMO","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};