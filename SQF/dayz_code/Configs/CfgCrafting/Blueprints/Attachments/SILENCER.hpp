class Blueprint_SILENCER : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_SILENCER;
	descriptionShort = $STR_CRAFT_DESC_SILENCER;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"equip_1inch_metal_pipe","CfgMagazines",1},
				{"equip_2inch_metal_pipe","CfgMagazines",1},
				{"equip_metal_sheet","CfgMagazines",2},
				{"equip_hose_clamp","CfgMagazines",1}
			};
			output[] = 
			{
				{"Attachment_Silencer","CfgMagazines",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};