class Blueprint_Bandage : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Bandage;
	descriptionShort = $STR_CRAFT_DESC_Bandage;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"equip_rag","CfgMagazines",3},
				{"equip_gauze","CfgMagazines",2},
				{"equip_string","CfgMagazines",1}
			};
			output[] = 
			{
				{"ItemBandage","CfgMagazines",2}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};