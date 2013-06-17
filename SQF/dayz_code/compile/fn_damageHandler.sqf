scriptName "Functions\misc\fn_damageHandler.sqf";
/***********************************************************

	Modifyed by Alby

	PROCESS DAMAGE TO A UNIT
	- Function
	- [unit, selectionName, damage, source, projectile] call fnc_usec_damageHandler;
************************************************************/
private["_newtypezed","_forceHit","_zClose","_bloodPercentage","_unit","_humanityHit","_myKills","_isBandit","_hit","_damage","_isPlayer","_unconscious","_wound","_isHit","_isInjured","_type","_hitPain","_inPain","_isDead","_isCardiac","_killerID","_evType","_recordable","_inVehicle","_isHeadHit","_isMinor","_scale","_canHitFree"];
_unit = _this select 0;
_hit = _this select 1;
_damage = _this select 2;
_unconscious = _unit getVariable ["NORRN_unconscious", false];
_source = _this select 3;
_ammo = _this select 4;
if (count _this > 5) then {
	_forceHit = _this select 5;
};
_type = [_damage,_ammo] call fnc_usec_damageType;
_newtypezed = typeOf _source in DayZ_NewZeds;
_isMinor = (_hit in USEC_MinorWounds);
_isHeadHit = (_hit == "head_hit");
_evType = "";
_recordable = false;
_isPlayer = (isPlayer _source);
_currentAnim = animationState _unit;

_sourceZombie = _source isKindOf "zZombie_base";
_bloodPercentage = (r_player_blood / r_player_bloodTotal);

//Publish Damage
	//player sidechat format["Processed damage for %1",_unit];
	//USEC_SystemMessage = format["CLIENT: %1 damaged for %2 (in vehicle: %5)",_unit,_damage,_isMinor,_isHeadHit,_inVehicle];
	//PublicVariable "USEC_SystemMessage";

if (_unit == player) then {
	if (_hit == "") then {
		if ((_source != player) and _isPlayer) then {
			//Enable aggressor Actions
			if (_source isKindOf "CAManBase") then {
				_source setVariable["startcombattimer",1];
			};
			_canHitFree = player getVariable ["freeTarget",false];
			//_isBandit = (typeOf player) == "Bandit1_DZ";
			_isBandit = (player getVariable["humanity",0]) <= -2000;
			if (!_canHitFree and !_isBandit) then {
				// "humanKills" from local character is used to compute attacker player "PVDZ_plr_Humanity" change
				_myKills = -1 max (1 - (player getVariable ["humanKills",0]) / 7);  // -1 (good action) to 1 (bad action)
				_humanityHit = -200 * _myKills * _damage;
				if (_humanityHit != 0) then {
					PVDZ_plr_Humanity = [_this select 0, _humanityHit, 30];
					publicVariable "PVDZ_plr_Humanity";
				};
			};
		};
	};
};

//Pure blood damage
if (_newtypezed) then { _scale = 400; } else { _scale = 200; };
if (_damage > 0.1) then {
	if (_ammo != "zombie") then {
		_scale = _scale + 50;
	};
	//Start body part scale
	if (_ammo == "zombie" and _hit == "body") then {
		_scale = _scale * 3;
	};
	if (_ammo == "zombie" and _hit == "legs" and !_newtypezed) then {
		_scale = _scale / 2;
	};
	/*
	if (_ammo == "zombie" and _hit == "hands" and !_newtypezed) then {
		_scale = _scale / 4;
	};
	*/
	if (_isHeadHit) then {
		_scale = _scale * 6;
	};
	if (_ammo == "zombie" and _unconscious and !_newtypezed) then {
		_scale = 50;
	};
	//End body part scale
	if ((isPlayer _source) and !(player == _source)) then {
		_scale = _scale + 800;
		if (_isHeadHit) then {
			_scale = _scale + 500;
		};
	};
	switch (_type) do {
		case 1: {_scale = _scale + 200};
		case 2: {_scale = _scale + 200};
	};
	if (_unit == player) then {
		diag_log ("DAMAGE: player hit by " + typeOf _source + " in " + _hit + " with " + _ammo + " for " + str(_damage) + " scaled " + str(_damage * _scale) + " Conscious " + str (!_unconscious));
		r_player_blood = r_player_blood - (_damage * _scale);
	};
};

