private["_position","_doLoiter","_unitTypes","_isNoone","_loot","_array","_agent","_type","_radius","_method","_nearByPlayer","_attempt","_myDest","_newDest","_lootType"];
_position = 	_this select 0;
_doLoiter = 	_this select 1;
_unitTypes = 	_this select 2;

_isNoone = 	{isPlayer _x} count (_position nearEntities ["AllVehicles",30]) == 0;
_loot = 	"";
_array = 	[];
_agent = 	objNull;

//Exit if a player is nearby
if (!_isNoone) exitWith {};

if (count _unitTypes == 0) then {
	_unitTypes = 	[]+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};
_type = _unitTypes call BIS_fnc_selectRandom;

//Create the Group and populate it
//diag_log ("Spawned: " + _type);

_radius = 0;
_method = "CAN_COLLIDE";
//_method =  "FORM";

if (_doLoiter) then {
	_radius = 40;
	_method = "NONE";
};

//diag_log ("Spawned: " + str([_type, _position, [], _radius, _method]));
_agent = createAgent [_type, _position, [], _radius, _method];

dayz_spawnZombies = dayz_spawnZombies + 1;

_position = getPosATL _agent;
//_position = [_position,0,20,20,0,0,0,_position] call BIS_fnc_findSafePos;
_nearByPlayer = ({isPlayer _x} count (_position nearEntities ["CAManBase",30])) > 0;

if (random 1 > 0.7) then {
	_agent setUnitPos "Middle";
};

//diag_log ("CREATED: "  + str(_agent));

//_agent setVariable["host",player,true];
if (!_doLoiter) then {
	_agent setVariable ["doLoiter",false,true];
	_agent setPosATL _position;
	_agent setDir round(random 180);
/*
	if (_nearByPlayer) then {
		deleteVehicle _agent;
	};
} else {
	if (_nearByPlayer) then {
		_attempt = 0;
		while {_nearByPlayer} do {
			_position = [_position,0,20,10,0,20,0] call BIS_fnc_findSafePos;
			_agent setPos _position;
			_agent = createAgent [_type, _position, [], _radius, _method];
			_nearByPlayer = ({isPlayer _x} count (_position nearEntities ["CAManBase",30])) > 0;
			_attempt = _attempt + 1;
			if (_attempt > 10) exitWith {};
		};
		_agent setPos _position;
	};
*/
};

if (isNull _agent) exitWith {
	dayz_spawnZombies = dayz_spawnZombies - 1;
};

_isAlive = alive _agent;

_myDest = getPosATL _agent;
_newDest = getPosATL _agent;
_agent setVariable ["myDest",_myDest];
_agent setVariable ["newDest",_newDest];

//Add some loot
_rnd = random 1;
if (_rnd > 0.3) then {
	private["_lootType","_itemTypes","_index","_weights","_cntWeights","_loot","_lootType"];
	_lootType = configFile >> "CfgVehicles" >> _type >> "zombieLoot";

	_lootType = getText(_lootType);
	if(_lootType != "") then { 	
		_itemTypes = [] + ((getArray (configFile >> "cfgLoot" >> _lootType)) select 0);
		_index = dayz_CLBase find _lootType;
		_weights = dayz_CLChances select _index;
		_cntWeights = count _weights;
		_index = floor(random _cntWeights);
		_index = _weights select _index;
		_loot = _itemTypes select _index;
		_agent addMagazine _loot;

	};
};

//Start behavior
_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";