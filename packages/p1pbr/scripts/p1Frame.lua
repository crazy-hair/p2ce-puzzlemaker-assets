local pos = Item.getPosition();
local rot = Item.getRotation();
local size = Item.getSize();

local left = Entity.new("left", "func_detail", pos, { 0, 0, 0 });
local right = Entity.new("right", "func_detail", pos, { 0, 0, 0 });
local top = Entity.new("top", "func_detail", pos, { 0, 0, 0 });
local bottom = Entity.new("bottom", "func_detail", pos, { 0, 0, 0 });

local leftBrush = Brush.new({ 0, 0, 0 }, { 4 / 64, size[2], 32 / 64 });
local rightBrush = Brush.new({ 0, 0, 0 }, { 4 / 64, size[2], 32 / 64});
local topBrush = Brush.new({ 0, 0, 0 }, { size[1] - (8 / 64), 4 / 64, 32 / 64 });
local bottomBrush = Brush.new({ 0, 0, 0 }, { size[1] - (8 / 64), 4 / 64, 32 / 64 });

local vertOps = {
  alignment = TextureAlignment.BottomLeft,
  rotation = 90
};
local horizOps = {
  alignment = TextureAlignment.BottomLeft,
};

leftBrush:setTexture(0, "p1pbr/plastic/plasticwall001a");
leftBrush:setTexture(1, "p1pbr/plastic/plasticwall001a");
leftBrush:setTexture(2, "p1pbr/plastic/plasticwall001a");
leftBrush:setTexture(3, "p1pbr/plastic/plasticwall001a");
leftBrush:setTexture(4, "p1pbr/plastic/plasticwall004a", vertOps);
leftBrush:setTexture(5, "p1pbr/plastic/plasticwall004a", vertOps);

rightBrush:setTexture(0, "p1pbr/plastic/plasticwall001a");
rightBrush:setTexture(1, "p1pbr/plastic/plasticwall001a");
rightBrush:setTexture(2, "p1pbr/plastic/plasticwall001a");
rightBrush:setTexture(3, "p1pbr/plastic/plasticwall001a");
rightBrush:setTexture(4, "p1pbr/plastic/plasticwall004a", vertOps);
rightBrush:setTexture(5, "p1pbr/plastic/plasticwall004a", vertOps);

topBrush:setTexture(0, "p1pbr/plastic/plasticwall001a");
topBrush:setTexture(1, "p1pbr/plastic/plasticwall001a");
topBrush:setTexture(2, "p1pbr/plastic/plasticwall001a");
topBrush:setTexture(3, "p1pbr/plastic/plasticwall001a");
topBrush:setTexture(4, "p1pbr/plastic/plasticwall004a", horizOps);
topBrush:setTexture(5, "p1pbr/plastic/plasticwall004a", horizOps);

bottomBrush:setTexture(0, "p1pbr/plastic/plasticwall001a");
bottomBrush:setTexture(1, "p1pbr/plastic/plasticwall001a");
bottomBrush:setTexture(2, "p1pbr/plastic/plasticwall001a");
bottomBrush:setTexture(3, "p1pbr/plastic/plasticwall001a");
bottomBrush:setTexture(4, "p1pbr/plastic/plasticwall004a", horizOps);
bottomBrush:setTexture(5, "p1pbr/plastic/plasticwall004a", horizOps);

leftBrush:transform({ size[1] - ( 4 / 64 ), 16 / 64, 0 }, { 90, 0, 0 });
leftBrush:transform(pos, rot);

rightBrush:transform({ 0, 16 / 64, 0 }, { 90, 0, 0 });
rightBrush:transform(pos, rot);

topBrush:transform({ 4 / 64, 16 / 64, size[2] - (4 / 64) }, { 90, 0, 0 });
topBrush:transform(pos, rot);

bottomBrush:transform({ 4 / 64, 16 / 64, 0 }, { 90, 0, 0 });
bottomBrush:transform(pos, rot);


left:attachBrush(leftBrush);
right:attachBrush(rightBrush);
top:attachBrush(topBrush);
bottom:attachBrush(bottomBrush);