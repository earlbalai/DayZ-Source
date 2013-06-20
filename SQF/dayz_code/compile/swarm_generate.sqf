private["_position","_doLoiter","_unitTypes","_isNoone","_loot","_array","_agent","_type","_radius","_method","_nearByPlayer","_attempt","_myDest","_newDest","_lootType"];
_player = _this select 0;
_amount = _this select 1;

_counter = 0;
_agent = objNull;


while {_counter < _amount} do {

	if (dayz_swarmSpawnZombies > dayz_localswarmSpawned) exitwith {};
	//Create the Group and populate it
	_unitTypes = DayZ_NewZeds;
	//_type = "swarm_newBase"; //"_unitTypes call BIS_fnc_selectRandom;
	_type = "Pastor";
	_method = "NONE";

	_position = [_player,90,100,0,0,0,0] call BIS_fnc_findSafePos;

	_agent = createAgent [_type, _position, [], 0, _method];

	_agent setVariable["agentObjectSwarm",_agent,true];

	dayz_swarmSpawnZombies = dayz_swarmSpawnZombies + 1;
	dayz_spawnZombies = dayz_spawnZombies + 1;

	_agent setUnitPos "Down";

	if (isNull _agent) exitWith {
		dayz_spawnZombies = dayz_spawnZombies - 1;
		dayz_swarmSpawnZombies = dayz_swarmSpawnZombies - 1;
	};

	_isAlive = alive _agent;

	//counter
	_counter = _counter + 1;

	//debug
	diag_log (format["Agent: %1, Type: %2, Count/Max: %3/%4, To spawn: %6/%5",_agent,_type,dayz_swarmSpawnZombies,dayz_localswarmSpawned,_amount,_counter]);

	//Start behavior
	_id = [_position,_agent,player] execFSM "\z\AddOns\dayz_code\system\fn_swarmagent.fsm";
};