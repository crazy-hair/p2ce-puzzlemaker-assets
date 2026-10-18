local pos = Item.getPosition();
local rot = Item.getRotation();
local size = Item.getSize();

local hurt = Entity.new("hurt", "trigger_hurt", pos, { 0, 0, 0 });
local noportal = Entity.new("noportal", "func_noportal_volume", pos, { 0, 0, 0 });
local dissolve = Entity.new("dissolve", "trigger_multiple", pos, { 0, 0, 0 });
local filter = Entity.new("filter", "filter_activator_class", pos, { 0, 0, 0 });
local fog = Entity.new("fog", "obb_volumefog", { pos[1] + (size[1] / 2), pos[2] + (size[2] / 2), pos[3] + (size[3] / 2) }, { 0, 0, 0 });

local gooBrush = Brush.new({ 0, 0, 0 }, { size[1], size[2], size[3] });
local hurtBrush = Brush.new({ 0, 0, 0 }, { size[1], size[2], size[3] });
local noportalBrush = Brush.new({ 0, 0, 0 }, { size[1], size[2], size[3] });
local dissolveBrush = Brush.new({ 0, 0, 0 }, { size[1], size[2] - 1, size[3] });

gooBrush:setTexture(0, "TOOLS/TOOLSNODRAW");
gooBrush:setTexture(1, "TOOLS/TOOLSNODRAW");
gooBrush:setTexture(2, "p1pbr/nature/hazard_liquid");
gooBrush:setTexture(3, "TOOLS/TOOLSNODRAW");
gooBrush:setTexture(4, "TOOLS/TOOLSNODRAW");
gooBrush:setTexture(5, "TOOLS/TOOLSNODRAW");

for i = 0, 5 do
  hurtBrush:setTexture(i, "TOOLS/TOOLSTRIGGER");
end
for i = 0, 5 do
  noportalBrush:setTexture(i, "TOOLS/TOOLSINVISIBLE");
end
for i = 0, 5 do
  dissolveBrush:setTexture(i, "TOOLS/TOOLSTRIGGER");
end

gooBrush:transform({ 0, 0, 0 }, { 90, 0, 0 });
gooBrush:transform(pos, rot);
hurtBrush:transform({ 0, 0, 0 }, { 90, 0, 0 });
hurtBrush:transform(pos, rot);
dissolveBrush:transform({ 0, 0, 0 }, { 90, 0, 0 });
dissolveBrush:transform(pos, rot);
fog:transform({ 0, 8 / 64, 0 }, { 0, 0, 0 });

hurt:setKv("spawnflags", 1);
hurt:setKv("damagetype", 1048576);
hurt:setKv("damage", 100);
hurt:setKv("nodmgforce", 1);
dissolve:setKv("spawnflags", 8);
dissolve:setKv("filtername", filter);
filter:setKv("filterclass", "prop_weighted_cube");
fog:setKv("width", size[3] * 64);
fog:setKv("height", (size[2] * 64) + 16);
fog:setKv("depth", size[1] * 64);
fog:setKv("scattering_color", "102 96 0 255");
fog:setKv("density", 0.1);

dissolve:addOutput("OnStartTouch", "!activator", "silentdissolve");

hurt:attachBrush(hurtBrush);
noportal:attachBrush(noportalBrush);
dissolve:attachBrush(dissolveBrush);