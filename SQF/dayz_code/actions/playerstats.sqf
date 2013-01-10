//Remove action menu
player removeAction s_player_stats;
s_player_stats = -1;

//set stats enabled later use
player setVariable ["StatsEnabled",true,false];

//move to knee
player playMove "amovpercmstpsraswrfldnon_amovpknlmstpslowwrfldnon";
waitUntil { animationState player != "amovpercmstpsraswrfldnon_amovpknlmstpslowwrfldnon"};

//Let Zeds know
_id = [player,8,true,(getPosATL player)] spawn player_alertZombies;

//display gui (temp hint)
hintSilent parseText format ["
	<t size='1.20' font='Bitstream' color='#5882FA'>%1</t><br/><br/>
	<t size='1.15' font='Bitstream' align='left'>Zombies Killed: </t><t size='1.15' font='Bitstream' align='right'>%2</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Headshots: </t><t size='1.15' font='Bitstream' align='right'>%3</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Murders: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Bandits Killed: </t><t size='1.15' font='Bitstream' align='right'>%5</t><br/><br/>
	<t size='1.15' font='Bitstream' align='left'>Humanity: </t><t size='1.15' font='Bitstream' align='right'>%6</t><br/><br/>",
	(name player),
	(player getVariable['zombieKills', 0]),
	(player getVariable['headShots', 0]),
	(player getVariable['humanKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0])
];

//Sleep
sleep 10;

//move to standing
player playMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
waitUntil { animationState player != "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"};

//Remove variable
player setVariable ["StatsEnabled",false,false];
