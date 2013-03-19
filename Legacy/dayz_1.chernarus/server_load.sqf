"dayzLoad"	addPublicVariableEventHandler {(_this select 1) call server_LoadCall};
globVar = 0;
NoLoad = true;
server_LoadSpawn = {
	private ["_x"];
	while {true} do { 
		for "_x" from 1 to 10000 do {
			globVar = (globVar + _x) mod 10000;
		};
	};
};
server_LoadCall = {
private ["_x","_y","_owner"];
	// this is the "non scheduled load"
	for "_y" from 1 to 5 do { //y_max x 20ms
		for "_x" from 1 to 10000 do { // 20ms on 4GHz
			globVar = (globVar + _x) mod 10000;
		};
	};	
	if (NoLoad) then {
		private ["_x","_id"];
		// this is the "scheduler" load
		for "_x" from 1 to 1000 do { //200 - 5000 make sense 
			_id = [] spawn server_LoadSpawn;
		};
		Noload = false;
	};
	_owner = owner (_this select 0);
	dayzLoadReady = ["0"];
	_owner publicVariableClient "dayzLoadReady";
};
