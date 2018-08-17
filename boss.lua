

function bossmove(me,index)
 
 local tx=me.vx
 local ty=me.vy

 
 tx=me.x+me.vx*rank
 ty=me.y+me.vy*rank

 if outofpf(tx,ty,me.w,me.w)==false then
  me.x=tx
  me.y=ty
 else 
  print("BLOCK BOSS")
 end

 if me.descending then
  if me.vx<=-me.initvx then
   me.descending=false
  else
   me.vx=me.vx-rank
  end
 else --ascending
  if me.vx>=me.initvx then
   me.descending=true
  else
   me.vx=me.vx+rank
  end
 end

 if me.wobble then
  if me.vy<=-me.initvy then
   me.wobble=false
  else
   me.vy=me.vy-rank
  end
 else --ascending
  if me.vy>=me.initvy then
   me.wobble=true
  else
   me.vy=me.vy+rank
  end
 end


 
 if me.inhib>=0 then
  me.inhib=me.inhib-rank
 else
  -- if g.attackfunc~=nil then
   baddybullet(me.x,me.y,px,py,2*rank,bb)
   me.inhib=32
  -- end
 end
 
 me.movetimer=me.movetimer-1
 
 if me.movetimer<=0 then
  me.state="fire"
  me.rounds = 10
  me.finhib=0
 end
 
end


function bossfire(me,index)
 
  if me.finhib==0 then
   baddybullet(me.x+me.w/2,me.y+me.h,me.x+me.w/2,me.y+400,5*rank,bb)
   baddybullet(me.x+me.w/2,me.y+me.h,me.x+me.w/2-200,me.y+400,5*rank,bb)
   baddybullet(me.x+me.w/2,me.y+me.h,me.x+me.w/2+200,me.y+400,5*rank,bb)
   me.finhib=5
   me.rounds=me.rounds-1
  else
   me.finhib=me.finhib-1
  end
 
  if me.rounds<=0 then
   me.state="move"
   me.movetimer=90
  end
end


--index to be able to remove from list
function bossbehavior(me,index)
 if me.state=="move" then
  bossmove(me,index)
 elseif me.state=="fire" then
  bossfire(me,index)
 end

 
 if me.hp <= me.lastdrop-me.dropstep then
  createdrop(me.x,me.y,pill)  
  me.lastdrop=me.hp  
 end
 
 if  me.hp<=0 then
  love.audio.play(fire)
  table.remove(gameobjs,index)
--TODO more impressive bonus drop
  createprop(me.x,me.y,xpl)
  score=score+10000 * multiplier*rank
  createdrop(me.x,me.y,pill)  
  
 end

 
end


--attackfunc can be nil
function createboss(xg,yg,vx,vy,pic,spawnpos)
 local g={}
 g.state="move" --move or fire
 g.movetimer=180
 g.hp=100
 g.initvx=vx
 g.initvy=vy
 g.attackfunc=baddybullet
 g.spawnpos=spawnpos
 
 --each time we lose x health, we release a drop
 g.dropstep=2
 g.lastdrop=g.hp
 
 if vx>0 then
  g.descend=true
 else 
  g.descent=false
 end

 if vy>0 then
  g.wobble=true
 else 
  g.wobble=false
 end

 
 g.inhib=40
 
 g.vx=vx
 g.vy=vy
 g.behavior=bossbehavior
 g.pic=pic
 g.picdata=pic:getData()
 g.w=g.picdata:getWidth()
 g.h=g.picdata:getHeight()
 
 g.x=xg-g.picdata:getWidth()/2
 g.y=yg-g.picdata:getHeight()/2

 
 g.hbx=computebox(0,g.picdata)
 
 
 baddieobserved=g
 -- print("width")
 -- print(g.picdata:getWidth())
 table.insert(evtbuffer,g)
end
