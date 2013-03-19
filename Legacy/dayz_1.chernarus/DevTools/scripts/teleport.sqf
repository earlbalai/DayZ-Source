if (isnil "cockasdashdioh" ) then {cockasdashdioh=0};

if (cockasdashdioh==0) then
{
	player addweapon "ItemGPS";
	cockasdashdioh=1;
};

closedialog 0;
sleep 0.5;
TitleText [format["Click on the map to Tele-Port"], "PLAIN DOWN"];

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] execVM ""DevTools\scripts\Teleport1.sqf""; True";
