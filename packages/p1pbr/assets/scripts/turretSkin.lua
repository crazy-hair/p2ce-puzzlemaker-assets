local pos = Item.getPosition();
local rot = Item.getRotation();

local throughPortals = Item.getKv("AllowShootThroughPortals");
local maxRange = Item.getKv("turretrange");
local pushPlayer = Item.getKv("damageforce");

local turret = Entity.new("turret", "npc_portal_turret_floor", { 0, 0, 0 }, { 0, 0, 0 });

turret:transform({ 0, 0, 0.025 }, { 90, 0, 0 });
turret:transform(pos, rot);

turret:addOutput("OnTipped", turret, "skin", "1");

turret:setKv("model", "models/p1pbr/props/turret_01.mdl");
turret:setKv("modelindex", 5);
turret:setKv("spawnflags", 4);

turret:setKv("AllowShootThroughPortals", throughPortals);
turret:setKv("turretrange", maxRange);
turret:setKv("damageforce", pushPlayer);