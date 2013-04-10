private["_obj","_type","_config","_positions","_itemTypes","_lootChance","_iPos","_nearBy","_index","_weights","_cntWeights","_itemType"];

_obj = 			_this select 0;
_type = 		typeOf _obj;
_config = 		configFile >> "CfgBuildingLoot" >> _type;
_positions =	[] + getArray (_config >> "lootPos");
_itemTypes =	[] + getArray (_config >> "lootType");
_lootChance =	getNumber (_config >> "lootChance");
_lootChance = _lootChance * 10;
_countPositions = count _positions;


{
	_rnd = ceil(random 10);
	_iPos = _obj modelToWorld _x;
	_nearBy = nearestObjects [_iPos, ["WeaponHolder","WeaponHolderBase"], 2];
diag_log format["Random Number: %1, LootChance: %2",_rnd, _lootchance];	
	if (_rnd <= _lootChance) then {
		if (count _nearBy == 0) then {
			_index = dayz_CBLBase find _type;		
			_weights = dayz_CBLChances select _index;
			_cntWeights = count _weights;
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_itemType = _itemTypes select _index;
diag_log format["Item: %1, Group: %2", _itemType select 0, _itemType select 1];			
			[_itemType select 0, _itemType select 1 , _iPos, 0.0] call spawn_loot;
		};
	};	
	sleep 0.03;
} forEach _positions;
