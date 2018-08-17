function bbfunc(me,idx)
 me.x=me.x+me.dx
 me.y=me.y+me.dy
 
 --check ply col
 if collhbs(me.x,me.y,me.hbx,px,py,ply.hbx)then
  print("ply hit")
  table.remove(gameobjs,idx)
  ply.hp=ply.hp-1
 end
 
 
 
 --check out of screen
 if outofpf(me.x,me.y,me.picdata:getWidth(),me.picdata:getHeight())then
  -- print("bb remove")
  table.remove(gameobjs,idx)
 end
end

--factory method
--speed in pixels
function baddybullet(x,y,tx,ty,spd,pic)
  b={}
  b.pic=pic
  b.picdata=pic:getData()
  b.x=x
  b.y=y
  b.tx=tx
  b.ty=ty
  
  b.hbx=computebox(3,b.picdata)
  
  --calculating delta x y by calculating distance 
  sqd=tx*tx +ty*ty
  dst=  sqd^(0.5)
  nbstp=dst/spd
  -- print("nbstp")
  -- print(nbstp)
  b.dx=(tx-x)/nbstp
  b.dy=(ty-y)/nbstp
  -- print("dx")
  -- print(b.dx)
  -- print("dy")
  -- print(b.dy)
  b.behavior=bbfunc  
  
  table.insert(gameobjs,b)
end
