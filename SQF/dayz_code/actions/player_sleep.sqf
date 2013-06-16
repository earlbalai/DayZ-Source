private["_timesincedrink"];
//_timesincedrink = time - dayz_lastDrink;
//_bloodinc =100; Removed for now(untested) due to it not needed yet

//http://community.bistudio.com/wiki/ArmA2:_Moves

player playActionNow "PutDown";
sleep 1;
player playMove "AidlPpneMstpSnonWnonDnon_SleepC_layDown";
waitUntil { animationState player != "AidlPpneMstpSnonWnonDnon_SleepC_layDown"};
sleep 5;
player playMove "AidlPpneMstpSnonWnonDnon_SleepC_lookAround";
waitUntil { animationState player != "AidlPpneMstpSnonWnonDnon_SleepC_lookAround"};
sleep 5;
player playMove "AidlPpneMstpSnonWnonDnon_SleepC_scratch";
waitUntil { animationState player != "AidlPpneMstpSnonWnonDnon_SleepC_scratch"};
sleep 5;
player playMove "AidlPpneMstpSnonWnonDnon_SleepC_sleep";
waitUntil { animationState player != "AidlPpneMstpSnonWnonDnon_SleepC_sleep"};
sleep 5;
player playMove "AidlPpneMstpSnonWnonDnon_SleepC_sleep0";
waitUntil { animationState player != "AidlPpneMstpSnonWnonDnon_SleepC_sleep0"};
sleep 5;

/*
//Start effects of sleep
dayz_temperatur = (dayz_temperatur + 5) min dayz_temperaturmax;

player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
if (_timesincedrink > 600) then {
	dayz_thirst = 0;
} else {
	dayz_thirst = 1; //If player has had something to drink over 10 minutes ago, make them thirsty
};
r_player_blood = r_player_blood + _bloodinc;
player setVariable["USEC_BloodQty",r_player_blood,true];
player setVariable["medForceUpdate",true];
dayz_lastMeal = time;
dayz_hunger = 0;
*/

//1% chance every 5 mins to remove infection
_lastRest = player getVariable ["lastRest", 0];
if (time - _lastRest > 300) then { 
	player setVariable ["lastRest", time];
	//add infection chance for cure
	if (floor(random 100) < 1) then {
		r_player_infected = false;
		player setVariable["USEC_infected",true,true];
	};
};	
PVDZ_plr_Save = [player,[],true];
publicVariableServer "PVDZ_plr_Save";
//End Effects


player playMove "AidlPpneMstpSnonWnonDnon_SleepC_standUp";
waitUntil { animationState player != "AidlPpneMstpSnonWnonDnon_SleepC_standUp"};