function computebox(m,picdata)
 r={}
 r.x=m
 r.w=picdata:getWidth() - 2*m
 r.y=m
 r.h=picdata:getHeight() - 2*m
 
 return r
end

function collhbs(x1,y1,hb1,x2,y2,hb2)
 return coll(x1+hb1.x,y1+hb1.y,hb1.w,hb1.w,x2+hb2.x,y2+hb2.y,hb2.w,hb2.w)
end

function outofpf(x,y,w,h)
 if x< -w or y <-h then
  return true
 end
  
 if x> pfw or y >pfh then
  return true
 end
  
 return false
end 

function coll(x1,y1,w1,h1,x2,y2,w2,h2)
 if 
  (
   ((x2<=x1+w1)and(x2>=x1))
   or
   ((x1<=x2+w2)and(x1>=x2))
  )
  and
  (
   ((y2<=y1+h1)and(y2>=y1))
    or
    ((y1<=y2+h2)and(y1>=y2))
  )  
 then    
    
  return true
 end
 
 return false
end
