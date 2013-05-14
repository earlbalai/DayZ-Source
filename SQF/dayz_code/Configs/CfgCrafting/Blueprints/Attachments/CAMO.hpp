class Blueprint_Camo : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_CAMO;
	descriptionShort = $STR_CRAFT_DESC_CAMO;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"equip_rag","CfgMagazines",1},
				{"equip_paint","CfgMagazines",1},
				{"equip_cable_tie","CfgMagazines",1}
			};
			output[] = 
			{
				{"Attachment_CAMO","CfgMagazines",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};