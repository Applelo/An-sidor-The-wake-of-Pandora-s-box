--FUNCTION MAP--
step_map = 1
tileset = image.load("map/tileset.png")
event = image.load("map/event.png")
----------------
--FUNCTION WEATHER/METEO--
cycle = timer.new() --cycle jour/nuit
weather_statut = 1
table_meteo = {}
ceQueTuVeux = 50
param_meteo = {{1,2},{3,4},{4,5}}
color_meteo = {nuit = {color.new(65,118,158,102),color.new(42,90,129,128),color.new(36,70,125,143)}, pluie = color.new(180,200,255), neige = color.new(255,255,255), orage = {color.new(255,255,255,150),color.new(255,255,255,100)}}
for i = 1, ceQueTuVeux do
	table_meteo[i] = {x = math.random(0,479),y = math.random(0,271)}
end
fog_meteo = image.load("img/fog.png")
x_fog_meteo = -480
-------------------
--FUNCTION EFFECT--
x_seisme = 0
effecting = timer.new()
effecting:reset(10001)
-------------------


--FUNCTION PNJ--
img_pnj = {--CHARGE LES IMAGES POUR LES PNJ
	tete = {image.load("pnj/tete/bas.png",16,17),image.load("pnj/tete/droite.png",16,17),image.load("pnj/tete/gauche.png",16,17),image.load("pnj/tete/haut.png",16,17)},
	corps = 
	{ 
		un = { image.load("pnj/corps/1/bas.png",12,9),image.load("pnj/corps/1/droite.png",12,9),image.load("pnj/corps/1/gauche.png",12,9),image.load("pnj/corps/1/haut.png",12,9)},
		deux = { image.load("pnj/corps/2/bas.png",12,9),image.load("pnj/corps/2/droite.png",12,9),image.load("pnj/corps/2/gauche.png",12,9),image.load("pnj/corps/2/haut.png",12,9)},
		trois = { image.load("pnj/corps/3/bas.png",12,9),image.load("pnj/corps/3/droite.png",12,9),image.load("pnj/corps/3/gauche.png",12,9),image.load("pnj/corps/3/haut.png",12,9)}
	},
	epee = {},	
}
for i=1,4 do
	img_pnj.epee[i]={image.load("pnj/epee/"..i.."/bas.png",17,24),image.load("pnj/epee/"..i.."/droite.png",18,19),image.load("pnj/epee/"..i.."/gauche.png",18,19),image.load("pnj/epee/"..i.."/haut.png",22,21)}		
end
presence = false
pnjing = timer.new()--timer pour les PNJ mais également pour les monstres !
statut_pnj = 0
step_pnj = 0
table_pnj = {{},{},{},{},{},{},{},{},{},{}}
for i=1,10 do
	table_pnj[i].x = 0
	table_pnj[i].y = 0
	table_pnj[i].step = 1
	table_pnj[i].stopit = false
	table_pnj[i].statut = "bas"
	table_pnj[i].goback = 1
	table_pnj[i].type = "normal"
