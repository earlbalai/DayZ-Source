private["_qty","_dis","_sfx"];

player removeAction s_player_fillfuel;
s_player_fillfuel = -1;

_fuelcans = ["ItemFuelcanEmpty","ItemJerrycanEmpty"];

_qty = 0;
_qty = {_x in _fuelcans} count magazines player;

_qty20 = {_x == "ItemJerrycanEmpty"} count magazines player;
_qty5 = {_x == "ItemFuelcanEmpty"} count magazines player;

if (("ItemJerrycanEmpty" in magazines player) or ("ItemFuelcanEmpty" in magazines player)) then {
	for "_x" from 1 to _qty20 do {
		player removeMagazine "ItemJerrycanEmpty";
		player addMagazine "ItemJerrycan";
	};
	for "_x" from 1 to _qty5 do {
		player removeMagazine "ItemFuelcanEmpty";
		player addMagazine "ItemFuelcan";
	};
	
	_dis=5;
	_sfx = "refuel";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
	
	player playActionNow "Medic";
	
	sleep 6;
	
	cutText [format[(localize  "str_player_09"),_qty], "PLAIN DOWN"];
} else {
	cutText [(localize "str_player_10") , "PLAIN DOWN"];
};