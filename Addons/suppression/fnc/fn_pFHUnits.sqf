#include "script_component.h"
/**
*   Per Frame Handler
*       Units
*/

private _array = GMVAR(bulletPos);
GMVAR(bulletPos) = [];

// TODO: merge algorithm for position to reduce amount of bullets

// Debug //if (GMVAR(__nextFrame) > diag_tickTime) exitWith { true };

/* Debug */
#ifdef ECF_DEBUG
_start = diag_tickTime;
_skip = 1;
/* !Debug */
#endif

{
    if (!isNull _x && alive _x && !isPlayer _x) then
    {
    	_unit = _x;

    	if (_unit getVariable [QGMVAR(setup), _false] != _true) then
    	{
			[_unit] call DFUNC(initUnit);
    	};

    	if (_unit getVariable [QGMVAR(setup), _false] == _true) then
    	{
			// Evaluate the count of bullets near the unit
			//_count = _unit getVariable [QGMVAR(count), 0];
			_new = [];

			{
				_pos = _x select 0;
				_side = _x select 1;
				_origin = _x select 2;

				if ((side _unit) != _side) then
				{
					_dist = _pos distance _unit;
                    if (_dist <= GMVAR(__maxEffectDistance)) then
                    {
                    	_new pushBack _dist;
                    };
				};
			} forEach _array;

			// Evaluate the Coefficient for Supression
			_coef = _unit getVariable [QGMVAR(coef), 0];

			if (count _new <= 0) then
			{
				// Reduce Suppression by Coefficient
				_coef = _coef - 0.0325 * _skip;
				_coef = _coef max 0;
			} else
			{
				{
					if (_x <= GMVAR(__maxEffectDistance)) then
					{
						_coef = _coef + (_x / GMVAR(__effectiveCoef));
					};
				} forEach _new;
			};

			_coef = _coef min 180; // ==> 180 / 50 ==> 110s
			_unit setVariable [QGMVAR(coef), _coef, false];

			// Effect the unit by Coefficient and Bullet count
			if (_coef > 0) then
			{
				_dir = -1;
				[_unit, _coef, _dir] call DFUNC(getCover);
				[_unit, _coef] call DFUNC(effectStance);
				[_unit, _coef] call DFUNC(decSkill);

				_unit setVariable [QGMVAR(effected), _true, false];
			} else
			{
				if ((_unit getVariable [QGMVAR(effected), _true]) == _true) then
				{
					[_unit] call DFUNC(resetCover);
                    [_unit] call DFUNC(resetStance);
                    [_unit] call DFUNC(resetSkill);

                    _unit setVariable [QGMVAR(effected), _false, false];
				};
			};
    	};
    };
} forEach allUnits - entities "HeadlessClient_F";

/* Debug */
#ifdef ECF_DEBUG
_stop = diag_tickTime;

if (isNil QGMVAR(debugTimer)) then
{
	GMVAR(debugTimer) = [];
};

GMVAR(debugTimer) pushBack (_stop - _start);
if ((count GMVAR(debugTimer)) >= 250) then
{
	_sum = 0;
	{
		_sum = _sum + _x;
	} forEach GMVAR(debugTimer);

	diag_log format ["pFH ( Units ): ~ %1ms = %2FPS", (_sum / 250), (_sum / 250 / 20)];
	GMVAR(debugTimer) = [];
};
/* !Debug */
#endif

true