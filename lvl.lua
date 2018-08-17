

-- currentLvl=1
-- currentLvl=1

-- firstlvl=5
firstlvl=1

print("module lvl")
function startCurrLvl()
 func=levels[currentLvl]
 
 if func==nil then
  print("victory !!!!!")
  updatefunc=updatevictory
  drawfunc=drawvictory
 else
  func()
  spawncounter=0
 end
end


function initGlobLvl()
 baddieobserved=nil
 rankcounter=0
 rank=1
 gameobjs={}
 tickdowninhib=0
 ply.hp=1
 currentLvl=firstlvl
 bulletspeed=5
 spawncounter=0
 initBullets()
 px=pfw/2
 py=pfh-64
 bgtofeed=bg1 --auick fix
 -- px=100
 -- py=100
end


function leftstraight()
    print("initlvl 1")
    
	bgtofeed=bg1
	
	-- feedbgpane(bgtofeed,bgtofeed:getData():getHeight(),0)
	-- baddybullet(0,0,px,py,4,devil);
	
	createghost(64,0,4,1,ghost,200,nil);
	createghost(64,0,4,1,ghost,275,baddybullet);
	createghost(64,0,4,1,ghost,350,nil);
	createghost(64,0,4,1,ghost,425,baddybullet);

end

function rightstraight()
    print("initlvl 2")
	
	bgtofeed=bg2
	
	-- feedbgpane(bgtofeed,bgtofeed:getData():getHeight(),0)
	
	-- baddybullet(0,0,px,py,4,devil);
	
	createghost(350,0,4,1,ghost,200,nil);
	createghost(350,0,4,1,ghost,275,baddybullet);
	createghost(350,0,4,1,ghost,350,nil);
	createghost(350,0,4,1,ghost,425,baddybullet);

end

function mountain()
    print("initlvl 3")
	
	-- feedbgpane(bg1,bg1:getData():getHeight(),0)
	
	-- baddybullet(0,0,px,py,4,devil);
	
	createghost(0,0,4,1,ghost,200,nil);
	createghost(pfw-64,0,4,1,ghost,275,baddybullet);
	createghost(pfw/8,0,4,1,ghost,350,nil);
	createghost(7*pfw/8,0,4,1,ghost,200,nil);
	createghost(pfw/4,0,4,1,ghost,275,baddybullet);
	createghost(3*pfw/4,0,4,1,ghost,350,nil);
	createghost(pfw/2,0,4,1,ghost,425,baddybullet);

end

function hirondelle()
    print("initlvl 3")
	
	-- feedbgpane(bg1,bg1:getData():getHeight(),0)
	
	-- baddybullet(0,0,px,py,4,devil);

	createghost(pfw/2,0,4,1,ghost,200,baddybullet);

	createghost(3*pfw/9,0,4,1,ghost,275,baddybullet);
	
	createghost(6*pfw/9,0,4,1,ghost,275,baddybullet);

	createghost(2*pfw/8,0,4,1,ghost,350,nil);
	createghost(7*pfw/8,0,4,1,ghost,350,nil);
	createghost(pfw/9,0,4,1,ghost,425,nil);
	createghost(8*pfw/9,0,4,1,ghost,425,nil);

end

function skull()
    print("init skull")
	
	-- feedbgpane(bg1,bg1:getData():getHeight(),0)
	
	-- baddybullet(0,0,px,py,4,devil);

	createghost(3*pfw/9,0,4,1,ghost,125,baddybullet);
	createghost(4*pfw/9,0,4,1,ghost,125,baddybullet);
	createghost(5*pfw/9,0,4,1,ghost,125,baddybullet);


	createghost(3*pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(5*pfw/9,0,4,1,ghost,200,baddybullet);
	
	createghost(3*pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(5*pfw/9,0,4,1,ghost,275,baddybullet);

	createghost(2*pfw/8,0,4,1,ghost,350,nil);
	createghost(6*pfw/8,0,4,1,ghost,350,nil);

	createghost(3*pfw/9,0,4,1,ghost,425,nil);
	createghost(5*pfw/9,0,4,1,ghost,425,nil);
	createghost(4*pfw/9,0,4,1,ghost,425,nil);

end

function barrage()
    print("init barrage")
	
	-- feedbgpane(bg1,bg1:getData():getHeight(),0)
	
	-- baddybullet(0,0,px,py,4,devil);
	
	createghost(pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(pfw/9,0,4,1,ghost,350,baddybullet);
	createghost(pfw/9,0,4,1,ghost,425,baddybullet);

	createghost(2*pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(2*pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(2*pfw/9,0,4,1,ghost,350,baddybullet);
	createghost(2*pfw/9,0,4,1,ghost,425,baddybullet);

	createghost(3*pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(3*pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(3*pfw/9,0,4,1,ghost,350,baddybullet);
	createghost(3*pfw/9,0,4,1,ghost,425,baddybullet);

	createghost(4*pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(4*pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(4*pfw/9,0,4,1,ghost,350,baddybullet);
	createghost(4*pfw/9,0,4,1,ghost,425,baddybullet);

	createghost(5*pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(5*pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(5*pfw/9,0,4,1,ghost,350,baddybullet);
	createghost(5*pfw/9,0,4,1,ghost,425,baddybullet);

	createghost(6*pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(6*pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(6*pfw/9,0,4,1,ghost,350,baddybullet);
	createghost(6*pfw/9,0,4,1,ghost,425,baddybullet);

	createghost(7*pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(7*pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(7*pfw/9,0,4,1,ghost,350,baddybullet);
	createghost(7*pfw/9,0,4,1,ghost,425,baddybullet);

	createghost(8*pfw/9,0,4,1,ghost,200,baddybullet);
	createghost(8*pfw/9,0,4,1,ghost,275,baddybullet);
	createghost(8*pfw/9,0,4,1,ghost,350,baddybullet);
	createghost(8*pfw/9,0,4,1,ghost,425,baddybullet);
	
	
end


function boss()
 print(" init boss ")
 -- bgtofeed=bg2
	bgtofeed=bg2
	
 createboss(pfw/2,pfh/9,20,10,boss,50)
end


levels={
leftstraight,
rightstraight,
mountain,
hirondelle,
skull,
barrage,
boss
-- initlvl1,
-- initlvl2
-- lvl2
}


