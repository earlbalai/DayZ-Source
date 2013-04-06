private["_obj","_type","_config","_positions","_itemTypes","_lootChance","_iPos","_nearBy","_index","_weights","_cntWeights","_itemType"];

_obj = 			_this select 0;
_type = 		typeOf _obj;
_config = 		configFile >> "CfgBuildingLoot" >> _type;
_positions =	[] + getArray (_config >> "lootPos");
_itemTypes =	[] + getArray (_config >> "lootType");
_lootChance =	getNumber (_config >> "lootChance");
{
	if ((random 1) < _lootChance) then {
		_iPos = _obj modelToWorld _x;
		_nearBy = nearestObjects [_iPos, ["WeaponHolder","WeaponHolderBase"], 1];
		if (count _nearBy == 0) then {
			_index = dayz_CBLBase find _type;
			_weights = dayz_CBLChances select _index;
			_cntWeights = count _weights;
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_itemType = _itemTypes select _index;
<<<<<<< HEAD
			[_itemType select 0, _itemType select 1 , _iPos, 0.0] call spawn_loot;
			_obj setVariable ["created",(DateToNumber date),true];
=======
			[_itemType select 0, _itemType select 1 , _iPos, 0.0]  call spawn_loot;
>>>>>>> Development
		};
	};
} forEach _positions;