end
return_pnj = 0
--FUNCTION MONSTER--
img_monster = {
	tete = {image.load("monster/tete/bas.png",16,17),image.load("monster/tete/droite.png",16,17),image.load("monster/tete/gauche.png",16,17),image.load("monster/tete/haut.png",16,17)},
	special = {image.load("monster/special/buldo.png",12,19),image.load("monster/special/pistol.png",8,8),image.load("monster/special/bloups.png",12,19)},
	corps = 
	{ 
		un = { image.load("monster/corps/1/bas.png",12,10),image.load("monster/corps/1/droite.png",13,10),image.load("monster/corps/1/gauche.png",13,10),image.load("monster/corps/1/haut.png",13,10)},
		deux = { image.load("monster/corps/2/bas.png",13,10),image.load("monster/corps/2/droite.png",13,9),image.load("monster/corps/2/gauche.png",13,9),image.load("monster/corps/2/haut.png",13,9)},
		trois = { image.load("monster/corps/3/bas.png",13,10),image.load("monster/corps/3/droite.png",13,9),image.load("monster/corps/3/gauche.png",13,9),image.load("monster/corps/3/haut.png",13,9)}
	},
	bye = image.load("monster/disparition.png",16,16)
}
table_monster = {{},{},{},{},{},{},{},{},{},{}}
for i=1,10 do
	table_monster[i].x = 0
	table_monster[i].y = 0
	table_monster[i].step = 1
	table_monster[i].statut = "bas"
	table_monster[i].life = 1
	table_monster[i].speed = 1
	table_monster[i].rage = "normal"--normal : surveille; attaque : attaque le joueur (d'autre mode disponible selon le monstre)
	table_monster[i].alpha = 255
end


--FUNCTION MOVE--
swording = timer.new()
swording:reset(0)
temp_pos = statut
statut_sword = 0
step_sword = 0
moving = timer.new()
statut_move = 0
step_move = 0
speed_move = 1
stop_move = false
stopit = false

---------------
--FUNCTION TRANSITION--
trans = "default"
-----------------------
--FUNCTION DIALOGUE--
step_dial = 1
tap_dial = 1
img_dial = image.load("img/dialogue.png")
img_bulle = image.load("img/bulle.png")
info_dial = false
choice = -1
img_choice = image.load("img/choice.png")
---------------------
--FUNCTION MODULE--
img_module = {start=image.load("img/module/start.png"),life=image.load("img/module/life.png"),fin=image.load("img/module/end.png"),mort=image.load("img/module/angel.png")}
--FUNCTION tempo save--
img_save = image.load("img/saving.png")
tempo_save = 0
-------------------
--FUNCTION TELEPORT--
tempo_tp = 0
img_tp = image.load("img/teleporter.png",32,20)
step_tp = 0
all_tp = {}
--------------------
--FUNCTION LINK_DIAL--
step_link_dial = 1
speak_link_dial = 1
number_link_dial = {0,0,0}
activate_link_dial = 0
interaction_link_dial = {0,0}
----------------------  ( | )
----------------------    |  
----------------------   / \
function monster(tete,corps,ia,xm,ym,num)
	if table_monster[num].step == 1 then
		table_monster[num].x = xm
		table_monster[num].y = ym
		table_monster[num].statut = "haut"
		table_monster[num].speed = 1
		table_monster[num].step = 2
		table_monster[num].life = 100
	 end
	 
	 
	if table_monster[num].life > 0 then--SI LE MONSTRE A DE LA VIE
		
 	if table_monster[num].statut == "gauche" then
 		image.blitsprite(img_monster.tete[3],table_monster[num].x-x-2,table_monster[num].y-y-2,tete,table_monster[num].alpha)
 		if pnjing:time() <= 250 then
 			--1
 			image.blitsprite(img_monster.corps.un[3],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
 			--2
 			image.blitsprite(img_monster.corps.deux[3],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
 			--1
 			image.blitsprite(img_monster.corps.un[3],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 750 and pnjing:time() <= 1000 then
 			--3
 			image.blitsprite(img_monster.corps.trois[3],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		end
 	elseif table_monster[num].statut == "droite" then
 		image.blitsprite(img_monster.tete[2],table_monster[num].x-x-2,table_monster[num].y-y-2,tete,table_monster[num].alpha)
 		if pnjing:time() <= 250 then
 			--1
 			image.blitsprite(img_monster.corps.un[2],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
 			--2
 			image.blitsprite(img_monster.corps.deux[2],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
 			--1
 			image.blitsprite(img_monster.corps.un[2],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 750 and pnjing:time() <= 1000 then
 			--3
 			image.blitsprite(img_monster.corps.trois[2],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		end
 	elseif table_monster[num].statut == "haut" then
 		image.blitsprite(img_monster.tete[4],table_monster[num].x-x-2,table_monster[num].y-y-2,tete,table_monster[num].alpha)
 		if pnjing:time() <= 250 then
 			--1
 			image.blitsprite(img_monster.corps.un[4],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
 			--2
 			image.blitsprite(img_monster.corps.deux[4],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
 			--1
 			image.blitsprite(img_monster.corps.un[4],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 750 and pnjing:time() <= 1000 then
 			--3
 			image.blitsprite(img_monster.corps.trois[4],table_monster[num].x-x-1,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		end
 	else 
 		image.blitsprite(img_monster.tete[1],table_monster[num].x-x-2,table_monster[num].y-y-2,tete,table_monster[num].alpha)
 		if pnjing:time() <= 250 then
 			--1
 			image.blitsprite(img_monster.corps.un[1],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
 			--2
 			image.blitsprite(img_monster.corps.deux[1],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
 			--1
 			image.blitsprite(img_monster.corps.un[1],table_monster[num].x-x,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		elseif pnjing:time() >= 750 and pnjing:time() <= 1000 then
 			--3
 			image.blitsprite(img_monster.corps.trois[1],table_monster[num].x-x-1,table_monster[num].y-y+10,corps,table_monster[num].alpha)
 		end
 	end	
	
	--Intelligence artificiel--
	if ia == "pistol" then
		ia_pistol(num)
	elseif ia == "fantome" then
		ia_fantome(num)
	elseif ia == "squelette" then
	   	ia_squelette(num)
	elseif ia == "bloups" then
		ia_bloups(num)
	elseif ia == "buldo" then
		ia_buldo(num)
	elseif ia == "zombie" then
		ia_zombie(num)
	end
	
		--Collisions limite ecran--
			if table_monster[num].x < 30 then
				table_monster[num].x = 30
			elseif table_monster[num].x + 30 > 960 then
				table_monster[num].x = 960 - 30
			end
			if table_monster[num].y < 30 then 
				table_monster[num].y = 30
			elseif table_monster[num].y + 50 > 544 then
				table_monster[num].y = 544 - 50
			end
		
	elseif table_monster[num].life == 0 then
		--ANIMATION
 		if pnjing:time() <= 250 then
 			--1
 			image.blitsprite(img_monster.bye,table_monster[num].x-x,table_monster[num].y-y,0)
 		elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
 			--2
 			image.blitsprite(img_monster.bye,table_monster[num].x-x,table_monster[num].y-y,1)
 		elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
 			--1
 			image.blitsprite(img_monster.bye,table_monster[num].x-x,table_monster[num].y-y,2)
 		elseif pnjing:time() >= 750 and pnjing:time() < 1000 then
 			--3
 			image.blitsprite(img_monster.bye,table_monster[num].x-x,table_monster[num].y-y,3)
		elseif pnjing:time() > 995 then
			table_monster[num].life = -1
 		end
	end
end

function pnj(tete,corps,parole,xp,yp,statutp,t,num,name,anim,pasx,pasy)--Tête, Corps, Dialogue, X, Y, Position, Nom et Anim/Pas de PNJ
	--Anim : "gauche_droite","droite_gauche","haut_bas","bas_haut","tour"
	--Pas : Distance à par courir pour le PNJ
	--Maximum de 10 PNJ à l'écran
	
	if table_pnj[num].step == 1 then
		table_pnj[num].x = xp
		table_pnj[num].y = yp
		table_pnj[num].statut = statutp
		table_pnj[num].type = t
		table_pnj[num].step = 2
	 end
		
	
	if anim ~= nil and pasx ~= nil and pasy ~= nil and table_pnj[num].stopit == false then--Si animation activé
		statut_pnj = 1--On active l'animation du pnj
		
		if anim == "gauche_droite" then
			if table_pnj[num].goback == 1 then--Aller
				table_pnj[num].statut = "droite"
				table_pnj[num].x = table_pnj[num].x+1
				if table_pnj[num].x >= xp+pasx then
					table_pnj[num].goback = 2
				end
			elseif table_pnj[num].goback == 2 then--Retour
				table_pnj[num].statut = "gauche"
				table_pnj[num].x = table_pnj[num].x-1
				if table_pnj[num].x <= xp then
					table_pnj[num].goback = 1
				end
			end
		elseif anim == "droite_gauche" then
			if table_pnj[num].goback == 1 then--Retour
				table_pnj[num].statut = "gauche"
				table_pnj[num].x = table_pnj[num].x-1
				if table_pnj[num].x <= xp-pasx then
					table_pnj[num].goback = 2
				end
			elseif table_pnj[num].goback == 2 then--Aller
				table_pnj[num].statut = "droite"
				table_pnj[num].x = table_pnj[num].x+1
				if table_pnj[num].x >= xp then
					table_pnj[num].goback = 1
				end
			end
		
		elseif anim == "haut_bas" then
			if table_pnj[num].goback == 1 then--Retour
				table_pnj[num].statut = "haut"
				table_pnj[num].y = table_pnj[num].y-1
				if table_pnj[num].y <= yp-pasy then
					table_pnj[num].goback = 2
				end
			elseif table_pnj[num].goback == 2 then--Aller
				table_pnj[num].statut = "bas"
				table_pnj[num].y = table_pnj[num].y+1
				if table_pnj[num].y >= yp then
					table_pnj[num].goback = 1
				end
			end
		
		elseif anim == "bas_haut" then
			if table_pnj[num].goback == 1 then--Aller
				table_pnj[num].statut = "bas"
				table_pnj[num].y = table_pnj[num].y+1
				if table_pnj[num].y >= yp+pasy then
					table_pnj[num].goback = 2
				end
			elseif table_pnj[num].goback == 2 then--Retour
				table_pnj[num].statut = "haut"
				table_pnj[num].y = table_pnj[num].y-1
				if table_pnj[num].y <= yp then
					table_pnj[num].goback = 1
				end
			end
		elseif anim == "tour" then
			if table_pnj[num].goback == 1 then--Un ptit tour pour la route !
				table_pnj[num].statut = "droite"
				table_pnj[num].x = table_pnj[num].x+1
				if table_pnj[num].x >= xp+pasx then
					table_pnj[num].goback = 2
				end
			elseif table_pnj[num].goback == 2 then
				table_pnj[num].statut = "bas"
				table_pnj[num].y = table_pnj[num].y+1
				if table_pnj[num].y >= yp+pasy then
					table_pnj[num].goback = 3
				end
			elseif table_pnj[num].goback == 3 then--Retour
				table_pnj[num].statut = "gauche"
				table_pnj[num].x = table_pnj[num].x-1
				if table_pnj[num].x <= xp then
					table_pnj[num].goback = 4
				end
			elseif table_pnj[num].goback == 4 then--Retour
				table_pnj[num].statut = "haut"
				table_pnj[num].y = table_pnj[num].y-1
				if table_pnj[num].y <= yp then
					table_pnj[num].goback = 1
				end
			end

		end
	end
			
	
	if anim == nil then--Sans animation
		if table_pnj[num].statut == "gauche" then
			image.blitsprite(img_pnj.corps.un[3],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			image.blitsprite(img_pnj.tete[3],table_pnj[num].x-x-2,table_pnj[num].y-y-2,tete)
		elseif table_pnj[num].statut == "droite" then
			image.blitsprite(img_pnj.corps.un[2],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			image.blitsprite(img_pnj.tete[2],table_pnj[num].x-x-2,table_pnj[num].y-y-2,tete)
		elseif table_pnj[num].statut == "haut" then
			image.blitsprite(img_pnj.corps.un[4],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			image.blitsprite(img_pnj.tete[4],table_pnj[num].x-x-2,table_pnj[num].y-y-2,tete)
		else
			image.blitsprite(img_pnj.corps.un[1],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			image.blitsprite(img_pnj.tete[1],table_pnj[num].x-x-2,table_pnj[num].y-y-2,tete)
		end
	else
		if table_pnj[num].statut == "gauche" then
			if pnjing:time() <= 250 then
				--1
				image.blitsprite(img_pnj.corps.un[3],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
				--2
				image.blitsprite(img_pnj.corps.deux[3],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
				--1
				image.blitsprite(img_pnj.corps.un[3],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 750 and pnjing:time() <= 1000 then
				--3
				image.blitsprite(img_pnj.corps.trois[3],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			end
			image.blitsprite(img_pnj.tete[3],table_pnj[num].x-x-2,table_pnj[num].y-y-2,tete)
		elseif table_pnj[num].statut == "droite" then
			if pnjing:time() <= 250 then
				--1
				image.blitsprite(img_pnj.corps.un[2],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
				--2
				image.blitsprite(img_pnj.corps.deux[2],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
				--1
				image.blitsprite(img_pnj.corps.un[2],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 750 and pnjing:time() <= 1000 then
				--3
				image.blitsprite(img_pnj.corps.trois[2],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			end
			image.blitsprite(img_pnj.tete[2],table_pnj[num].x-x-2,table_pnj[num].y-y-2,tete)
		elseif table_pnj[num].statut == "haut" then
			if pnjing:time() <= 250 then
				--1
				image.blitsprite(img_pnj.corps.un[4],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
				--2
				image.blitsprite(img_pnj.corps.deux[4],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
				--1
				image.blitsprite(img_pnj.corps.un[4],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 750 and pnjing:time() <= 1000 then
				--3
				image.blitsprite(img_pnj.corps.trois[4],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			end
			image.blitsprite(img_pnj.tete[4],table_pnj[num].x-x-2,table_pnj[num].y-y-2,tete)
		else 
			if pnjing:time() <= 250 then
				--1
				image.blitsprite(img_pnj.corps.un[1],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 250 and pnjing:time() <= 500 then
				--2
				image.blitsprite(img_pnj.corps.deux[1],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 500 and pnjing:time() <= 750 then
				--1
				image.blitsprite(img_pnj.corps.un[1],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			elseif pnjing:time() >= 750 and pnjing:time() <= 1000 then
				--3
				image.blitsprite(img_pnj.corps.trois[1],table_pnj[num].x-x,table_pnj[num].y-y+10,corps)
			end
			image.blitsprite(img_pnj.tete[1],table_pnj[num].x-x-2,table_pnj[num].y-y-2,tete)
		end	
		
		if pnjing:time() >= 1000 then
			pnjing:reset(0)
			pnjing:start()
		end
	
		if statut_pnj == 0 and step_pnj == 0 then
			pnjing:reset(0)
			pnjing:stop()
			step_pnj = 1
		elseif statut_pnj == 1 and step_pnj == 1 then
			pnjing:start()
			step_pnj = 0
		end
	end
	
	collision_p((table_pnj[num].x-2)-x,(table_pnj[num].y-2)-y,(table_pnj[num].x-2)-x+18,(table_pnj[num].y-2)-y+35)
	
	if buttons.square then
		if (table_pnj[num].statut == "bas" and statut == "haut" and x >= ((table_pnj[num].x-2)-x) - 14 and x <= ((table_pnj[num].x-2)-x+18) and y >= ((table_pnj[num].y-2)-y) - 14 and y <= ((table_pnj[num].y-2)-y+40) - 14) or (table_pnj[num].statut == "haut" and statut == "bas" and x >= ((table_pnj[num].x-2)-x) - 14 and x <= ((table_pnj[num].x-2)-x+18) and y >= ((table_pnj[num].y-2)-y) - 20 and y <= ((table_pnj[num].y-2)-y) - 14) or (table_pnj[num].statut == "droite" and statut == "gauche" and x >= ((table_pnj[num].x-2)-x) - 14 and x <= ((table_pnj[num].x-2)-x+30) and y >= ((table_pnj[num].y-2)-y) - 14 and y <= ((table_pnj[num].y-2)-y+20)) or (table_pnj[num].statut == "gauche" and statut == "droite" and x >= ((table_pnj[num].x-2)-x) - 30 and x <= ((table_pnj[num].x-2)-x+18) and y >= ((table_pnj[num].y-2)-y) - 14 and y <= ((table_pnj[num].y-2)-y+20)) then
			sound.play(sound_wav.bip,2)
			table_pnj[num].stopit = true
		end
	elseif (table_pnj[num].statut == "bas" and statut == "haut" and x >= ((table_pnj[num].x-2)-x) - 14 and x <= ((table_pnj[num].x-2)-x+18) and y >= ((table_pnj[num].y-2)-y) - 14 and y <= ((table_pnj[num].y-2)-y+40) - 14) or (table_pnj[num].statut == "haut" and statut == "bas" and x >= ((table_pnj[num].x-2)-x) - 14 and x <= ((table_pnj[num].x-2)-x+18) and y >= ((table_pnj[num].y-2)-y) - 20 and y <= ((table_pnj[num].y-2)-y) - 14) or (table_pnj[num].statut == "droite" and statut == "gauche" and x >= ((table_pnj[num].x-2)-x) - 14 and x <= ((table_pnj[num].x-2)-x+30) and y >= ((table_pnj[num].y-2)-y) - 14 and y <= ((table_pnj[num].y-2)-y+20)) or (table_pnj[num].statut == "gauche" and statut == "droite" and x >= ((table_pnj[num].x-2)-x) - 30 and x <= ((table_pnj[num].x-2)-x+18) and y >= ((table_pnj[num].y-2)-y) - 14 and y <= ((table_pnj[num].y-2)-y+20)) and table_pnj[num].stopit == false then
		image.blit(img_bulle,table_pnj[num].x-x,(table_pnj[num].y-16)-y)
	end

	if table_pnj[num].stopit == true then--patatipatata
		presence = true
		return_pnj = num
		dialogue(parole,name)--AJOUTER REPERAGE PERSO
	end
end

function move()
	if buttons.held.r then
		speed_move = 2
	else
		speed_move = 1
	end
	if buttons.cross and presence == false and speed_move == 1 and step_sword == 1 and statut_sword == 0 then--Si le perso ne court pas, n'est pas devant un PNJ, n'est pas déjà dans l'action alors tu peux attaquer sinon non.
		sound.play(sound_wav.slash,2)
		statut_sword = 1
	end
	
	statut_move = 1
	if stopit == false then
	if buttons.held.right or buttons.analogx > 64 then
		for i=8,16 do
			if map_e[math.floor((y+i)/8)][math.floor((x+15)/8)] == 0x0001 then
				stop_move = true
			elseif map_e[math.floor((y+i)/8)][math.floor((x+15)/8)] == 0x0002 then
				trans = "droite"
			end
		end
		if stop_move == false then
			x = x + speed_move
		end
		statut = "droite"
		
	elseif buttons.held.left or buttons.analogx < -64 then
		for i=8,16 do
			if map_e[math.floor((y+i)/8)][math.floor((x+4)/8)] == 0x0001 then
				stop_move = true
			elseif map_e[math.floor((y+i)/8)][math.floor(x+4/8)] == 0x0002 then
				trans = "gauche"
			end
		end
		if stop_move == false then
			x = x - speed_move
		end
		statut = "gauche"
		
	elseif buttons.held.up or buttons.analogy < -64  then
		for i=5,11 do
			if map_e[math.floor((y+5)/8)][math.floor((x+i)/8)] == 0x0001 then
				stop_move = true
			elseif map_e[math.floor((y+5)/8)][math.floor((x+i)/8)] == 0x0002 then
				trans = "haut"
			end
		end
		if stop_move == false then
			y = y - speed_move
		end
		statut = "haut"
		
	elseif buttons.held.down or buttons.analogy > 64 then
		for i=5,11 do
			if map_e[math.floor((y+18)/8)][math.floor((x+i)/8)] == 0x0001 then
				stop_move = true
			elseif map_e[math.floor((y+18)/8)][math.floor((x+i)/8)] == 0x0002 then
				trans = "bas"
			end
		end
		if stop_move == false then
			y = y + speed_move
		end
		statut = "bas"
		
	else--Aucune touche actionné
		statut_move = 0
	end
	else--Aucune touche actionné
		statut_move = 0
	end
	stop_move = false
	if statut_move == 0 and step_move == 0 then
		moving:reset(0)
		moving:stop()
		step_move = 1
	elseif statut_move == 1 and step_move == 1 then
		moving:start()
		step_move = 0
	end
	
	if statut_sword == 0 and step_sword == 0 then
		swording:reset(0)
		swording:stop()
		step_sword = 1
	elseif statut_sword == 1 and step_sword == 1 then
		swording:start()
		step_sword = 0
		temp_pos = statut
	end
	if temp_pos ~= statut and statut_sword == 1 then--Empêche le joueur d'attaquer en changeant de direction
		swording:reset(0)
		swording:stop()
		statut_sword = 0
		step_sword = 1
	end
	
	if statut == "gauche" then
		image.blitsprite(img_pnj.tete[3],x-2,y-2,tete)
		if moving:time() <= (250/speed_move) then
			--1
			image.blitsprite(img_pnj.corps.un[3],x,y+10,corps)
		elseif moving:time() >= (250/speed_move) and moving:time() <= (500/speed_move) then
			--2
			image.blitsprite(img_pnj.corps.deux[3],x,y+10,corps)
		elseif moving:time() >= (500/speed_move) and moving:time() <= (1000/speed_move) then
			--1
			image.blitsprite(img_pnj.corps.un[3],x,y+10,corps)
		elseif moving:time() >= (1000/speed_move) and moving:time() <= (1500/speed_move) then
			--3
			image.blitsprite(img_pnj.corps.trois[3],x,y+10,corps)
		end
		if statut_sword == 1 then
			if swording:time() <= 100 then
				image.blitsprite(img_pnj.epee[epee][3],x-6,y,0)
			elseif swording:time() >= 100 and swording:time() <= 200 then
				image.blitsprite(img_pnj.epee[epee][3],x-6,y,1)
			elseif swording:time() >= 200 and swording:time() <= 300 then
				image.blitsprite(img_pnj.epee[epee][3],x-6,y,2)
			end
		end
	elseif statut == "droite" then
		image.blitsprite(img_pnj.tete[2],x-2,y-2,tete)
		if moving:time() <= (250/speed_move) then
			--1
			image.blitsprite(img_pnj.corps.un[2],x,y+10,corps)
		elseif moving:time() >= (250/speed_move) and moving:time() <= (500/speed_move) then
			--2
			image.blitsprite(img_pnj.corps.deux[2],x,y+10,corps)
		elseif moving:time() >= (500/speed_move) and moving:time() <= (1000/speed_move) then
			--1
			image.blitsprite(img_pnj.corps.un[2],x,y+10,corps)
		elseif moving:time() >= (1000/speed_move) and moving:time() <= (1500/speed_move) then
			--3
			image.blitsprite(img_pnj.corps.trois[2],x,y+10,corps)
		end
		if statut_sword == 1 then
			if swording:time() <= 100 then
				image.blitsprite(img_pnj.epee[epee][2],x,y,0)
			elseif swording:time() >= 100 and swording:time() <= 200 then
				image.blitsprite(img_pnj.epee[epee][2],x,y,1)
			elseif swording:time() >= 200 and swording:time() <= 300 then
				image.blitsprite(img_pnj.epee[epee][2],x,y,2)
			end
		end
	elseif statut == "haut" then
		image.blitsprite(img_pnj.tete[4],x-2,y-2,tete)
		if moving:time() <= (250/speed_move) then
			--1
			image.blitsprite(img_pnj.corps.un[4],x,y+10,corps)
		elseif moving:time() >= (250/speed_move) and moving:time() <= (500/speed_move) then
			--2
			image.blitsprite(img_pnj.corps.deux[4],x,y+10,corps)
		elseif moving:time() >= (500/speed_move) and moving:time() <= (1000/speed_move) then
			--1
			image.blitsprite(img_pnj.corps.un[4],x,y+10,corps)
		elseif moving:time() >= (1000/speed_move) and moving:time() <= (1500/speed_move) then
			--3
			image.blitsprite(img_pnj.corps.trois[4],x,y+10,corps)
		end
		if statut_sword == 1 then
			if swording:time() <= 100 then
				image.blitsprite(img_pnj.epee[epee][4],x-6,y-2,0)
			elseif swording:time() >= 100 and swording:time() <= 200 then
				image.blitsprite(img_pnj.epee[epee][4],x-6,y-2,1)
			elseif swording:time() >= 200 and swording:time() <= 300 then
				image.blitsprite(img_pnj.epee[epee][4],x-6,y-2,2)
			end
		end
	else 
		image.blitsprite(img_pnj.tete[1],x-2,y-2,tete)
		if moving:time() <= (250/speed_move) then
			--1
			image.blitsprite(img_pnj.corps.un[1],x,y+10,corps)
		elseif moving:time() >= (250/speed_move) and moving:time() <= (500/speed_move) then
			--2
			image.blitsprite(img_pnj.corps.deux[1],x,y+10,corps)
		elseif moving:time() >= (500/speed_move) and moving:time() <= (1000/speed_move) then
			--1
			image.blitsprite(img_pnj.corps.un[1],x,y+10,corps)
		elseif moving:time() >= (1000/speed_move) and moving:time() <= (1500/speed_move) then
			--3
			image.blitsprite(img_pnj.corps.trois[1],x,y+10,corps)
		end
		if statut_sword == 1 then
			if swording:time() <= 100 then
				image.blitsprite(img_pnj.epee[epee][1],x,y,0)
			elseif swording:time() >= 100 and swording:time() <= 200 then
				image.blitsprite(img_pnj.epee[epee][1],x,y,1)
			elseif swording:time() >= 200 and swording:time() <= 300 then
				image.blitsprite(img_pnj.epee[epee][1],x,y,2)
			end	
		end
	end	
		
	if moving:time() >= (1500/speed_move) then
		moving:reset(0)
		moving:start()
	elseif swording:time() >= 300 then
		swording:reset(0)
		swording:start()
		statut_sword = 0
	end
	
--Collisions limite ecran pour éviter des bugs et des sorties de l'écran ^^--
	if x < 10 then
		x = 10
	elseif x + 10 > 480 then
		x = 480 - 10
	end
	if y < 10 then 
		y = 10
	elseif y + 20 > 272 then
		y = 272 - 20
	end
	
end

function dialogue(dial,name,a)
	if step_dial == 1 then
		stopit = true
	
		if a == true then--Désactive la fonction de choix Oui / Non ou l'initialise
			choice = -1
		else
			choice = -2
		end
		
		file_parole = io.open("lang/"..lang.."/"..dial..".txt")
		parole = tostring(file_parole:read())--transforme en string le fichier texte chargé
		file_parole:close()
		coef_dial = math.floor(#parole/310)
		name_dial = name
		step_dial = 2
	elseif step_dial == 2 then--On chlague le truc
		step_dial = 3--ETAPE CHLAGUE
	elseif step_dial == 4 then
		stopit = false
		presence = false
		if return_pnj ~= 0 then
			table_pnj[return_pnj].stopit = false--Si c'est un dialogue fait par un PNJ
		else
			info_dial = false--Si c'est un dialogue externe
		end
		
		if step_link_dial == 2 then--Si lien activé entre deux pnj
			if interaction_link_dial[1] == interaction_link_dial[2] and speak_link_dial == 2 then  
				step_link_dial = 3
			else
				if speak_link_dial == 1 then
					speak_link_dial = 2
				else
					interaction_link_dial[1] = interaction_link_dial[1]+1
					speak_link_dial = 1
				end
				info_dial = true
			end
		end
		
		if energy_module == 0 then--Si le personnage finit le dialogue de mort
			--recharge la dernière sauvegarde
			temp_map = state
			load()
			if temp_map ~= state then
				step_map = 3
			end
		end
		return_pnj = 0
		tap_dial = 1
		name_dial = nil
		parole = nil
		step_dial = 1
	end
end

function print_dialogue()
	if step_dial == 3 then
			image.blit(img_dial,0,160)
			screen.print(20,175,name_dial,0.9,color.white)
			screen.print(20,195,string.sub(parole,310*(tap_dial-1),310*tap_dial),0.8,color.white,alpha.font_white,__AFULL,440)

			if buttons.square and tap_dial >= coef_dial+1 and choice == -2 then
				sound.play(sound_wav.bip,2)
				step_dial = 4
			elseif tap_dial >= coef_dial+1 and choice == -1 then--Attente d'une réponse du joueur
				image.blit(img_choice,420,110)--Place la boite de choix oui/non
				screen.print(432,120,l_choice[2].."\n\n"..l_choice[1],0.6,color.white,alpha.font_white)
			
				if buttons.down then
					selecteur = selecteur + 1
				end
				if buttons.up then
					selecteur = selecteur - 1
				end
				if selecteur > 2 then
					selecteur = 1
				end
				if selecteur < 1 then
					selecteur = 2
				end
				screen.print(425,100+(selecteur*20),">",0.5,color.white,alpha.font_white)	
			
				if buttons.square then
					sound.play(sound_wav.bip,2)
					choice = selecteur-1
					selecteur = 1
					step_dial = 4
				end
			
			elseif buttons.square then
				sound.play(sound_wav.bip,2)
				tap_dial = tap_dial+1
			end
		end
	
end


function mapper(choix,id,int)
	---------------------------------------------------------------------------------------------
	----------Cette fonction gère le chargement des maps ainsi que leur déchargement-------------
	---------------------------------------------------------------------------------------------
	----------------------------------------Version 2.0------------------------------------------
	---------------------------------------------------------------------------------------------
	if step_map == 1 then
		if not int then 
			interior = 0 
		else
			interior = int
		end
		dofile("map/"..choix.."/"..id..".lua")
		dofile("map/"..choix.."/"..id.."_c.lua")
		dofile("map/"..choix.."/"..id.."_coli.lua")
	    _map=map.new(tileset,tabla,16,16) 
	    _dosmap=map.new(tileset,tablados,16,16)
		if event_dev == 1 then
			_tmap=map.new(event,map_e,16,16)
		end
		step_map = 2
	end
	if step_map == 2 then	
		
		--AFFICHAGE MAP ET PLUS
		map.blit(_map,x+x_seisme,y)
		map.blit(_dosmap,x+x_seisme,y)
		if event_dev == 1 then
			map.blit(_tmap,x+x_seisme,y)
		end
		
		move()--Affichage personnage
		
	end
	if step_map == 3 then
		--map_e = nil
		tabla = nil--supprime map1
		tablados = nil
		interior = nil
		step_map = 1
	end
end

function transition(a,b,c,d)--a pour 
	if trans == a then
		state = b--Change la map
		step_map = 3--Passe en mode de transition
		if trans == "droite" then--On passe à gauche de l'écran
			if not c then 
				x = 20
			else
				x = c
			end
			if d then 
				y = d 
			end 
		elseif trans == "gauche" then--On passe à droite de l'écran
			if not c then 
				x = 460
			else
				x = c
			end
			if d then 
				y = d 
			end 
		elseif trans == "haut" then--On passe en bas de l'écran
			if c then 
				x = c
			end
			if not d then 
				y = 252
			else
				y = d 
			end 
		elseif trans == "bas" then--On passe en haut de l'écran
			if c then 
				x = c
			end
			if not d then 
				y = 20
			else
				y = d 
			end 
		end		
		trans = "default"--Remet par défaut la valeur de trans
	end
end


function collision_p(x_un,y_un,x_deux,y_deux)
	
	---------------------------------------------------------------------------------------------
	------------------------------------Collisions par pixel-------------------------------------
	---------------------------------------------------------------------------------------------
	----------------------------------------Version 2.0------------------------------------------
	---------------------------------------------------------------------------------------------
	
	if x >= x_un - 14 and x <= x_deux and y >= y_un - 14 and y <= y_deux - 14 then

		if statut == "gauche" then
			x = x + speed_move
		end
		if statut == "droite" then
			x = x - speed_move
		end
		if statut == "bas" then
			y = y - speed_move
		end
		if statut == "haut" then
			y = y + speed_move
		end
		return true
	end
end

function zone_detect(x_un,y_un,x_deux,y_deux,square,obliger)
	--Retoune si il détecte dans la zone donnée et permet l'insertion de dialogue facielement en activant la fonction square
	if x >= x_un - 14 and x <= x_deux and y >= y_un - 14 and y <= y_deux - 14 then
		if square and info_dial == false then
			image.blit(img_bulle,x,y-16)
		end
		if buttons.square and obliger == false then
			sound.play(sound_wav.bip,2)
			presence = true
			info_dial = true
		elseif obliger == true then
			presence = true
			info_dial = true
		end
		if info_dial then
			return true
		end
	end
end

function weather()
	---------------------------------------------------------------------------------------------
	--Cette fonction fait la pluie et le beau temps mais aussi la neige ainsi que le brouillard--
	---------------------------------------------------------------------------------------------
	----------------------------------------Version 1.5------------------------------------------
	---------------------------------------------------------------------------------------------
	if interior == 0 then
		
		cycle:start()


		--Ajoute les filtres
		if weather_statut == 1 then
			meteo(1)
		elseif weather_statut == 2 then
			meteo(2)
		elseif weather_statut == 3 then
			meteo(3)
			effect("orage")
		elseif weather_statut == 4 then
			for i=1,2 do
				image.blit(fog_meteo,x_fog_meteo+(481*i),0,150)
			end
			x_fog_meteo = x_fog_meteo-0.1
			if x_fog_meteo < -960 then
				x_fog_meteo = -480
			end
		end
		--Nuit
		if cycle:time() > 240000 and cycle:time() < 280000 or cycle:time() > 440000 and cycle:time() < 480000 then
			draw.fillrect(0,0,480,272,color_meteo.nuit[1])
		elseif cycle:time() > 280000 and cycle:time() < 320000 or cycle:time() > 400000 and cycle:time() < 440000 then
				draw.fillrect(0,0,480,272,color_meteo.nuit[2])
		elseif cycle:time() > 320000 and cycle:time() < 400000 then
			draw.fillrect(0,0,480,272,color_meteo.nuit[3])
		end
	
		
	end
end


function meteo(type)--Neige(1) ou Pluie(2) ou orage (3)
	----------------------------------------------------------------------------------------------------------
	---------------------------------------Fait la neige, la pluie et l'orage---------------------------------
	-------------------------------Fonction par psgarsenal modifié par Applelo--------------------------------
	----------------------------------------------------------------------------------------------------------
	----------------------------------------------Version 2.0-------------------------------------------------
	----------------------------------------------------------------------------------------------------------

	for i = 1, #table_meteo do
		if type == 1 then
			draw.line(table_meteo[i].x,table_meteo[i].y,table_meteo[i].x+1,table_meteo[i].y+1,color_meteo.neige)--La neige...simple pixel...
		else
			draw.line(table_meteo[i].x,table_meteo[i].y,table_meteo[i].x+1,table_meteo[i].y+3,color_meteo.pluie)--Pluie provoque petit décalage en diagonale
		end
		table_meteo[i].x = table_meteo[i].x - .25
		table_meteo[i].y = table_meteo[i].y + math.random(param_meteo[type][1],param_meteo[type][2])
		if table_meteo[i].x < 0 or table_meteo[i].y > 271 then
			table_meteo[i] = {x=math.random(0,479), y=0}
		end
	end	
end

function module()

	if energy_module == 0 then
		draw.fillrect(0,0,480,272,color.black)
		starlight_launch(tel_color[math.random(1,2)])
		image.blit(img_module.mort,0,0)
		x = -1200
		y = -1200
		dialogue("angel/"..math.random(1,3),"Angel")
	elseif step_inventaire == 1 then
		image.blit(img_module.start,205-((level_module-5)*3),115)--Affiche le début de la barre de statut
		for i=1,energy_module do--Affiche le rectangle rouge représentant la vie
			draw.fillrect(229+(i*6)-((level_module-5)*3),118,5,8,color.red)	
		end
		for i=1,level_module do
			image.blit(img_module.life,229+(i*6)-((level_module-5)*3),115)--Affiche le cadre de chaque vie
		end
		image.blit(img_module.fin,(level_module*6)+235-((level_module-5)*3),115)--Fini la barre de statut
		
	elseif energy_module > 0 and step_dial ~= 3 and step_link_dial ~= 2 and step_inventaire <=1 then
		image.blit(img_module.start,5,250)--Affiche le début de la barre de statut
		for i=1,energy_module do--Affiche le rectangle rouge représentant la vie
			draw.fillrect(29+(i*6),253,5,8,color.red)	
		end
		for i=1,level_module do
			image.blit(img_module.life,29+(i*6),250)--Affiche le cadre de chaque vie
		end
		image.blit(img_module.fin,(level_module*6)+35,250)--Fini la barre de statut
	elseif energy_module < 0 then
		energy_module = 0
	end
	
	if energy_module>level_module then
		energy_module=level_module
	end
	
	
	image.blit(img_save,460,252,tempo_save)--Affiche une petite disquette en bas à droite ;)
	if tempo_save > 0 and tempo_save <= 255 then
		tempo_save = tempo_save-2.5
	end
		
	if buttons.select and energy_module > 0 and step_dial ~= 3 and step_link_dial ~= 2 and step_inventaire <=1 then
		sound.play(sound_wav.save,2)
		save()
	elseif buttons.start and step_dial ~= 2 and energy_module > 0 then
		if step_inventaire == 0 then
			sound.play(sound_wav.menu_open,2)
			reload_inventaire()
			step_inventaire = 1
			stopit = true
			presence = true
		else
			sound.play(sound_wav.menu_close,2)
			step_inventaire = 0
			alert_inventaire = 0
			stopit = false
			presence = false
		end
	end

end

function effect(choix)
	if choix == "orage" then
		if effecting:time() >= 850 and effecting:time() <= 900 then
			draw.fillrect(0,0,480,272,color_meteo.orage[1])
		elseif effecting:time() >= 900 and effecting:time() <= 1000 then
			draw.fillrect(0,0,480,272,color_meteo.orage[2])
		end
	elseif choix == "seisme" then
		if effecting:time()%2 == 0 then
			x_seisme = x_seisme+2
		else
			x_seisme = x_seisme-2
		end
	end
	
	if effecting:time() > 10000 then--Remet à 0 les effets
		effecting:reset(0)
		effecting:start()
	end
end

function teleporter(casex,casey,tel)
	
	if all_tp[tel] == 1 then
		if tempo_tp < 300 then
			tempo_tp = tempo_tp+5
		else
			tempo_tp = 0
		end
		if tempo_tp < 100 then
			image.blitsprite(img_tp,casex-x,casey-y,0)
		elseif tempo_tp > 100 and tempo_tp <200 then
			image.blitsprite(img_tp,casex-x,casey-y,1)
		else
			image.blitsprite(img_tp,casex-x,casey-y,2)
		end
		if zone_detect(casex-x-10,casey-y-10,casex+50-x,casey+50-y,true,false) then
			--Affiche le menu de téléportation
			image.blit(img_menu,0,0)
			
			if buttons.circle then
				sound.play(sound_wav.bip,2)
				info_dial = false
				presence = false
			end
			
		end
	else
		image.blitsprite(img_tp,casex-x,casey-y,3)
		if zone_detect(casex-x-10,casey-y-10,casex+50-x,casey+50-y,true,false) then
			if poudre > 0 then
				dialogue("portail_y","Moi",true)--AJOUTER REPERAGE PERSO
			else
				dialogue("portail_n","Moi")--AJOUTER REPERAGE PERSO
			end
		end	
	end
	collision_p(casex-x,casey-y,casex+36-x,casey+40-y)--Collision
	
	if choice == 1 and step_dial == 1 and poudre > 0 then
		poudre = poudre - 1
		all_tp[tel] = 1
		choice = -2
	end
	
	
end

function load()
	x = tonumber(ini.read("save.ini","save","x","303"))
	y = tonumber(ini.read("save.ini","save","y","110"))
	tete = tonumber(ini.read("save.ini","save","tete","0"))
	corps = tonumber(ini.read("save.ini","save","corps","0"))
	state = tonumber(ini.read("save.ini","save","state","1"))
	statut = ini.read("save.ini","save","statut","bas")
	energy_module = tonumber(ini.read("save.ini","save","energy_module","5"))
	level_module = tonumber(ini.read("save.ini","save","level_module","5"))
	money = tonumber(ini.read("save.ini","save","money","100"))
	start = tonumber(ini.read("save.ini","save","start","1"))
	poudre = tonumber(ini.read("save.ini","save","poudre","1"))
	epee = tonumber(ini.read("save.ini","save","epee","1"))
	event_dev = tonumber(ini.read("save.ini","dev","event_dev","0"))
	info_dev = tonumber(ini.read("save.ini","dev","info_dev","0"))
	for i = 1,8 do
		all_tp[i] = tonumber(ini.read("save.ini","save","tp"..i,"0"))
	end
	for i = 1,12 do
		grille_inventaire[i] = tonumber(ini.read("save.ini","save","grille"..i,"0"))
	end
	for i = 1,2 do
		item_inventaire[i].nombre = tonumber(ini.read("save.ini","save","quant"..i,"0"))
	end
end

function save()
	tempo_save = 255--lance l'apparition du logo de sauvegarde
	ini.write("save.ini","save","x",tostring(x))
	ini.write("save.ini","save","y",tostring(y))
	ini.write("save.ini","save","tete",tostring(tete))
	ini.write("save.ini","save","corps",tostring(corps))
	ini.write("save.ini","save","state",tostring(state))
	ini.write("save.ini","save","statut",statut)
	ini.write("save.ini","save","energy_module",tostring(energy_module))
	ini.write("save.ini","save","level_module",tostring(level_module))
	ini.write("save.ini","save","money",tostring(money))
	ini.write("save.ini","save","start",tostring(start))
	ini.write("save.ini","save","poudre",tostring(poudre))
	ini.write("save.ini","save","epee",tostring(epee))
	ini.write("save.ini","dev","event_dev",tostring(event_dev))
	ini.write("save.ini","dev","info_dev",tostring(info_dev))
	for i = 1,8 do
		ini.write("save.ini","save","tp"..i,tostring(all_tp[i]))
	end
	for i = 1,12 do
		ini.write("save.ini","save","grille"..i,tostring(grille_inventaire[i]))
	end
	for i = 1,2 do
		ini.write("save.ini","save","quant"..i,tostring(item_inventaire[i].nombre))
	end
end

function link_dial(a,b,interaction,obliger,dial1,dial2,name1,name2,num)--Lier des dialogues (avec 2 personnages)
--a le premier pnj (nombre)
--b le deuxième pnj (nombre)
--interaction (nombre de dialogue échangé)--> ex: 1 = 1 échange bla/blu , 3 = 3 échanges bla/blu / bla/blu / bla/blu
--Décide si le joeur est obligé de subir le dialogue
--Endroit ou se trouve les dialogues d'interactions pour le pnj 1
--Endroit ou se trouve les dialogues d'interactions pour le pnj 2
--Nom du pnj1
--Nom du pnj2 
--num du lien
	if step_link_dial == 1 and activate_link_dial == 0 and number_link_dial[num]== 0 then
		if zone_detect(table_pnj[a].x-x-20,table_pnj[a].y-y-20,table_pnj[b].x-x+40,table_pnj[b].y-y+40,true,obliger) then
			interaction_link_dial[2] = interaction
			interaction_link_dial[1]= 1
			step_link_dial = 2
			activate_link_dial = num
		end
	elseif step_link_dial == 2 and activate_link_dial == num then
		if speak_link_dial == 1 then
			dialogue(dial1..interaction_link_dial[1],name1)
		else
			dialogue(dial2..interaction_link_dial[1],name2)
		end
	elseif step_link_dial == 3 and activate_link_dial == num then
		number_link_dial[num]=1
		activate_link_dial = 0
		step_link_dial = 1	
	end
	
end