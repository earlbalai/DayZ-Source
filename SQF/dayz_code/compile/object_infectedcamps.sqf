//"Infected Camps: [[[7020.76,4072.34,0],40],[[10066.8,12114.3,0],20],[[10033.4,12525,0],20],[[9125.71,7742.72,0],40],[[6057.93,2655.66,0],40]]"
//Server_InfectedCamps, [_basePos,_amount,_radius]
diag_log(str(__FILE__));
_array = _this;

diag_log(str(_array));
{
	_camp = _x;
//diag_log ("Camp: " +str(_x));
	_campPos = _camp select 0;
//diag_log ("CampPos: " +str(_campPos));
	_campAmount = _camp select 1;
//diag_log ("CampAmont: " +str(_campAmount));
	_campRadius = _camp select 2;
//diag_log ("CampRadius: " +str(_campRadius));
	
	_trigger = createTrigger["EmptyDetector",_campPos];
	_trigger setTriggerArea[_campRadius,_campRadius,0,false];
	_trigger setTriggerActivation["ANY","PRESENT",false];
	_trgcode = format["[%1,%2] spawn camp_spawnZombies;",_campPos,_campAmount];
	_trigger setTriggerStatements["player in thislist", _trgcode, ""];
	_trigger setTriggerTimeout [0, 480, 240, false];

	_markerstr = createMarker [format["BaseCamp_%1", random 50], _campPos];
	_markerstr setMarkerColor "ColorRed";
	_markerstr setMarkerShape "ELLIPSE";
	_markerstr setMarkerBrush "Border";
	_markerstr setMarkerSizeLocal [_campRadius, _campRadius];

} foreach _array;