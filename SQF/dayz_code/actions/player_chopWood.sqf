private["_item","_result","_dis","_sfx"];

_item = _this;
call gear_ui_init;

if (["forest",dayz_surfaceType] call fnc_inString) then {
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
} else {
	cutText [localize "str_player_23", "PLAIN DOWN"];
};