//Record Damage to Minor parts (legs, arms)
if (_hit in USEC_MinorWounds) then {
	if (_ammo == "zombie") then {
		if (_hit == "legs") then {
			[_unit,_hit,(_damage / 6)] call object_processHit;
		} else {
			[_unit,_hit,(_damage / 4)] call object_processHit;
		};
	} else {
		if ((_hit == "legs") AND (_source==_unit) AND (_ammo=="")) then {
			if ((!isNil "Dayz_freefall") AND {(abs(time - (Dayz_freefall select 0))<1)}) then {
				_nrj = ((Dayz_freefall select 1)*20) / 100;  // h=5m => nrj=1
//				diag_log(format["%1 Broken legs registered from freefall _hit:""%2""  _source:%3  _unit:%4  _ammo:""%5""  _damage:%6  freefall:%7  time:%8  _nrj:%9(%10) pos:%11",__FILE__,
//						_hit,_source,_unit,_ammo,_damage, Dayz_freefall, time, _nrj,((1+_nrj)^2)-1, getPos player]);
				if (random(((1+_nrj)^2)-1) > 1.5) then { // freefall from 5m => 1/2 chance to get hit legs registered
					diag_log(format["%1 Legs damage registered from freefall. _damage:%2  _nrj:%3 (odds %4:1) freefall:%5",__FILE__,
									_damage, _nrj,(((1+_nrj)^2)-1)/1.5, Dayz_freefall, time]);
					[_unit,_hit,_damage] call object_processHit;
				}
				else {
					[_unit,"arms",_damage/6] call object_processHit; // prevent broken legs due to arma bugs
				};
			};
		}
		else {
			[_unit,_hit,_damage/2] call object_processHit;
		};
	};
};

if (_unit == player) then {
//incombat
	_unit setVariable["startcombattimer", 1];
};

//Shake the cam, frighten them!
if (_damage > 0.1) then {
	if (_unit == player) then {
		//player sidechat format["Processed bullet hit for %1 (should only be for me!)",_unit];
		1 call fnc_usec_bulletHit;
	};
	if (local _unit) then {
		_unit setVariable["medForceUpdate",true,true];
	};
};

