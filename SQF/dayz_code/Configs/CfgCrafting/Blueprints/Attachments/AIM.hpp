class Blueprint_AIM : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_AIM;
	descriptionShort = $STR_CRAFT_DESC_AIM;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"equip_1inch_metal_pipe","CfgMagazines",1},
				{"equip_scrap_electronics","CfgMagazines",1},
				{"equip_d_battery","CfgMagazines",2},
				{"equip_cable_tie","CfgMagazines",1}
			};
			output[] = 
			{
				{"Attachment_AIM","CfgMagazines",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};