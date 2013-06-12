private["_item","_result","_dis","_sfx"];

_item = _this;
call gear_ui_init;

if (["forest",dayz_surfaceType] call fnc_inString) then {
	//Remove melee magazines (BIS_fnc_invAdd fix) (add new melee ammo to array if needed)
	{player removeMagazines _x} forEach ["hatchet_swing","crowbar_swing","Machete_swing"];
	_result = [player,"PartWoodPile"] call BIS_fnc_invAdd;
	if (_result) then {
		player playActionNow "Medic";

		_dis=20;
		_sfx = "chopwood";
		[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
		[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

		sleep 5;
		cutText [localize "str_player_25", "PLAIN DOWN"];
	} else {
		cutText [localize "str_player_24", "PLAIN DOWN"];
	};
	//adding melee mags back if needed
	switch (primaryWeapon player) do {
		case "MeleeHatchet": {player addMagazine 'hatchet_swing';};
		case "MeleeCrowbar": {player addMagazine 'crowbar_swing';};
		case "MeleeMachete": {player addMagazine 'Machete_swing';};
	};
} else {
	cutText [localize "str_player_23", "PLAIN DOWN"];
};