if (_damage > 0.4) then { //0.25
	//Pain and Infection
	if (_unit == player) then {
		_hitPain = (((_damage * _damage) min 0.75) > _bloodPercentage);

		//Infection from zombies
		if (_ammo == "zombie") then {
			//_rndInfection = random (_damage - _bloodPercentage);
			//_hitInfection = ((exp _rndInfection) > dayz_infectionTreshold);
			//if (_newtypezed) then {
				//_rndInfection = random (_damage - _bloodPercentage);
				//_hitInfection = ((exp _rndInfection * dayz_infectionTreshold*1.1) > dayz_infectionTreshold);
			//};
			_zClose = count ((getposATL player) nearEntities ["zZombie_Base",5]);
			_rndInfection = random (_damage - _bloodPercentage);
			_hitInfection = ((exp _rndInfection) > (dayz_infectionTreshold / (_zClose * 0.25)));
			if (_newtypezed) then {
				_rndInfection = random (_damage - _bloodPercentage);
				_hitInfection = ((exp _rndInfection) > (dayz_infectionTreshold / _zClose));
			};
			if (_hitInfection) then {
				r_player_infected = true;
				player setVariable["USEC_infected",true,true];
			};
			//diag_log format["%1  (_damage - _bloodPercentage):%2  _rndInfection:%3  (exp _rndInfection):%4  _hitInfection:%5 ", __FILE__, (_damage - _bloodPercentage), _rndInfection, exp _rndInfection, _hitInfection];
		};
		if (_hitPain) then {
			r_player_inpain = true;
			player setVariable["USEC_inPain",true,true];
		};
		if ((_damage > 1.5) and _isHeadHit) then {
			_id = [_source,"shothead"] spawn player_death;
		};
	};

	//Create wound and cause bleed
	_wound = _hit call fnc_usec_damageGetWound;
	_isHit = _unit getVariable["hit_"+_wound,false];

	if (_ammo == "zombie") then {
		if(!_isHit and ((_damage > 0.7) or _isHeadHit)) then {
			//Create Wound
			_unit setVariable["hit_"+_wound,true,true];
			PVDZ_hlt_Bleed = [_unit,_wound,_damage];
			publicVariable "PVDZ_hlt_Bleed";   // draw blood stream on character, on all gameclients
			[_unit,_wound,_hit] spawn fnc_usec_damageBleed;  // draw blood stream on character, locally
			//Set Injured if not already
			_isInjured = _unit getVariable["USEC_injured",false];
			if (!_isInjured) then {
				_unit setVariable["USEC_injured",true,true];
				if ((_unit == player) and (_ammo != "zombie")) then {
					dayz_sourceBleeding = _source;
				};
			};
			//Set ability to give blood
			_lowBlood = _unit getVariable["USEC_lowBlood",false];
			if (!_lowBlood) then {
				_unit setVariable["USEC_lowBlood",true,true];
			};
			if (_unit == player) then {
				r_player_injured = true;
			};
		};
	} else {
		if(!_isHit) then {
			//Create Wound
			_unit setVariable["hit_"+_wound,true,true];
			PVDZ_hlt_Bleed = [_unit,_wound,_damage];
			publicVariable "PVDZ_hlt_Bleed";  // draw blood stream on character, on all gameclients
			[_unit,_wound,_hit] spawn fnc_usec_damageBleed;  // draw blood stream on character, locally
			//Set Injured if not already
			_isInjured = _unit getVariable["USEC_injured",false];
			if (!_isInjured) then {
				_unit setVariable["USEC_injured",true,true];
				if ((_unit == player) and (_ammo != "zombie")) then {
					dayz_sourceBleeding = _source;
				};
			};
			//Set ability to give blood
			_lowBlood = _unit getVariable["USEC_lowBlood",false];
			if (!_lowBlood) then {
				_unit setVariable["USEC_lowBlood",true,true];
			};
			if (_unit == player) then {
				r_player_injured = true;
			};
		};
	};
};
if (_type == 1) then {
	/*
		BALISTIC DAMAGE
	*/
	if ((_damage > 0.01) and (_unit == player)) then {
		//affect the player
		[20,45] call fnc_usec_pitchWhine; //Visual , Sound
	};
	if (_damage > 4) then {
		//serious ballistic damage
		if (_unit == player) then {
			_id = [_source,"explosion"] spawn player_death;
		};
	} else {
		if (_damage > 2) then {
			_isCardiac = _unit getVariable["USEC_isCardiac",false];
			if (!_isCardiac) then {
				_unit setVariable["USEC_isCardiac",true,true];
				r_player_cardiac = true;
			};
		};
	};
};
if (_type == 2) then {
	/*
		HIGH CALIBRE
	*/
	if (_damage > 4) then {
		//serious ballistic damage
		if (_unitIsPlayer) then {
			_id = [_source,"shotheavy"] spawn player_death;
		};
	} else {
		if (_damage > 2) then {
			_isCardiac = _unit getVariable["USEC_isCardiac",false];
			if (!_isCardiac) then {
				_unit setVariable["USEC_isCardiac",true,true];
				r_player_cardiac = true;
			};
		};
	};
};

if (_ammo == "zombie") then {
	if (!_unconscious and !_isMinor and _isHeadHit) then {
		_chance = random 1;
		if ((_damage > 0.8) and (_chance < 0.5)) then {
			[_unit,_damage] call fnc_usec_damageUnconscious;
		};
		/*
		if (_ammo == "zombie" and _damage > (_bloodPercentage + 0.1)) then {
			if ((_damage - _bloodPercentage) > 0.2) then {
				[_unit,(_damage - _bloodPercentage)] call fnc_usec_damageUnconscious;
			};
		};
		*/
	};
} else {
	if (!_unconscious and !_isMinor and ((_damage > 2) or ((_damage > 0.5) and _isHeadHit))) then {
		//set unconsious
		[_unit,_damage] call fnc_usec_damageUnconscious;
	};
};

// all "HandleDamage event" functions should return the effective damage that the engine will record
0
