// Check/find a spot before pitching "Land_Fire_DZ", "TentStorage", "Wire_cat1", "Sandbag1_DZ" or "Hedgehog_DZ"
// _this 0: object class 
// _this 1: object (player) or array (ATL format)
// return a worldspace consisting of array [ direction, ATL position ] or empty array if no position is found
// if 2nd argument is a player, the position returned is just in front of the player, direction is so that the object is "looking to" the player

private ["_class","_isPlayer","_size","_testPond","_testBuilding", "_testSlope", "_testSea","_testDistance", 		"_noCollision","_dir","_obj","_isPLayer","_objectsPond","_ok"];

_class = _this select 0;
_pos = _this select 1;

_realSize = {
	[[0,0], (boundingBox _this) select 1] call BIS_fnc_distance2D
};							 

// check if _pos a player object or some ATL coordinates array
_isPlayer = (typeName _pos != "ARRAY");

_testBuilding = true;
_testDistance = _isPlayer;
_testPond = false;
_testSea = false;
_testSlope = false;
_noCollision = false;
switch _class do {
	case "TentStorage" : { // tent pitching must follow all restrictions
		_testPond = true;
		_testSlope = true;
		_testSea = true;
		_noCollision = true;
	}; 
	case "Land_Fire_DZ" : { // no fire in the water :)
		_testPond = true;
		_testSea = true;
	};
	default { // "Land_Fire_DZ", "TentStorage", "Wire_cat1", "Sandbag1_DZ", "Hedgehog_DZ"
	}
};

//diag_log(format["niceSpot: will test: pond:%1 building:%2 slope:%3 sea:%4 distance:%5 collide:%6", _testPond, _testBuilding, _testSlope, _testSea, _testDistance, _noCollision]);

_dir = if (_isPlayer) then {getDir(_pos)} else {0};
_obj = _class createVehicleLocal (getMarkerpos "center");
_size = _obj call _realSize;
if (_isPlayer) then { _size = _size + (_pos  call _realSize); };

// compute initial position. If _pos is the player, then the object will be in front of him/her
_new = nil;
_new = if (_isPlayer) then { _pos modeltoworld [0,_size/2,0] } else { _pos };
_new set [2, 0];

// place a temporary object (not colliding or can colliding)
if (_noCollision) then {
	deleteVehicle _obj;
	_obj = _class createVehicleLocal _new;
	// get non colliding position
	_new = getPosATL _obj;
	// get relative angle of object position according to player PoV
	if (_isPlayer) then {
		_x = _pos worldToModel _new;
		_dir = _dir + (if ((_x select 1)==0) then { 0 } else { (_x select 0) atan2 (_x select 1) });
	};
}
else {
	_obj setPosATL(_new);
};

if (_testBuilding) then { // let's proceed to the "something or its operator in a building" test
	_testBuilding = false;
	if (([_obj] call fnc_isInsideBuilding) // obj in a building
		OR {(!_isPLayer // or _pos is a player who is in a building
		OR {(_isPLayer AND ([_pos] call fnc_isInsideBuilding))}
		)}) then {
		_testBuilding = true;
	};
};

deleteVehicle _obj;

if (_testPond) then { // let's proceed to the "object in the pond" test (not dirty)
	_testPond = false;
	_objectsPond =  nearestObjects [_new, [], 100];
	{
		if (((typeOf(_x) == "")  // unnamed class?
			AND{(((_x worldToModel _new) select 2) < 0)}) // below water level? 
			AND {(["pond", str(_x), false] call fnc_inString)}
			) exitWith { // and is actually a pond?
				_testPond = true;
		};
	} forEach _objectsPond;
};

if (_testSlope or _testSea) then { // "flat, not in the sea, not on the beach" test
	_x = _new isflatempty [
		0, // don't check collisions
		0, // don't look around
		if (_testSlope) then {0.1*_size} else {999}, // slope gradient
		_size, // object size
		if (_testSea) then {0} else {1}, // check in the sea or not 
		false, // don't check far from shore
		if (_isPlayer) then {_pos} else {objNull} // not used -- seems buggy.
	];
	if (count _x >= 2) then { // safepos found (gradient ok AND not in sea water)
		_testSlope = false;
		_testSea = false;
		_x set [2,0];
		_x = ATLtoASL _x;
		if (_x select 2 < 3) then { // altitude too low (near wave foam -- sea level changes according to the date)
			_testSea = true;
		};
	};
};

if (_testDistance) then { // check effective distance from the player
	_testDistance = false;
	_x = _pos distance _new;
	if (_x > 6) then {
		_testDistance = true;
	};
};

//diag_log(format["niceSpot: result  pond:%1 building:%2 slope:%3 sea:%4 distance:%5 collide:%6", _testPond, _testBuilding, _testSlope, _testSea, _testDistance, _noCollision]);

_ok = !_testPond AND !_testBuilding AND !_testSlope AND !_testSea AND !_testDistance;

if (_ok) then { [round(_dir), _new] } else { [] }
