if (isnil "Ug8YtyGyvguGF" ) then {Ug8YtyGyvguGF=0};

if (Ug8YtyGyvguGF==0) then
{
	Ug8YtyGyvguGF=1;
	hint "Infinite Ammo ON!";
	while {Ug8YtyGyvguGF==1} do
	{
	vehicle player setVehicleAmmo 0.99;
	sleep 0.01;
	}

}
else
{
hint "Infinite Ammo OFF!";
Ug8YtyGyvguGF=0;
};




