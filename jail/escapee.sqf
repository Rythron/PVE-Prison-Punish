_unit = _this select 0;

if (!alive _unit) exitWith {isKiller=false;};
waitUntil {inJail};

sleep 2;

waitUntil {_unit distance Prison > 90};


	
customRemoteMessage = ['titleCut', "WARNING: YOU WILL GET SHOT WHEN TRYING TO ESCAPE\nIT WILL AlSO COST YOU 2 BRIEFCASES", _unit];
publicVariable "customRemoteMessage";
	





