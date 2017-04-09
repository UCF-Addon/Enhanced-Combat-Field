class CBA_Extended_EventHandlers;

class CfgVehicles {
  class ThingX;
  //Laptops
  class Land_Laptop_F: ThingX {
    class EventHandlers {
      class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
    GVAR(download) = 1;
    GVAR(upload) = 1;
  };
  class Land_Laptop_unfolded_F: ThingX {
    class EventHandlers {
      class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
    GVAR(download) = 1;
    GVAR(upload) = 1;
  };
  class Land_Laptop_device_F: ThingX {
    class EventHandlers {
      class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
    GVAR(download) = 1;
    GVAR(upload) = 1;
  };

  class Item_Base_F;
  class ECF_DownloadItem: Item_Base_F {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(USB_Download);
    author = AUTHORS;
    vehicleClass = "Items";
    class TransportItems {
      MACRO_ADDITEM(ECF_Download,1);
    };
  };
  class ECF_UploadItem: Item_Base_F {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(USB_Upload);
    author = AUTHORS;
    vehicleClass = "Items";
    class TransportItems {
      MACRO_ADDITEM(ECF_Upload,1);
    };
  };
};
