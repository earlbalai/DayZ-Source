private["_hasFood","_item","_text","_qty"];

player removeAction s_player_fillfuel;
s_player_fillfuel = -1;

_qty = {_x == "ItemJerrycanEmpty"} count magazines player;

if ("ItemJerrycanEmpty" in magazines player) then {
	for "_x" from 1 to _qty do {
		player removeMagazine "ItemJerrycanEmpty";
		player addMagazine "ItemJerrycan";
	};
	player playActionNow "Medic";
	_id = [player,20,true,(getPosATL player)] spawn player_alertZombies;
	if ({isPlayer _x} count (_pos nearEntities ["CAManBase",100]) > 1) then
	{
		[player,"refuel",0,false] call dayz_zombieSpeak;
	}
	else
	{
		[player,"refuel",0,true] call dayz_zombieSpeak;
	};
	cutText [format[(localize  "str_player_09"),_qty], "PLAIN DOWN"];
} else {
	cutText [(localize "str_player_10") , "PLAIN DOWN"];
};