#include "script_component.h"

ADDON = false;

#include "XEH_PREP.h"

// Per Frame Handler
GMVAR(behaviourpFH) = true;
GMVAR(clearuppFH) = true;
GMVAR(centerpFH) = true;
GMVAR(objectpFH) = false;
GMVAR(trafficpFH) = false;

// Traffic Subtasks
GMVAR(trafficpFHCar) = false;
GMVAR(trafficpFHHeli) = false;
GMVAR(trafficpFHBoat) = false;

// Civilian Subtasks
GMVAR(civilianpFH) = false;

// Spawn Timers ( Timeouts )
GMVAR(DOUBLE(car,triggerSpawnTimeout)) = 200; // every 4 sec
GMVAR(DOUBLE(civ,triggerSpawnTimeout)) = 80;
GMVAR(DOUBLE(fur,triggerSpawnTimeout)) = 250; // every 5 sec
GMVAR(DOUBLE(hel,triggerSpawnTimeout)) = 700;
GMVAR(DOUBLE(par,triggerSpawnTimeout)) = 750;

// Spawn
GMVAR(DOUBLE(car,spawnMaxRadius)) = 580;
GMVAR(DOUBLE(car,spawnMinRadius)) = 250;
GMVAR(DOUBLE(civ,spawnMaxRadius)) = 90;
GMVAR(DOUBLE(civ,spawnMinRadius)) = 25;
GMVAR(DOUBLE(fur,spawnRadius)) = 75;
GMVAR(DOUBLE(par,spawnPercenage)) = 0.75;
GMVAR(DOUBLE(par,spawnRadius)) = 250;

// Despawn
GMVAR(DOUBLE(car,despawnRadius)) = 750;
GMVAR(DOUBLE(par,despawnRadius)) = 375;

// Waypoints
GMVAR(DOUBLE(car,wpAmount)) = 12;
GMVAR(DOUBLE(car,wpMaxRadius)) = 650;
GMVAR(DOUBLE(car,wpMinRadius)) = 75;
GMVAR(DOUBLE(civ,wpAmount)) = 15;
GMVAR(DOUBLE(civ,wpMaxRadius)) = 150;
GMVAR(DOUBLE(civ,wpMinRadius)) = 15;

// Civilian Interaction
GMVAR(DOUBLE(civ,interactDistance)) = 15;
GMVAR(DOUBLE(civ,minTimeout)) = 20;

ADDON = true;