//Let Zeds know
[player,4,true,(getPosATL player)] spawn player_alertZombies;
// _Survivors = playersNumber west;
//display gui (temp hint)

if (! dayz_isSwimming) then
{
	createDialog "horde_journal_front_cover";
};

// if (alive player) then {
	// hintSilent parseText format ["
		// <t size='1.20' font='Bitstream' color='#5882FA'>%1</t><br/><br/>
		// <t size='1.20' font='Bitstream' color='#5882FA'>%2</t><br/><br/>
		// <t size='1.15' font='Bitstream' align='left'>%3: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
		// <t size='1.15' font='Bitstream' align='left'>%5: </t><t size='1.15' font='Bitstream' align='right'>%6</t><br/>
		// <t size='1.15' font='Bitstream' align='left'>%7: </t><t size='1.15' font='Bitstream' align='right'>%8</t><br/>
		// <t size='1.15' font='Bitstream' align='left'>%9: </t><t size='1.15' font='Bitstream' align='right'>%10</t><br/><br/>
		// <t size='1.15' font='Bitstream' align='left'>%11: </t><t size='1.15' font='Bitstream' align='right'>%12</t><br/><br/>
		// <t size='1.15' font='Bitstream'>%13 Survivors</t><br/><br/>
		// <t size='1.15' font='Bitstream'>%14: </t><t size='1.15' font='Bitstream'>%15</t><br/><br/>",
		// (name player),																// %1 Playername
		// (format [localize "str_actions_stats_sd",dayz_Survived]),					// %2 Survived N Days
		// (localize "str_actions_stats_zk"), (player getVariable['zombieKills', 0]),	// %3 Zombie Killed: %4
		// (localize "str_actions_stats_hs"), (player getVariable['headShots', 0]),	// %5 Headshots: %6
		// (localize "str_actions_stats_hk"), (player getVariable['humanKills', 0]),	// %7 Murders: %8
		// (localize "str_actions_stats_bk"), (player getVariable['banditKills', 0]),	// %9 Bandits Killed: %10
		// (localize "str_actions_stats_hm"), (player getVariable['humanity', 0]),		// %11 Humanity: %12
		// (_Survivors), 																// %13 Survivors
		// (floor(diag_fps)), (floor(diag_fpsmin)) // %14 FPS: %15
	// ];
// };

/*
player createDiarySubject ["MyDiary","My Diary"];
player createDiaryRecord ["MyDiary",["Stats", "Zombies Killed: <execute expression='player getVariable['zombieKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Headshots: <execute expression='player getVariable['headShots', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Murders: <execute expression='player getVariable['humanKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Bandits Killed: <execute expression='player getVariable['banditKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Humanity: <execute expression='player getVariable['humanity', 0]'</execute>"]];
*/