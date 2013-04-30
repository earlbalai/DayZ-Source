//NotWorking _DZ Remove
class ItemEtool_DZ: ItemCore {
	scope = 2;
	displayName = "Etool";
	descriptionShort = $STR_EQUIP_DESC_1;
	stashtype = "StashSmall";
	class ItemActions
	{
		class Use
		{
			text="Create Stash";
			script="spawn player_createstash;";
		};
	};
};