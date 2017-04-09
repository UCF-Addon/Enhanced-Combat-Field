class CBA_Extended_EventHandlers;

class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class Ace_SelfActions {
      class ECF_AssignTarget {
        displayName = CSTRING(AssignTarget);
        condition = QUOTE([_player] call DFUNC(isGunner) && !([] call DFUNC(targetMarked)));
        exceptions[] = {"isNotDragging","notOnMap","isNotInside","isNotSitting"};
        statement = QUOTE ([_player] call DFUNC(assignTarget));
        priority = 1.5;
        icon = QUOTE(a3\ui_f\data\IGUI\Cfg\Revive\overlayIcons\f75_ca.paa);
      };
      class ECF_deleteTarget {
        displayName = CSTRING(DeleteTarget);
        condition = QUOTE([_player] call DFUNC(isGunner) && ([] call DFUNC(targetMarked)));
        exceptions[] = {"isNotDragging","notOnMap","isNotInside","isNotSitting"};
        statement = QUOTE ([_player] call DFUNC(deleteTarget));
        priority = 1.5;
        icon = QUOTE(a3\ui_f\data\IGUI\Cfg\Revive\overlayIcons\f75_ca.paa);
      };
    };
  };
};