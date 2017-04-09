class CfgWeapons {
  class InventoryItem_Base_F;

  class Ace_ItemCore;
  class ECF_Download: Ace_ItemCore {
    scope = 2;
    model = QUOTE(\A3\Structures_F\Items\Stationery\PenBlack_F.p3d);
    picture = QPATHOF(data\usb_stick.paa);
    displayName = CSTRING(USB_Download);
    descriptionShort = CSTRING(Downloaded_Files);
    class ItemInfo: InventoryItem_Base_F {
      mass = 1;
    };
  };

  class ECF_Upload: Ace_ItemCore {
    scope = 2;
    model = QUOTE(\A3\Structures_F\Items\Stationery\PenBlack_F.p3d);
    picture = QPATHOF(data\usb_stick.paa);
    displayName = CSTRING(USB_Upload);
    descriptionShort = CSTRING(Upload_Files);
    class ItemInfo: InventoryItem_Base_F {
      mass = 1;
    };
  };
};
