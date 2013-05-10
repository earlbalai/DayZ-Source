
private ["_position", "_doLoiter", "_unitTypes", "_isNoone", "_loot", "_array", "_agent", "_type", "_radius", "_method", "_isAlive", "_myDest", "_newDest", "_rnd", "_lootType", "_index", "_weights"];

_position = 	_this select 0;
_doLoiter = 	_this select 1;
_unitTypes = 	_this select 2;

if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {}; 
if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {}; 

_isNoone = 	{isPlayer _x} count (_position nearEntities [["AllVehicles","CAManBase"],30]) == 0;
_loot = 	"";
_array = 	[];
_agent = 	objNull;

//Exit if no one is nearby
if (!_isNoone) exitWith {};

if (count _unitTypes == 0) then {
	_unitTypes = 	[]+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};
 
_unitTypes = _unitTypes + _unitTypes + _unitTypes + _unitTypes + DayZ_NewZeds;
 
_type = _unitTypes call BIS_fnc_selectRandom;

_radius = 4;
_method = "NONE";
_agent = createAgent [_type, _position, [], _radius, _method]; sleep 0.001;
_agent setDir random 360;
_agent setvelocity [0,0,1]; // avoid stuck zombies legs 
_agent setPosATL [_position select 0, _position select 1, 1+(_position select 2)]; // avoid stuck zombies legs 
_agent setVariable ["doLoiter",_doLoiter,true];


_agent setVariable["agentObject",_agent,true];

dayz_spawnZombies = dayz_spawnZombies + 1;

_position = getPosATL _agent;

//_position = getPosATL _agent;
if (random 1 > 0.7) then {
	_agent setUnitPos "Middle"; // "DOWN"=prone,  "UP"= stand up, "Middle" - Kneel Position.
};

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
	_lootType = 		configFile >> "CfgVehicles" >> _type >> "zombieLoot";
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

//Start behavior
_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";
