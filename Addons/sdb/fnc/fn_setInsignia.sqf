#include "script_component.h"
/*
 * Author: Lt. Julius
 * Sets the ensignia for rank and class
 *
 * Arguments:
 * 0: player <OBJECT>
 * 1: classid <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_player", objNull], ["_classid", 0]];

if (isNull _player || _classid < 1) exitWith {};

private _rank = (format ["getRank:%1", (getPlayerUID _player)]) call DFUNC(dbSelectField);

private _type = "";

switch (_classid) do
{
	case "1": { _type = ""; };
	case "2": {	_type = "EOD"; };
	case "3": {	_type = "GL"; };
	case "4": {	_type = "SN"; };
	case "5": {	_type = "AT"; };
	case "6": {	_type = "MG"; };
	case "7": {	_type = ""; };
	case "8": {	_type = "ME"; };
	case "9": {	_type = "AIR"; };
};

private _strRank = "";

switch (_rank) do
{
	case "1": { _strRank = "Private"; };
	case "2": { _strRank = "Corporal"; };
	case "3": { _strRank = "Sergeant"; };
	case "4": { _strRank = "Master_Sergeant"; };
	case "5": { _strRank = "Master_Chief"; };
	case "6": { _strRank = "War_Chief"; };
};

private _str = format ["%1_%2", _type, _strRank];

[_player, _str] call BIS_fnc_setUnitInsignia;