private ["_position", "_doLoiter", "_unitTypes", "_isNoone", "_loot", "_array", "_agent", "_type", "_radius", "_method", "_isAlive", "_myDest", "_newDest", "_rnd", "_lootType", "_index", "_weights"];

_campPos = _this select 0;
_amount = _this select 1;
_doLoiter = true;

_campPos = [_campPos select 0,_campPos select 1,0];

_counter = 0;

_campZeds = {local (_x getVariable ["agentObjectCamps",objNull])} count agents;

diag_log format["CampPos: %1, Amount: %2, TotalAgents: %3",_campPos,_amount,_campZeds];

//if (_campZeds >= _amount) exitwith { };

while {_counter < _amount} do {

	if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {};
	if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {};

	if (random 1 < 0.1) then {
	_doLoiter = false;
	};

	_position = [_campPos,1,130,0,0,0,0] call BIS_fnc_findSafePos;

	sleep 0.001;
	_isNoone = {isPlayer _x} count (_position nearEntities [["AllVehicles","CAManBase"],10]) == 0;
	_loot = "";
	_array = [];
	_agent = objNull;

	//Exit if no one is nearby
	if (!_isNoone) exitWith {};

	_unitTypes = DayZ_NewZeds;

	_type = _unitTypes call BIS_fnc_selectRandom;

	_radius = 4;
	_method = "NONE";
	_agent = createAgent [_type, _position, [], _radius, _method];
	sleep 0.001;
	_agent setDir random 360;
	_agent setvelocity [0,0,1]; // avoid stuck zombies legs
	_agent setPosATL [_position select 0, _position select 1, 1+(_position select 2)]; // avoid stuck zombies legs
	_agent setVariable ["doLoiter",_doLoiter];

	//diag_log format["Camps Spawns: %3, unitTypes: %1, position: %2 ",_unitTypes, _position, _amount];

	_agent setVariable["agentObjectCamps",_agent,true];

	dayz_spawnZombies = dayz_spawnZombies + 1;

	_position = getPosATL _agent;

	//_position = getPosATL _agent;
	//if (random 1 > 0.7) then {
		_stance = ["DOWN","Middle"]; // "DOWN"=prone,  "UP"= stand up, "Middle" - Kneel Position.
		_stance = _stance call BIS_fnc_selectRandom;
		_agent setUnitPos _stance;
	//};

	if (isNull _agent) exitWith {
		dayz_spawnZombies = dayz_spawnZombies - 1;
	};

	_myDest = getPosATL _agent;
	_newDest = getPosATL _agent;
	_agent setVariable ["myDest",_myDest];
	_agent setVariable ["newDest",_newDest];

	//Add some loot
	_rnd = random 1;
	if (_rnd > 0.3) then {
		_lootType = configFile >> "CfgVehicles" >> _type >> "zombieLoot";
		if (isText _lootType) then {
			_array = [];
			{
				_array set [count _array, _x select 0]
			} foreach getArray (configFile >> "cfgLoot" >> getText(_lootType));
			if (count _array > 0) then {
				_index = dayz_CLBase find getText(_lootType);
				_weights = dayz_CLChances select _index;
				_loot = _array select (_weights select (floor(random (count _weights))));
				if(!isNil "_array") then {
					_agent addMagazine _loot;
				};
			};
		};
	};

	//add to counter
	_counter = _counter + 1;
	//Start behavior
	_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";
};