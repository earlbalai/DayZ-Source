class Blueprint_DMR2 : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_DMR2;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_DMR2;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"M14_EP1","CfgWeapons",1},
				{"Attachment_sniper_scope","CfgMagazines",1}
			};
			output[] = 
			{
				{"DMR2","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};