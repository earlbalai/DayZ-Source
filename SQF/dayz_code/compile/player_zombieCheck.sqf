
private["_vehicle","_unit","_listTalk","_pHeight","_attacked","_multiplier","_continue","_type","_dist","_chance","_last","_entHeight","_delta","_target","_cantSee","_tPos","_zPos","_eyeDir","_inAngle","_targets","_lowBlood"];

_vehicle = vehicle player;
_unit = (driver _vehicle);
_listTalk = (getPos _unit) nearEntities ["zZombie_Base",80];
_pHeight = (getPosATL _unit) select 2;
_attacked = false;
_multiplier = 1;
_type = "zombie";

{
private["_target","_targets"];

	if (alive _x) then
	{
		if (local _x) then
		{
			private["_dist"];

			_dist = (_x distance _unit);
			_chance = 1;

			if ((_dist < dayz_areaAffect) and !(animationState _x == "ZombieFeed")) then
			{
				if (_type == "zombie") then { [_x,"attack",(_chance),true] call dayz_zombieSpeak; };

				_last = _x getVariable ["lastAttack",0];
				_entHeight = (getPosATL _x) select 2;
				_delta = _pHeight - _entHeight;
				if ( ((time - _last) > 1) and ((_delta < 1.5) and (_delta > -1.5)) ) then
				{
					[_x,_type] spawn player_zombieAttack;
					_x setVariable ["lastAttack",time];
				};
				_attacked = true;
			}
			else
			{
				if (_type == "zombie") then
				{
					if (speed _x < 4) then
					{
						[_x,"idle",(_chance + 4),true] call dayz_zombieSpeak;
					}
					else
					{
						[_x,"chase",(_chance + 3),true] call dayz_zombieSpeak;
					};
				};
			};
			//Noise Activation
			_target = _x getVariable ["target",[]];
			if (!(_unit in _target)) then
			{
				if (_dist < DAYZ_disAudial) then
				{
					if (DAYZ_disAudial > 80) then
					{
						_target set [count _target,_unit];
						_x setVariable ["target",_target];
					}
					else
					{
						_cantSee = [_x,_unit] call dayz_losCheck;
						if (!_cantSee) then
						{
							_target set [count _target,_unit];
							_x setVariable ["target",_target];
						}
						else
						{
							if (_dist < (DAYZ_disAudial / 2)) then
							{
								_target set [count _target,_unit];
								_x setVariable ["target",_target];
							};
						};
					};
				};
			};
			//Sight Activation
			_target = _x getVariable ["target",[]];
			if (!(_unit in _target)) then
			{
				if (_dist < DAYZ_disVisual) then
				{
					_tPos = (getPosASL _unit);
					_zPos = (getPosASL _x);
					_eyeDir = direction _x;
					_inAngle = [_zPos,_eyeDir,60,_tPos] call fnc_inAngleSector;
					if (_inAngle) then
					{
						_cantSee = [_x,_unit] call dayz_losCheck;
						if (!_cantSee) then
						{
							_target set [count _target,_unit];
							_x setVariable ["target",_target];
						};
					};
				};
			};
		}
		else
		{
			private["_dist"];

			_dist = (_x distance _unit);
			_chance = 1;
			if ((_x distance player < dayz_areaAffect) and !(animationState _x == "ZombieFeed")) then
			{
				if (_type == "zombie") then { [_x,"attack",(_chance),true] call dayz_zombieSpeak; };

				_last = _x getVariable ["lastAttack",0];
				_entHeight = (getPosATL _x) select 2;
				_delta = _pHeight - _entHeight;
				if ( ((time - _last) > 1) and ((_delta < 1.5) and (_delta > -1.5)) ) then
				{
					[_x,_type] spawn player_zombieAttack;
					_x setVariable ["lastAttack",time];
				};
				_attacked = true;
			}
			else
			{
				if (_type == "zombie") then
				{
					if (speed _x < 4) then
					{
						[_x,"idle",(_chance + 4),true] call dayz_zombieSpeak;
					}
					else
					{
						[_x,"chase",(_chance + 3),true] call dayz_zombieSpeak;
					};
				};
			};
			//Noise Activation
			_targets = _x getVariable ["targets",[]];
			if (!(_unit in _targets)) then
			{
				if (_dist < DAYZ_disAudial) then
				{
					if (DAYZ_disAudial > 80) then
					{
						_targets set [count _targets,_unit];
						_x setVariable ["targets",_targets,true];
					}
					else
					{
						_cantSee = [_x,_unit] call dayz_losCheck;
						if (!_cantSee) then
						{
							_targets set [count _targets,_unit];
							_x setVariable ["targets",_targets,true];
						}
						else
						{
							if (_dist < (DAYZ_disAudial / 2)) then
							{
								_targets set [count _targets,_unit];
								_x setVariable ["targets",_targets,true];
							};
						};
					};
				};
			};
			//Sight Activation
			_targets = _x getVariable ["targets",[]];
			if (!(_unit in _targets)) then
			{
				if (_dist < DAYZ_disVisual) then
				{
					_tPos = (getPosASL _unit);
					_zPos = (getPosASL _x);
					_eyeDir = direction _x;
					_inAngle = [_zPos,_eyeDir,45,_tPos] call fnc_inAngleSector;
					if (_inAngle) then
					{
						_cantSee = [_x,_unit] call dayz_losCheck;
						if (!_cantSee) then
						{
							_targets set [count _targets,_unit];
							_x setVariable ["targets",_targets,true];
						};
					};
				};
			};
		};
	};
} forEach _listTalk;

if (_attacked) then
{
	if (r_player_unconscious) then
	{
		[_unit,"scream",3,false] call dayz_zombieSpeak;
	}
	else
	{
		_lowBlood = (r_player_blood / r_player_bloodTotal) < 0.5;
		if (_lowBlood) then
		{
			dayz_panicCooldown = time;
			[_unit,"panic",3,false] call dayz_zombieSpeak;
		};
	};
};