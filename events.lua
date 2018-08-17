gameobjs={}


evtbuffer={}


bgpanes={}



function activation()
 for i,v in pairs(evtbuffer) 
 do
  if spawncounter>=v.spawnpos then
   table.remove(evtbuffer,i)
   table.insert(gameobjs,v)
  end  
 end 
end



-- drop
function dropfunc(me,idx)
 me.y=me.y+3*rank
 
 --check ply pick up
 if collhbs(px,py,ply.hbx,me.x,me.y,me.hbx) then
  if rankcounter<maxrank then
   rankcounter=rankcounter+rankstep
   love.audio.play(miom)
   score=score+100*rankcounter
  end
  table.remove(gameobjs,idx) 
 end
 
 --check out of screen
 if outofpf(me.x,me.y,me.picdata:getWidth(),me.picdata:getHeight())then
  -- print("drop remove")
  table.remove(gameobjs,idx)
  rankcounter=rankcounter-2
 end 
 
end

function createdrop(x,y,pic)
 d={}
 d.x=x
 d.y=y
 d.pic=pic
 d.picdata=pic:getData()
 d.hbx=computebox(0,d.picdata)
 d.behavior=dropfunc
 
 table.insert(gameobjs,d)
end


function initBullets()
 bullets={}

end

function propbhv( me,idx)
 me.y=me.y+1
 
 me.timer=me.timer-1
 
 if me.timer<0 then
  table.remove(gameobjs,idx)
 end
end

function createprop(x,y,prop)
 prp={}
 prp.x=x
 prp.y=y
 prp.pic=prop
 prp.behavior=propbhv
 prp.timer=16
 
 table.insert(gameobjs,prp)
end



