"dayzLoadReady" addPublicVariableEventHandler {(_this select 1) call client_LoadReady};

client_LoadReady = {
	dayzLoad = [player,"0"];
	publicVariableServer "dayzLoad";
};

sleep 10;

// start the load
dayzLoad = [player];
publicVariableServer "dayzLoad";