
while {isServer} do {
	while {isServer} do {
		while {isServer} do {
			//_zeds = {alive (_x getVariable ["agentObject",objNull]) count agents;
			_survivors = playersNumber west;
			diag_log format[ "Survivors:%1, FPS:%2, FPSMin:%3", _survivors,diag_fps,diag_fpsmin];
			sleep 181;
		};
	sleep 181;
	};
sleep 181;


/*
	_zeds = {alive (_x getVariable ["agentObject",objNull]) count agents;
	_survivors = playersNumber west;
	diag_log format[ "Survivors:%1, AliveZeds:%4 FPS:%2, FPSMin:%3", _survivors,diag_fps,diag_fpsmin,_zeds];
	//diag_log ("DEBUG FPS  : " + str(diag_fps) );
*/