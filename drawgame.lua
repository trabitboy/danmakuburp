
function displaygauge()
    xcur=ggx
	ycur=cvsh-16

	-- for i=1,maxrang
	-- for i=1,8
	for i=1,rankcounter
    do
	 if i>seuil3 then
      love.graphics.draw(rank3,xcur,ycur)
	 
	 elseif i>seuil2 then
      love.graphics.draw(rank2,xcur,ycur)
	 
	 else
      love.graphics.draw(rank1,xcur,ycur)
	 end
	 ycur=ycur-16
	end
end

function drawbaddiehealth()
 if baddieobserved~=nil then
  chunks=baddieobserved.hp /10
  
  xcur=0
  ycur=0
  
  for i=1,chunks
  do
   love.graphics.draw(rank1,xcur,ycur)
   ycur=ycur+32
  end  
 
 end

end

function displayscore()
  love.graphics.draw(scoremask,0,0)
  
  love.graphics.print("score",80,25)
  love.graphics.print(score,140,25)
end

function drawgame()
 love.graphics.setCanvas(vscreen)
 
 --maybe remove clear sometimes for smear effects
 -- love.graphics.setColor(255,255,255,255)
 love.graphics.clear()
 love.graphics.draw(blank,pfx,pfy)
 
 --bg display
 --redo with bg queue
 for i,v in pairs(bgpanes) 
 do 
  love.graphics.draw(v.pic,pfx,pfy+v.y)
 end
 
 
 love.graphics.draw(devil,pfx+px,pfy+py)
 
 for i,v in pairs(gameobjs) 
 do 
  love.graphics.draw(v.pic,pfx+v.x,pfy+v.y)
 end
 
 for i,v in pairs(bullets) 
 do 
  love.graphics.draw(v.pic,pfx+v.x,pfy+v.y)
 end
 
 displaygauge()
 drawbaddiehealth()
 displayscore() 
 rdrvscreen()
end
