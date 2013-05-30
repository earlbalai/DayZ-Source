// animHealed.sqf
private["_array","_unit","_medic","_display","_control","_lowBlood"];
disableserialization;
_array = _this; //_this select 0;
_unit = _array select 0;
_medic = _array select 1;

_rndInfection = (random 10);
_TransfusionInfection = (_rndInfection < 0.3);

if (_unit == player) then {
	if (_TransfusionInfection) then {
		r_player_infected = true;
		player setVariable["USEC_infected",true,true]; 
	};
	
	//Ensure Control is visible
	_display = uiNamespace getVariable 'DAYZ_GUI_display';
	_control = 	_display displayCtrl 1300;
	_control ctrlShow true;
	
	while { ((player distance _medic) < 2) and (r_player_blood < r_player_bloodTotal) } do {
		if (((r_player_blood / r_player_bloodTotal) >= 0.35) and (r_player_lowblood)) then {
			r_player_lowblood = false;
			10 fadeSound 1;
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
		};

		if ((r_player_blood + 2000) >= r_player_bloodTotal) then {
			r_player_blood = r_player_bloodTotal;
			player setVariable["USEC_BloodQty",r_player_bloodTotal,true];
		} else {
			r_player_blood = r_player_blood + 2000;
			player setVariable["USEC_BloodQty",r_player_blood,true];
		};

		// feedback to player receiving blood (player)
		// feedback to player giving blood (_medic)

		sleep 2;
	};
};
if (isServer) then {
	_unit setVariable["medForceUpdate",true];
};
