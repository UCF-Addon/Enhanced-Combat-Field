#include "script_component.h"
/*
 * Author: Julius
 * description
 *
 * Arguments:
 * 0: marker <STRING>
 * 1: args <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_marker", nil], ["_args", [], [[]]]];

if (isNil "_marker" || (count _args) != 4) exitWith {};

private _text = "";
private _color = getMarkerColor _marker;
private _type = getMarkerType _marker;
private _pos = getMarkerPos _marker;

if (!isNil (_args select 0)) then
{
	_color = _args select 0;
};

if (!isNil (_args select 1)) then
{
	_type = _args select 1;
};

if ((!isNil (_args select 2)) && ((count (_args select 2)) == 3)) then
{
	_pos = _args select 2;
};

for "_i" from 0 to (count (_args select 3)) - 1 do
{
	_text = format ["%1%2", _text, ((_args select 3) select _i)];
};

if (_text != "") then
{
	_marker setMarkerText _text;
};

_marker setMarkerColor _color;
_marker setMarkerType _type;
_marker setMarkerPos _pos;