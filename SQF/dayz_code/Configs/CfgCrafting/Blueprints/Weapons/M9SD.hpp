class Blueprint_M9SD : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_M9SD;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_M9SD;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"M9","CfgWeapons",1},
				{"Attachment_Silencer","CfgMagazines",1}
			};
			output[] = 
			{
				{"M9SD","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};