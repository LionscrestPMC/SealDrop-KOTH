class BASIS
{
  tag="BASIS";
  class SQL
  {
    file="database";
	class receiveData {};
    class sendData {};
	class sendNewData {};
	class updateData {};
  };
};
class SDCLIENT
{
    tag="sd";
    class CLIENT
    {
        file="client";
        class initWest {};
        class initOpfor {};
        class initIndep {};
        class shopCfg {};
    };
    class CLIENT_FUNCTIONS
    {
        file="client\functions";
        class removeGear {};
        class volumeBalancerHigh {};
        class volumeBalancerLow {};
        class syncData {};
        class introCamera {};
        class savezones {};
        class unflip {};
        class postProcessing {};
        class noVoiceChats {};
        class playerStats {};
        class playerJump {};
    };
    class SHOP_CLOTHING
    {
        file="client\shops\clothingShop";
        class clothingShopEquip {};
        class clothingShopItemList {};
        class clothingShopMenu {};
        class clothingShopPriceSelect {};
    };
    class SHOP_WEAPON
    {
        file="client\shops\weaponShop";
        class weaponShopEquipSell {};
        class weaponShopItemList {};
        class weaponShopMenu {};
        class weaponShopSelect {};
    };
    class SHOP_VEHICLE
    {
        file="client\shops\vehicleShop";
        class vehicleShopMenu {};
        class vehicleShopSelect {};
        class vehicleShopSpawn {};
        class vehicleShopVehicleList {};
    };
    class SERVER
    {
        file="server";
        class eventHandler {};
        class briefing {};
        class onPlayerRespawn {};
        class onPlayerKilled {};
        class buttons {};
        class spawnTruck {};
        class blacklist {};
        class inventoryLock {};
        class escMenu {};
        class levelData {};
        class fetchCfgDetails {};
        class fetchVehicleCfg {};
        class handleItem {};
        class accType {};
        class mapPlayerTags {};
        class playerKilled {};
        class autoSave {};
    };
    class GUI
    {
        file="gui";
        class hudCreate {};
        class hudConfig {};
    };
};

    class VIEWSYSTEM
    {
        tag = "CHVD";
        class VIEWSYSTEM
        {
            file = "gui\viewSystem";
            class onCheckedChanged {};
            class onSliderChange {};
            class onLBSelChanged {};
            class onEBinput {};
            class onEBterrainInput {};
            class selTerrainQuality {};
            class updateTerrain {};
            class updateSettings {};
            class openDialog {};
            class localize {};
            class init {postInit = 1;};
        };
    };