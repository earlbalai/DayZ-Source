private ["_position", "_doLoiter", "_unitTypes", "_isNoone", "_loot", "_array", "_agent", "_type", "_radius", "_method", "_isAlive", "_myDest", "_newDest", "_rnd", "_lootType", "_index", "_weights", "_findAgt", "_list"];

_position = 	_this select 0;
_doLoiter = 	_this select 1;
_unitTypes = 	_this select 2;


_findAgt = { // find agents to recycle according to relative position and type
	private ["_plr","_types","_radius","_y", "_point"];

	_plr = _this select 0;
	_point = _plr modelToWorld [0,100,0]; // we will recycle more zombies located behind the player
	_types =  _this select 1;
	_radius = 200; 
	recyclableAgt=[];
	
	{	
		_y = _x getVariable ["agentObject",objNull];
		if (((alive _y) AND {(local _y)}) AND {((damage _y == 0) AND {(_y distance _point > _radius + 200)})}) then { // TODO : los check with scope check via (cameraView == "GUNNER") and viewdistance
			if (((typeOf _y) IN _types) AND
			{(0 == {(_x != _plr) AND (_x distance _y <_radius + 200)} count playableUnits)}) then { 
				recyclableAgt set [count recyclableAgt, _y];
			};
		};
	} forEach agents;
	
	recyclableAgt
};

if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {}; 
if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {}; 

_isNoone = 	0 == {(getPosATL _x) distance _position < 30} count playableUnits;
_loot = 	"";
_array = 	[];
_agent = 	objNull;

//Exit if no one is nearby
if (!_isNoone) exitWith {};

if (count _unitTypes == 0) then {
	_unitTypes = 	[]+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};
 
_unitTypes = _unitTypes + _unitTypes + _unitTypes + _unitTypes + DayZ_NewZeds;

// Build _list so that it contains 3 samples of unitTypes
_list = [_unitTypes select (floor(random(count _unitTypes))),
_unitTypes select (floor(random(count _unitTypes))),
_unitTypes select (floor(random(count _unitTypes)))];
// search available furthest zombies which type is among these samples
_list = [player, _list] call _findAgt;
// now _list contains a list of eligible agents
if (count _list > 0) then {
	// let's pick an agent from the list
	_agent = _list select 0;
	diag_log(format["%1 Found 1 agent to recycle: %2", __FILE__, _agent]);
}
else {
	// let's create an agent from scratch
	_type = _unitTypes call BIS_fnc_selectRandom;	
	_radius = 4;
	_method = "NONE";
	_agent = createAgent [_type, _position, [], _radius, _method]; sleep 0.001;
	dayz_spawnZombies = dayz_spawnZombies + 1;
	dayz_CurrentZombies = dayz_spawnZombies + 1;
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
	_agent setVariable["agentObject",_agent,true];
};
_agent setDir random 360;
_agent setvelocity [0,0,1]; // avoid stuck zombies legs 
_agent setPosATL [_position select 0, _position select 1, 1+(_position select 2)]; // avoid stuck zombies legs 
_agent setVariable ["doLoiter",_doLoiter,true];



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

if (count _list == 0) then {
	//Start behavior only for freshly created agents
	_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";
};

