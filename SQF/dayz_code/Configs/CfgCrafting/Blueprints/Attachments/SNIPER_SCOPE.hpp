class Blueprint_SNIPER_SCOPE : ItemCore {
	scope = public;
	displayName = $STR_ATTACHMENT_NAME_Sniper_Scope;
	descriptionShort = $STR_ATTACHMENT_DESC_Sniper_Scope;
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
				{"equip_part_lens","CfgMagazines",1}
			};
			output[] = 
			{
				{"Attachment_sniper_scope","CfgMagazines",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};