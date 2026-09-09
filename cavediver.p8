pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
 game_over=false
 gravity=0.2
 make_player()
 make_cave()
end

function _update()
 move_player()
 update_cave()
end

function _draw()
 cls()
 draw_player()
 draw_cave()
end


-->8
function make_player()
 player={}
 player.x=24
 player.y=60
 player.dy=0
 player.rise=1
 player.fall=2
 player.dead=3
 player.speed=2
 player.score=0
end

function draw_player()
 local sprite = player.fall
 
 if(game_over) then
  sprite = player.dead
 elseif(player.dy<0) then
  sprite = player.rise
 end
 
 spr(sprite,player.x,player.y)
end  

function move_player()
 player.dy+=gravity
 
 if(btnp(2)) then
  player.dy-=5
 end
 
 player.y+=player.dy
end
-->8
function make_cave()
 cave={{["top"]=5,["btm"]=119}}
 top=45
 btm=85
end

function update_cave()
 if(#cave>player.speed) then
  for i=1,player.speed do
   del(cave,cave[1])
  end
 end
 
 while(#cave<128) do 
  local col={}
  local up=flr(rnd(7)-3)
  local down=flr(rnd(7)-3)
  col.top=mid(3,cave[#cave].top+up,top)
  col.btm=mid(btm,cave[#cave].btm+down,124)
  add(cave,col)
 end
end

function draw_cave()
 top_color=5
 btm_color=5
 for i=1,#cave do
  line(i-1,0,i-1,cave[i].top,top_color)
  line(i-1,127,i-1,cave[i].btm,btm_color)
 end
end 
__gfx__
0000000000aaaa0000aaaa0000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00aaaaaa008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700aa5aa5aaaa5aa5aa88988988000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaaaaaaaaaaaaaaa88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aa5555aaaaa55aaa88899888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700aaa55aaaaaa55aaa88988988000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00aaaaaa008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000aaaa0000aaaa0000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
