
// create a Zombie agent, or recycle an existing one.
// returns true if agent is not null
// "_this select 3" and "_this select 4"  may be modified

private ["_position","_this","_doLoiter","_unitTypes","_recyAgt","_maxtoCreate","_agent","_list","_x","__FILE__","_agtPos","_type","_radius","_method","_loot","_array","_rnd","_lootType","_index","_weights","_myDest","_newDest","_id"];

_position = _this select 0;
_doLoiter = _this select 1; // wander around
_unitTypes = _this select 2; // class of wanted models
_recyAgt = []; if (count _this > 3) then { _recyAgt = _this select 3; };
_maxtoCreate = 99; if (count _this > 4) then { _maxtoCreate = _this select 4; };

_agent = objNull;
if (count _unitTypes == 0) then {
	_unitTypes = []+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};
 
_unitTypes = _unitTypes + _unitTypes + _unitTypes + _unitTypes + DayZ_NewZeds;

// Build _list so that it contains 3 samples of unitTypes (zombie model)
_list = [_unitTypes select (floor(random(count _unitTypes))),
	_unitTypes select (floor(random(count _unitTypes))),
	_unitTypes select (floor(random(count _unitTypes)))];
// search available recyclable zombies which type is among these samples
{
	if (typeOf (_x getVariable ["agentObject",objNull]) IN _list) exitWith {
		_agent = _x;
		_recyAgt = _recyAgt - [_agent];
	};
} forEach _recyAgt;

if (!isNull _agent) then { // we have found a recyclable agent
	//diag_log(format["%1 Found 1 agent to recycle: %2", __FILE__, _agent]);
	// sometime Z can be seen flying in very high speed while tp. Its altitude is set underground to hide that.
	_agtPos = getPosASL _agent; _agtPos set [2, -3];
	_agent setPosASL _agtPos; sleep 0.001;
}
else {
	if (_maxtoCreate > 0) then {
		// let's create an agent from scratch
		_type = _unitTypes call BIS_fnc_selectRandom;	
		_radius = 4;
		_method = "NONE";
		_agent = createAgent [_type, _position, [], _radius, _method]; sleep 0.001;
		dayz_spawnZombies = dayz_spawnZombies + 1;
		dayz_CurrentZombies = dayz_spawnZombies + 1;
		//Add some loot
		_loot = "";
		_array = [];
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
		_agent setVariable["agentObject",_agent,true];
		_maxtoCreate = _maxtoCreate -1;
	};
};

if (!isNull _agent) then {
	_agent setDir random 360;
	_agent setvelocity [0, 0, 1]; // avoid stuck zombies legs 
	_agent setPosATL _position;
	_agent setVariable ["doLoiter",_doLoiter,true];
	
	_position = getPosATL _agent;
	
	if (random 1 > 0.7) then {
		_agent setUnitPos "Middle"; // "DOWN"=prone,  "UP"= stand up, "Middle" - Kneel Position.
	};
	
	_myDest = getPosATL _agent;
	_newDest = getPosATL _agent;
	_agent setVariable ["myDest",_myDest];
	_agent setVariable ["newDest",_newDest];
	
	if (count _list == 0) then {
		//Start behavior only for freshly created agents
		_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";
	};
};

_this set [3, _recyAgt];
_this set [4, _maxtoCreate];

(!isNull _agent)
