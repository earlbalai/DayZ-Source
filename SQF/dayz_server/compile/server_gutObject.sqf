private["_item","_qty","_type","_meat","_loop"];
_item = _this select 0;
_qty = _this select 1;
_type = typeOf _item;
_meat = 0;
_loop = true;
if (local _item) then {
	for "_x" from 1 to _qty do {
	diag_log ("Item Type: " +str(_item));
		switch (_type) do {
			case "Cow": {
				_item addMagazine "FoodSteakRaw";
			};
			case "Goat": {
				_item addMagazine "FoodSteakRaw";
			};
			case "Sheep": {
				_item addMagazine "FoodSteakRaw";
			};
			case "WildBoar": {
				_item addMagazine "FoodboarRaw";
			};
			case "hen": {
				_item addMagazine "FoodSteakRaw";
			};
			case "Rabbit": {
				_item addMagazine "FoodSteakRaw";
			};	
		};
	};
	sleep 2;
	_timer = time;
	while {_loop} do {
		_meat = count magazines _item;
		if (_meat == 0) then {_loop = false};
		if ((time - _timer) > 300) then {_loop = false};
		sleep 1;
	};
	["dayzHideBody",_item] call broadcastRpcCallAll;
	sleep 10;
	deleteVehicle _item;
} else {
	_ehLoc = "client";
	if (isServer) then { _ehLoc = "server"; };
	diag_log format["gutObject EH on %1 item not local ! Type: %2",_ehLoc,str(_item)];
};