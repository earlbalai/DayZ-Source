// bleed.sqf
_unit = (_this select 3) select 0;
_blood =		_unit getVariable ["USEC_BloodQty", 0];
_lowBlood = 	_unit getVariable ["USEC_lowBlood", false];
_injured = 		_unit getVariable ["USEC_injured", false];
_inPain = 		_unit getVariable ["USEC_inPain", false];
_lastused = 	_unit getVariable ["LastTransfusion", time];

//if (_lastused - time < 600) exitwith {cutText [format[(localize "str_actions_medical_18"),_text] , "PLAIN DOWN"]};

call fnc_usec_medic_removeActions;
r_action = false;

if (vehicle player == player) then {
	//not in a vehicle
	player playActionNow "Medic";
};

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
_timer = diag_tickTime;
_i = 0;

while {r_doLoop and (_i < 12)} do {
	_animState = animationState player;
	_isMedic = ["medic",_animState] call fnc_inString;

	if (_isMedic) then {
		player removeMagazine "ItemBloodbag";
		_started = true;
	};

	if (_started) then {
		if ((diag_tickTime - _timer) >= 1) then {
			_timer = diag_tickTime;
			PVDZ_hlt_Transfuse = [_unit,player,1000];
			publicVariable "PVDZ_hlt_Transfuse";
			[player,25] call player_humanityChange;
			_i = _i + 1;
		};

		if (!_isMedic) then {
			player playActionNow "Medic";
		};
	};

	_blood = _unit getVariable ["USEC_BloodQty", 0];

	if (_blood >= r_player_bloodTotal) then {
		r_doLoop = false;
	};

	if (r_interrupt) then {
		r_doLoop = false;
	};

	sleep 0.1;
};

r_doLoop = false;

if (r_interrupt) then {
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
};
