_unit = _this select 0;
_veh = (vehicle _unit);

if (!alive _unit) exitWith {terminate jail;};
inJail=true;

sleep 1;
customRemoteMessage = ['titleCut', "You will be send to Prison for killing a player.", _unit];
publicVariable "customRemoteMessage";
sleep 5;


// These are the Arma 2 air vehicles that have pilot "manual fire" capabilities as well as gunner and passenger seats. 
// If Pilot is jailed for a manual fire team kill - one of the crew will move into the pilot seat.
// This only works for vehicles that have "pilot manaul fire" capabilities. 
// Only modify this part if you have "Addon" air vehicles that you would like to add this feature to, otherwise do not change this.

if ( (driver _veh == _unit) && ((_veh isKindOf "Ka52") OR (_veh isKindOf "Ka52Black") OR (_veh isKindOf "pook_H13_gunship") OR (_veh isKindOf "AH6J_EP1") OR (_veh isKindOf "UH60M_EP1_DZ") OR (_veh isKindOf "Mi17_rockets_RU") OR (_veh isKindOf "Ka60_GL_PMC") OR (_veh isKindOf "AH1Z") OR (_veh isKindOf "AW159_Lynx_BAF")) ) then {
	null = [_unit] execVM "addons\jail\toDriver.sqf";
};



if (_veh != _unit) then {
	doGetOut _unit;
	sleep 0.5;
};
sleep 0.5;

[_unit]execVM "addons\jail\jail.sqf";




