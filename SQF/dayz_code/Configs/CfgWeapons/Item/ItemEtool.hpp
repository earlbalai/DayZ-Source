//NotWorking _DZ Remove
class ItemEtool: ItemCore {
	scope = 2;
	displayName = "Etool";
	descriptionShort = $STR_EQUIP_DESC_1;
	stashsmall = "StashSmall";
	stashmedium = "StashMedium";
	consume = "ItemSandbag";
	class ItemActions
	{
		class Use
		{
			text="Create Stash";
			script="spawn player_createstash; r_action_count = r_action_count + 1;";
		};
	};
};