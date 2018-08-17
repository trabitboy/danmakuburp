--test mobile version
--more ennemies
-- (boat / tanks with more lives)
-- more lives and death animation




cvsw=480
cvsh=640

pfx=0
pfy=64
pfw=448
pfh=576

ggx=448
ggy=64
ggw=32
ggh=576

plyspeed=3

score = 0
multiplier=1

-- is 1 2 or 3
rank=1
-- le rang change les comportements ennemis

--how much each pickup influences counter
rankstep=4
--chaque pickup augmente le rang
rankcounter=0
seuil2=5
seuil3=10
seuil4=15
seuil5=20
maxrank=25

-- pouic sur prise dommage
-- 3 vies ?
--rank banner ( rank up / rank down )
-- bg blitted to high !
-- cuisse de poulet 
-- audio rank transition
-- title pic
--game over pic
--victory pic
-- push rank to 5
--adjust ply collision margin
--bg change/ bg feed
-- next level even if still bullets
-- improve masking score area
--animation system
--satisfying point display on pickup ( X STUFF )



vscreen=love.graphics.newCanvas(cvsw,cvsh)

ply={}

android = false
if  love.system.getOS() == 'Android' then
  android = true
end
  --debug
android = true


function sizewindow()

	
	
  dw,dh=love.window.getDesktopDimensions()
  print(dh)
  print(dw)
  -- wh=dh-64
  -- print(wh)
  wh=dh
  print(wh)
  if android==true then
   ww=wh*4/3
  else
   ww=0.75*wh
  end
  print(ww)
  love.window.setMode(wh,ww)
  if android == true then
   scrsx=wh/cvsw
   scrsy=ww/cvsh
  else
   scrsx=ww/cvsw
   scrsy=wh/cvsh  
  end
   -- ww=480
  -- wh=600
  
  -- scrsx=ww/cvsw
  -- scrsy=wh/cvsh
  love.window.setMode(ww,wh)
 end

function rdrvscreen()
 love.graphics.setCanvas()
 -- love.graphics.rotate(-math.pi / 2)
 -- if android == true then
  -- love.graphics.translate(ww/2, wh/2)
  -- love.graphics.rotate(math.pi / 2)
  -- love.graphics.translate(-ww/2, -wh/2) 
 -- end
 if android == true then
  love.graphics.translate(ww/2, wh/2)
  love.graphics.rotate(math.pi / 2)
  love.graphics.translate(-wh/2, -ww/2) 
 end
 love.graphics.draw(vscreen,0,0,0,scrsx,scrsy)
end

require("events")
require("lvl")
require("coll")
require("gameover")
require("tuto")
require("title")
require("victory")
require("baddybullet")
require("maingameloop")
require("plybullet")
require("bg")
require("ghost")
require("drawgame")
require("boss")
require("touchsupport")

print(levels)
print(currLvl)

sizewindow()


print(lvl)

-- for i=1, table.getn(lvl) do
 -- print(lvl[i])
-- end





function love.load()

 boss=love.graphics.newImage("boss.png")
 scoremask=love.graphics.newImage("scoremask.png")
 title=love.graphics.newImage("title.png")
 gameover=love.graphics.newImage("gameover.png")
 victory=love.graphics.newImage("victory.png")

 rankup = love.audio.newSource("sounds/rankupshort.wav", "static")
 rankdown = love.audio.newSource("sounds/rankdownshort.wav", "static")
 
 piou = love.audio.newSource("sounds/pioushort.wav", "static")
 miom = love.audio.newSource("sounds/miom.wav", "static")
 fire = love.audio.newSource("sounds/fireshort.wav", "static")
 aie=love.audio.newSource("sounds/aieshort.wav", "static")
 
 blank=love.graphics.newImage("blank.png")
 
 rank1=love.graphics.newImage("rank1.png")
 rank2=love.graphics.newImage("rank2.png")
 rank3=love.graphics.newImage("rank3.png")

 xpl=love.graphics.newImage("explosion.png")

 bb=love.graphics.newImage("bb.png")
 
 bg1=love.graphics.newImage("bg1.png")
 bg2=love.graphics.newImage("bg2.png")
 
 devil=love.graphics.newImage("devil.png")

 pill=love.graphics.newImage("pill.png")
 
 ply.pic=devil
 ply.picdata=devil:getData()
 ply.w=ply.picdata:getWidth()
 ply.h=ply.picdata:getHeight()
 ply.hbx=computebox(8,ply.picdata)
 print("loading p.w")
 print(ply.w)
 ghost=love.graphics.newImage("ghost.png")
 bullet=love.graphics.newImage("bullet.png")
 image=ghost:getData()
 -- local image = love.image.newImageData( 'path/to/Image.png' )
 -- local pixels = {}
  -- for x = 1, image:getWidth() do
    -- for y = 1, image:getHeight() do
        -- -- Pixel coordinates range from 0 to image width - 1 / height - 1.
        -- local pixel = image:getPixel( x - 1, y - 1 )
		-- -- print(pixel)
        -- pixels[#pixels + 1] = pixel
    -- end
  -- end
 
 end

x=100

drawfunc=drawtitle
updatefunc=updatetitle

function love.draw()
 drawfunc()
end

function love.update()
  updatefunc()
end

