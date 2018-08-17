
function checklvlup()
 if #gameobjs==0 and #evtbuffer==0 then
    print("next lvl")
	currentLvl=currentLvl+1
	startCurrLvl()
 end
end


function tickdownrank()
 if tickdowninhib>0 then
  tickdowninhib=tickdowninhib-1
 end

 if tickdowninhib==0 and rankcounter>0 then
  rankcounter=rankcounter-1
  tickdowninhib=60
 end
end

function maintainglobrank()
 oldrank=rank
 if rankcounter>=seuil5 then
  rank=5
 elseif rankcounter>=seuil4 then
  rank=4
 elseif rankcounter>=seuil3 then
  rank=3
 elseif rankcounter>=seuil2 then
  rank=2
 else
  rank=1 
 end

 if rank>oldrank then
  love.audio.play(rankup)
 elseif rank<oldrank then
  love.audio.play(rankdown)
 
 
 end
end

function checkdeath()
 if ply.hp<=0 then
  love.audio.play(aie)
  drawfunc=drawgameover
  updatefunc=updategameover
 end
end

function updategame()
 feedbgifnecessary()
 checkdeath()
 tickdownrank()
 maintainglobrank()
 checklvlup()
 --scroll faster with rank
 spawncounter=spawncounter+rank
 tickpanes()
 -- print(spawncounter)
 activation()
 
 
 tx=px
 ty=py

 
 
  -- for i,v in pairs(ts) 
  -- do
  -- -- print(v)
   -- local x,y=love.touch.getPosition(v)
   -- if x ~=nil and y~=nil then
    -- print(x)
    -- print(y)
	-- tx=x
	-- ty=y
   -- end
  
  -- end
 
 if to_apply ~=nil then
  for i,v in pairs(to_apply) 
  do
   -- print("bhv")
   -- v.behavior(v,i) 
   tx=tx+v.ox
   ty=ty+v.oy
   table.remove(to_apply,i)
  end
  
 
 end
 
 if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
  tx=px-plyspeed
 end
 if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
  tx=px+plyspeed
 end
 if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
  ty=py-plyspeed
 end
 if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
  ty=py+plyspeed
 end
 if love.keyboard.isDown("space") or fingertwoid~=nil then
  fireBullet(px,py,bullet)
 end

 -- print("ply.w ")
 -- print(ply.w)
 if outofpf(tx,ty,ply.w,ply.h)==false then
  --nothing
  -- print("BLOCKING")
 -- else
  px=tx
  py=ty
 end
 
 for i,v in pairs(gameobjs) 
 do
  -- print("bhv")
  v.behavior(v,i) 
 end
 
 
 if bulletinhib>0 then
  bulletinhib=bulletinhib-1
 end
 
 for i,v in pairs(bullets) 
 do
  -- print("bhv")
  v.behavior(v,i) 
 end
end
