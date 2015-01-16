
_unit = _this select 0;
inJail = true;

if ( inJail ) then
    {
        while {true} do
        {
            _entity_array = (getPos _unit) nearEntities ["CAManBase",50];
            {
                if (_x isKindof "zZombie_Base") then {
                    deletevehicle _x;
                };
            } forEach _entity_array;
            sleep 0.1;
        };
    };