function bulletBehavior(me,idx)
 me.x=me.x+me.vx*bulletspeed
 me.y=me.y+me.vy*bulletspeed

 for i,v in pairs(gameobjs) 
 do 
  if v.hp~=nil then
   ret=collhbs(me.x,me.y,me.hbx,v.x,v.y,v.hbx)
   if ret then
    -- print(" bullet coll ")
   -- debug.debug()
    v.hp=v.hp-1
   
    table.remove(bullets,idx)
   end
  end
-- love.graphics.draw(ghost,pfx+v.x,pfy+v.y)
 end
 
 
 if me.y<-me.picdata:getHeight() then
  table.remove(bullets,idx)
  -- print("bullet erased")
 end
 
end

--not to generate constant stream
bulletinhib=0

function fireBullet(x,y,pic)
 if bulletinhib==0 then

	 b={}
	 b.vx=0
	 b.vy=-1
	 b.pic=pic
	 b.picdata=pic:getData()
	 b.x=x-b.picdata:getWidth()/2+ply.w/2
	 b.y=y-b.picdata:getHeight()/2
	 b.hbx=computebox(0,b.picdata)
	 b.behavior=bulletBehavior
	 table.insert(bullets,b)
	 love.audio.play(piou)
	 bulletinhib=16
 end
end
