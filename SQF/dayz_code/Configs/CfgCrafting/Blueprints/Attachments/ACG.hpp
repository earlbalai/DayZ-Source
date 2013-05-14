class Blueprint_ACG : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_ACG;
	descriptionShort = $STR_CRAFT_DESC_ACG;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"equip_2inch_metal_pipe","CfgMagazines",2},
				{"equip_metal_sheet","CfgMagazines",2},
				{"equip_hose_clamp","CfgMagazines",1}
			};
			output[] = 
			{
				{"Attachment_ACG","CfgMagazines",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};