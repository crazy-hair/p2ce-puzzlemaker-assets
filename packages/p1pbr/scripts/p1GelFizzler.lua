local pos = Item.getPosition();
local rot = Item.getRotation();
local size = Item.getSize();
local tile = Item.getTile();

local startDisabled = Item.getKv("startdisabled");

local trigger = Entity.new("trigger", "trigger_paint_cleanser", pos, { 0, 0, 0 });

local triggerBrush = Brush.new({ 0, 0, -1 / 64 }, { size[1], size[2] * tile[2], 1 / 64 });

for i = 0, 5 do
  triggerBrush:setTexture(i, "TOOLS/TOOLSTRIGGER");
end

triggerBrush:transform({ 0, 0, 0 }, { 90, 0, 0 });
triggerBrush:transform(pos, rot);

trigger:setKv("spawnflags", 8);
trigger:setKv("startdisabled", startDisabled);

trigger:attachBrush(triggerBrush);
trigger:markAsIO();

local particleWidth = 3;
local particleCount = math.floor(size[1] / particleWidth) + 1;
--print(particleCount);

local leftProp = nil;
local particle = nil;

for i = 1, tile[2] do
  local leftPropPos = { 0.125, i * 2 - 1, 0 };
  local rightPropPos = { size[1] - 0.125, i * 2 - 1, 0 };

  leftProp = Entity.new("prop", "prop_static", leftPropPos, { 0, 0, 0 });
  leftProp:setKv("model", "models/p1pbr/props/portal_cleanser_1.mdl");
  leftProp:setKv("solid", 6);
  leftProp:setKv("skin", 2);
  leftProp:transform({ 0, 0, 0 }, { 90, 0, 0 });
  leftProp:transform(pos, rot);

  local rightProp = Entity.new("prop", "prop_static", rightPropPos, { 0, 180, 0 });
  rightProp:setKv("model", "models/p1pbr/props/portal_cleanser_1.mdl");
  rightProp:setKv("solid", 6);
  rightProp:setKv("skin", 2);
  rightProp:transform({ 0, 0, 0 }, { 90, 0, 0 });
  rightProp:transform(pos, rot);

  if (size[1] >= 2.5) then
    particle = Entity.new("particles", "info_particle_system", leftPropPos, { 0, -90, 0 });
    particle:setKv("effect_name", "p1pbr/cleanser_edge_1_red");
    particle:setKv("start_active", not startDisabled);
    particle:transform({ 0, 0, 0 }, { 90, 0, 0 });
    particle:transform(pos, rot);

    particle = Entity.new("particles", "info_particle_system", rightPropPos, { 0, 90, 0 });
    particle:setKv("effect_name", "p1pbr/cleanser_edge_1_red");
    particle:setKv("start_active", not startDisabled);
    particle:transform({ 0, 0, 0 }, { 90, 0, 0 });
    particle:transform(pos, rot);
  end

  for j = 1, particleCount do
    local entPos = { 0, 0, 0 };
    entPos[1] = size[1] / (particleCount + 1) * j;
    entPos[2] = i * 2 - 1;
    particle = Entity.new("particles", "info_particle_system", entPos, { 0, 90, 0 });
    particle:setKv("effect_name", "p1pbr/portal_cleanser_red");
    particle:setKv("start_active", not startDisabled);
    particle:transform({ 0, 0, 0 }, { 90, 0, 0 });
    particle:transform(pos, rot);
  end
end

trigger:addOutput("OnUser1", trigger, "disable");
trigger:addOutput("OnUser2", trigger, "enable");
trigger:addOutput("OnUser1", particle, "stop");
trigger:addOutput("OnUser2", particle, "start");
