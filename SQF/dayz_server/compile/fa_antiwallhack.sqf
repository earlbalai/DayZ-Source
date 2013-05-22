private ["_antiwallhack","_houseType","_houseList","_tmp","_patchList","_house","_o"];

_antiwallhack=[
	[
		"Land_A_Hospital",  // building type
		[
			[6414.05,2760.21,0], [6817.3,2702.03,0], [10517.9,2287.55,0], [11956.7,9120.21,0] // optional precomputed building positions
		],
		[
			[17.6694,-1.9502,3.24185,"Land_CncBlock_D",0] // what to add on building (coordinates/type/angle)
		]
	],
	[
		"Land_HouseB_Tenement",
		[
			[6855.66,2496.78,0]
		],
		[
			[-9.66602,7.66602,18.3236,"Fort_RazorWire",0], [-1.30273,7.66602,18.3236,"Fort_RazorWire",0], [-9.66602,0.814453,18.3236,"Fort_RazorWire",0], [-1.30273,0.814453,18.3236,"Fort_RazorWire",0], [-15.0029,4.18359,18.3236,"Fort_RazorWire",90], [3.62109,3.95117,18.3236,"Fort_RazorWire",270]
		]
	]
];


{
	_houseType = _x select 0;
	_houseList = _x select 1;
	if (count _houseList == 0) then { 
		_houseList = (getMarkerpos "center") nearObjects [_houseType, 20000];
	}
	else {
		_tmp = [];
		{
			_tmp set [count _tmp, _x nearestObject _houseType];
		} forEach _houseList;
		_houseList = _tmp;
	};
	_patchList = _x select 2;
	{
		_house = _x;
		{
			_pos = +(_x);
			_pos resize 3;
			_pos = _house modelToWorld _pos;
			_o = (_x select 3) createVehicle _pos;
			_o setDir ((getDir _house)+(_x select 4));
			_o setPosATL _pos;
		} forEach _patchList;
		diag_log(format["::: %1 %2", _houseType, getPosATL _house ]);
	} forEach _houseList;
} forEach antiwallhack;
