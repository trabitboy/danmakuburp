
bgtofeed=nil

function resetbgsystem()
bgpanes={}
end

function feedbgpane(img,height,y)
 p={}
 p.pic=img
 p.h=height
 p.y=y
 print("added bg height")
 print( p.h)
 print("added bg y")
 print( p.y)
 table.insert(bgpanes,p)

end

function tickpanes()
 for i,v in pairs(bgpanes) 
 do 
  v.y=v.y+rank
  if v.y>pfh then
   table.remove(bgpanes,i)
   print("bg removed")
  end
  
 end
 

end


function feedbgifnecessary()
 -- upperx=-1
 uppery=pfh
 for i,v in pairs(bgpanes) 
 do 
  if v.y<uppery then
   uppery=v.y
  end
 end 
 
 if uppery>=-32 then
	feedbgpane(bgtofeed,bgtofeed:getData():getHeight(),uppery-bgtofeed:getData():getHeight())
 end
 
end