_case = _this select 1;


Switch (_case) do
{
  case "Enable Monitor":
  {
  	MV = true;
	hint "Eanbleing Monkey Montior";
  };
  case "Disable Monitor":
  {
  	MV = false;
	hint "Disabling Monkey Montior";
  };
};


	while {MV} do
		{
			hintSilent parseText format ["
				<t size='1.20' font='Bitstream' color='#5882FA'>%1</t><br/><br/>
				<t size='1.15' font='Bitstream' align='left' color='#FF0033'>Zombies Killed: </t><t size='1.15' font='Bitstream' align='right' color='#FFBF00'>%2</t><br/>
				<t size='1.15' font='Bitstream' align='left' color='#FF0033'>Headshots: </t><t size='1.15' font='Bitstream' align='right' color='#FFBF00'>%3</t><br/>
				<t size='1.15' font='Bitstream' align='left' color='#FF0033'>Murders: </t><t size='1.15' font='Bitstream' align='right' color='#FFBF00'>%4</t><br/>
				<t size='1.15' font='Bitstream' align='left' color='#FF0033'>Bandits Killed: </t><t size='1.15' font='Bitstream' align='right' color='#FFBF00'>%5</t><br/><br/>
				<t size='1.15' font='Bitstream' align='left' color='#FF0033'>Blood: </t><t size='1.15' font='Bitstream' align='right' color='#FFBF00'>%6</t><br/>
				<t size='1.15' font='Bitstream' align='left' color='#FF0033'>Humanity: </t><t size='1.15' font='Bitstream' align='right' color='#FFBF00'>%7</t><br/><br/>
				<t size='1.15' font='Bitstream' align='left' color='#FF0033'>Zombies (alive/total): </t><t size='1.15' font='Bitstream' align='right' color='#FFBF00'>%8/%9</t><br/>",
				(name player),
				(player getVariable['zombieKills', 0]),
				(player getVariable['headShots', 0]),
				(player getVariable['humanKills', 0]),
				(player getVariable['banditKills', 0]),
				(player getVariable['USEC_BloodQty', r_player_blood]),
				(player getVariable['humanity', 0]),
				({alive _x} count entities "zZombie_Base"),
				(count entities "zZombie_Base")
			];
		};
