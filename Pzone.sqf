/*
/*
	Written by Dami
	ReWritten by: Rythron
*/

if (isServer) exitWith {
	"PVOZ_EPOCH_PZONE" addPublicVariableEventHandler {
		_msg = _this select 1;
		_msg = str(_msg);
		if (isServer) then {
			[nil, nil, rspawn, [_msg], {systemChat (_this select 0);}] call RE;
		};
	};
};
[] spawn {
	
	if (isNil "inPzone") then {inPzone = false;};
	while {true} do {
		waitUntil {sleep 1;(inPzone)};
		dami_PzCHK = false;
		canbuild = false;
		PZ_SkTyp = typeOf player;
		_txt = "You have entered Prison!";
		systemChat ("Prison: "+str _txt+"");
		cutText [_txt,"PLAIN DOWN"];
		["Prison"] spawn bis_fnc_infotext;
		waitUntil {sleep 1;((!inPzone)||(typeOf player != PZ_SkTyp))};
		if (inPzone) then {
			if (typeOf player != PZ_SkTyp) then {
				[] spawn {
					inPzone = false;
					_txt = "Skin change detected!";
					systemChat ("Prison: "+str _txt+"");
					waitUntil {dami_PzCHK};
					inPzone = true;
				};
			};
		};
		waitUntil {sleep 1;(!inPzone)};
		canbuild = true;
		dami_PzCHK = true;
		_txt = "You have left Prison!";
		systemChat ("Prison: "+str _txt+"");
		cutText [_txt,"PLAIN DOWN"];
	};
};

   