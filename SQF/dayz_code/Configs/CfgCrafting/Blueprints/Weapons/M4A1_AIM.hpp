class Blueprint_M4A1_AIM : ItemCore {
	scope = public;
	displayName = $STR_CRAFT_NAME_Blueprint_M4A1_AIM;
	descriptionShort = $STR_CRAFT_DESC_Blueprint_M4A1_AIM;
	model = "\Ca\misc\SmallObj_moscow_docs_WPN";
	picture = "\z\addons\dayz_communityassets\CraftingPlaceholders\equip_blueprint.paa";
	
	class ItemActions {
		class Craft {
			text = "Craft Item";
			script = "spawn player_craftItem;";
			input[] = 
			{
				{"M4A1","CfgWeapons",1},
				{"Attachment_AIM","CfgMagazines",1},
				{"equip_rail_screws","CfgMagazines",2},
				{"equip_weapon_rails","CfgMagazines",1}
			};
			output[] = 
			{
				{"M4A1_AIM","CfgWeapons",1}
			};
			required[] = 
			{
				{"ItemToolbox","CfgWeapons",1}
			};
		};
	};
};