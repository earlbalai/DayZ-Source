private["_unit1","_building","_type","_relPos","_boundingBox","_min","_max","_myX","_myY","_myZ","_inside"];

_unit1 = _this select 0;
_building = nil;
_inside = false;
if (count _this > 1) then { _building = _this select 1; }
else { 
	_building = nearestBuilding _unit1;
// 	{
// 		if (!((typeOf _x) IN ["Land_Fire_DZ", "TentStorage", "Wire_cat1", "Sandbag1_DZ", "Hedgehog_DZ"])) exitWith {
// 			_building = _x;
// 		}; 		
// 	} forEach(nearestObjects [_unit1, ["HouseBase"], 100]);
}; 
if (!isNil "_building") then {
	_type = typeOf _building;
	
	_relPos = _building worldToModel (getPosATL _unit1);
	_boundingBox = boundingBox _building;
//	diag_log ("fn_isInsideBuilding DEBUG: Building: " + str(_building) + " " + typeOf(_building) );
//	diag_log ("fn_isInsideBuilding DEBUG: BoundingBox: " + str(_boundingBox) );
//	diag_log ("fn_isInsideBuilding DEBUG: _relPos: " + str(_relPos) );
	
	_min = _boundingBox select 0;
	_max = _boundingBox select 1;
	_myX = _relPos select 0;
	_myY = _relPos select 1;
	_myZ = _relPos select 2;

	if ((_myX > (_min select 0)) and (_myX < (_max select 0))) then {
		if ((_myY > (_min select 1)) and (_myY < (_max select 1))) then {
			if ((_myZ > (_min select 2)) and (_myZ < (_max select 2))) then {
				_inside = true;
			};
		};
	};
};
diag_log ("fn_isinBuilding Check: " + str(_inside)+ " building:"+str(_building));
_inside
