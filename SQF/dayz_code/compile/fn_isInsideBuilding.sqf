// check if arg#0 is inside or on the roof of a building
// second argument is optional:
//  - arg#1 is an object: check whether arg#0 is inside (bounding box of) arg#1
//  - missing arg#1: check whether arg#0 is inside (bounding box of) the nearest enterable building
//  - arg#1 is a boolean: check also whether arg#0 is inside (bounding box of) some non-enterable buildings around. Can be used to check if a player or an installed item is on a building roof.

private ["_unit", "_inside", "_building", "_check", "_realSize"];

_realSize = {
	[[0,0], (boundingBox _this) select 1] call BIS_fnc_distance2D
};							 

_check = {
	private ["_inside", "_relPos", "_this", "_plr", "_boundingBox", "_min", "_max", "_myX", "_myY", "_myZ", "_offset"];

	_building = _this select 0;
	_plr = _this select 1;
	_inside = false;
	_offset = 1; // shrink building boundingbox by this length.

	_relPos = _building worldToModel (getPosATL _plr);
	_boundingBox = boundingBox _building;
	
	_min = _boundingBox select 0;
	_max = _boundingBox select 1;
	_myX = _relPos select 0;
	_myY = _relPos select 1;
	_myZ = _relPos select 2;

	if ((_myX > (_min select 0)+_offset) and {(_myX < (_max select 0)-_offset)}) then {
		if ((_myY > (_min select 1)+_offset) and {(_myY < (_max select 1)-_offset)}) then {
			if ((_myZ > (_min select 2)) and {(_myZ < (_max select 2))}) then {
				_inside = true;
			};
		};
	};
	//diag_log(format["fnc_isInsideBuilding: building:%1 typeOf:%2 bbox:%3 relpos:%4 result:%5", _building, typeOf(_building), _boundingBox, _relPos, _inside ]);
	
	_inside
};

_unit = _this select 0;
_inside = false;

if (count _this > 1 AND {(typeName (_this select 1) == "OBJECT")}) then {
	// optional argument #1 can be the building used for the check
	_building = _this select 1;
	_inside = [_building, _unit] call _check;
}
else {
	// else perform check with nearest enterable building (contains a path LOD)
	_building = nearestBuilding _unit;
	if ([_building,_unit] call _check) then  { 
		_inside = true; 
	}
	else {
		// if arg #1 is a boolean = true, then
		// perform also some tests with all non-enterable buildings around _unit
		if ((count _this > 1 AND {(typeName (_this select 1) != "OBJECT")}) AND {(_this select 1)}) then {
			{
				_building = _x;
				if ((((!((typeOf _x) IN SafeObjects)) // not installable objects
					AND {(!(_x isKindOf "ReammoBox"))}) // not lootpiles (weaponholders and ammoboxes)
					AND {(((_unit call _realSize) + (_x call _realSize)) > ([_unit, _x] call BIS_fnc_distance2D))}) // objects might colliding
					AND {([_x, _unit] call _check)}) exitWith { // perform the check. exitWith works only in non-nested "if"
						_inside = true; 
				};
			} forEach(nearestObjects [_unit, ["Building"], 50]);
		};
	};
};
//diag_log ("fnc_isInsideBuilding Check: " + str(_inside)+ " last building:"+str(_building));

_inside
