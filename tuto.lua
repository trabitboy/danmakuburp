

function updatetuto()
 
 -- touch=false
 -- ts = love.touch.getTouches()
 -- for i,v in pairs(ts) 
 -- do
  -- -- print(v)
  -- local x,y=love.touch.getPosition(v)
  -- if x ~=nil and y~=nil then
   -- print(x)
   -- print(y)
   -- touch = true
  -- end
  
 -- end

 if love.keyboard.isDown("return") or  fingeroneid~=nil  then
   -- initlvl1()
  initGlobLvl()
  startCurrLvl()
  -- to_apply={}
  drawfunc=drawgame
  updatefunc=updategame
 end
end



function drawtuto()
 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 
 love.graphics.printf("you are hungry devil,\n but picking up ennemy drops ",100,200,300,"center")
 love.graphics.printf("wasd/qsdz/cursor to move , SPACE to fire ",100,250,300,"center")
 love.graphics.printf("picking up food boosts ranks ",100,280,300,"center")
 love.graphics.printf("AND EXCITES ENNEMIES ",100,310,300,"center")
 love.graphics.printf("letting food pass by calms everyone ",100,330,300,"center")

 love.graphics.printf(" press ENTER to start ",100,400,300,"center")

 -- love.graphics.print("your score",200,300)
 -- love.graphics.print(score,200,400)
 rdrvscreen()
end 