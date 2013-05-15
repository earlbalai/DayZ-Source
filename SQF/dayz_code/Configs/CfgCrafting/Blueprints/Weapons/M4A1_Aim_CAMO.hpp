class Blueprint_M4A1_Aim_CAMO : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_M4A1_Aim_CAMO;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_M4A1_Aim_CAMO;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"M4A1_Aim","CfgWeapons",1},
				{"Attachment_CAMO","CfgMagazines",1}
			};
			output[] = 
			{
				{"M4A1_Aim_CAMO","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};