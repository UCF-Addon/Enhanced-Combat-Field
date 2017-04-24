#include "script_component.h"

params [["_posASL", [], [[]]], ["_obj", objNull, [objNull]], ["_selection", "", [nil, ""]]];

if (isNull _obj) exitWith { false };
if (count _posASL < 3) exitWith { false };
if (isNil "_selection" || _selection == "") exitWith { false };

if ((str _selection) find "door" > -1) then
{
	private _posRel = _obj selectionPosition _selection;
	private _posMTW = _obj modelToWorld _posRel;
	private _posAGL = ASLToAGL _posASL;

	// TODO: positon of hinge or door latch
	// QuickFix: center of door with radius 0.15
	if ((_posMTW distance2D _posAGL) < 0.15) then
	{
		if ((_posMTW select 2) - (_posAGL select 2) < 0.15) exitWith { true };
	};

	if (true) exitWith { false };
};

false