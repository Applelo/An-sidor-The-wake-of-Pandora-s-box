statut_alea = {"bas","droite","gauche","haut"}

function ia_pistol(num)
	if table_monster[num].step == 2 then--Initialisation de l'intelligence artificielle
		table_monster[num].life = 10--Vie du pistole est à 10
		table_monster[num].speed = 2--Vitesse du pistole est à 1
		table_monster[num].step = 3
	end
	
	if table_monster[num].rage == "normal" then
 		if pnjing:time() > 1000 then
 			table_monster[num].statut = statut_alea[math.random(1,4)]
 		end	
	elseif table_monster[num].rage == "attaque" then
		if x > table_monster[num].x-x then
			table_monster[num].statut = "droite"
		elseif x < table_monster[num].x-x then
			table_monster[num].statut = "gauche"
		elseif y > table_monster[num].y-y then
			table_monster[num].statut = "bas"
		elseif y < table_monster[num].y-y then
			table_monster[num].statut = "haut"
		end
		
		if x >= (table_monster[num].x-2)-x - 20 and x <= (table_monster[num].x-2)-x+30 and y >= (table_monster[num].y-2)-y - 20 and y <= (table_monster[num].y-2)-y+30 and swording:time() == 100 then
			--Dégats infligé au monstre par le joueur
			poussetoi(num)
		end
		screen.print(5,200,table_monster[num].life)
		
		if x >= (table_monster[num].x-x)-20 and x <= (table_monster[num].x-x)+20 and y >= (table_monster[num].y-y) - 20 and y <= (table_monster[num].y-y)+20 then
			collision_p((table_monster[num].x-2)-x,(table_monster[num].y-2)-y,(table_monster[num].x-2)-x+18,(table_monster[num].y-2)-y+35)
			if table_monster[num].statut == "droite" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then--Fait bouger le personnage
				table_monster[num].x = table_monster[num].x + table_monster[num].speed+1
			elseif table_monster[num].statut == "gauche" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
				table_monster[num].x = table_monster[num].x - table_monster[num].speed+1
			elseif table_monster[num].statut == "bas" and map_e[math.floor((table_monster[num].y+35)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
				table_monster[num].y = table_monster[num].y + table_monster[num].speed+1
			elseif table_monster[num].statut == "haut" and map_e[math.floor((table_monster[num].y+25)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
				table_monster[num].y = table_monster[num].y - table_monster[num].speed+1
			end
		else
			--Fireball
			if table_monster[num].statut == "haut" then
				if pnjing:time() <= 166 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y-8,0)
				elseif pnjing:time() >= 166 and pnjing:time() <= 332 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y-20,1)
				elseif pnjing:time() >= 332 and pnjing:time() <= 498 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y-30,2)
				elseif pnjing:time() >= 498 and pnjing:time() <= 664 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y-40,0)
				elseif pnjing:time() >= 664 and pnjing:time() <= 830 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y-50,3)
				elseif pnjing:time() >= 830 and pnjing:time() <= 1000 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y-60,4)
				end
				if pnjing:time() > 960 and pnjing:time() < 1000 and x >= (table_monster[num].x-x)-2 and x <= (table_monster[num].x-x) and y >= (table_monster[num].y-y)-70 and y <= (table_monster[num].y-y) then
					energy_module = energy_module - 1
				end
			elseif table_monster[num].statut == "bas" then
				if pnjing:time() <= 166 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y+12,0)
				elseif pnjing:time() >= 166 and pnjing:time() <= 332 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y+24,1)
				elseif pnjing:time() >= 332 and pnjing:time() <= 498 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y+34,2)
				elseif pnjing:time() >= 498 and pnjing:time() <= 664 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y+44,0)
				elseif pnjing:time() >= 664 and pnjing:time() <= 830 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y+54,3)
				elseif pnjing:time() >= 830 and pnjing:time() <= 1000 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+2,table_monster[num].y-y+64,4)
				end
				if pnjing:time() > 960 and pnjing:time() < 1000 and x >= (table_monster[num].x-x) and x <= (table_monster[num].x-x)+10 and y >= (table_monster[num].y-y)-2 and y <= (table_monster[num].y-y)+80 then
					energy_module = energy_module - 1
				end
			elseif table_monster[num].statut == "gauche" then
				if pnjing:time() <= 166 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x-8,table_monster[num].y-y+9,0)
				elseif pnjing:time() >= 166 and pnjing:time() <= 332 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x-20,table_monster[num].y-y+9,1)
				elseif pnjing:time() >= 332 and pnjing:time() <= 498 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x-30,table_monster[num].y-y+9,2)
				elseif pnjing:time() >= 498 and pnjing:time() <= 664 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x-40,table_monster[num].y-y+9,0)
				elseif pnjing:time() >= 664 and pnjing:time() <= 830 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x-50,table_monster[num].y-y+9,3)
				elseif pnjing:time() >= 830 and pnjing:time() <= 1000 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x-60,table_monster[num].y-y+9,4)
				end
				if pnjing:time() > 960 and pnjing:time() < 1000 and x >= (table_monster[num].x-x)-60 and x <= (table_monster[num].x-x) and y >= (table_monster[num].y-y)+9 and y <= (table_monster[num].y-y)+19 then
					energy_module = energy_module - 1
				end
			elseif table_monster[num].statut == "droite" then
				if pnjing:time() <= 166 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+12,table_monster[num].y-y+9,0)
				elseif pnjing:time() >= 166 and pnjing:time() <= 332 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+24,table_monster[num].y-y+9,1)
				elseif pnjing:time() >= 332 and pnjing:time() <= 498 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+34,table_monster[num].y-y+9,2)
				elseif pnjing:time() >= 498 and pnjing:time() <= 664 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+44,table_monster[num].y-y+9,0)
				elseif pnjing:time() >= 664 and pnjing:time() <= 830 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+54,table_monster[num].y-y+9,3)
				elseif pnjing:time() >= 830 and pnjing:time() <= 1000 then
					image.blitsprite(img_monster.special[2],table_monster[num].x-x+64,table_monster[num].y-y+9,4)
				end
				if pnjing:time() > 960 and pnjing:time() < 1000 and x >= (table_monster[num].x-x) and x <= (table_monster[num].x-x)+60 and y >= (table_monster[num].y-y)+9 and y <= (table_monster[num].y-y)+19 then
					energy_module = energy_module - 1
				end
			end
			if x > table_monster[num].x-x then
				table_monster[num].statut = "droite"
			elseif x < table_monster[num].x-x then
				table_monster[num].statut = "gauche"
			elseif y > table_monster[num].y-y then
				table_monster[num].statut = "bas"
			elseif y < table_monster[num].y-y then
				table_monster[num].statut = "haut"
			end
			if table_monster[num].statut == "droite" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then--Fait bouger le personnage
				table_monster[num].x = table_monster[num].x + table_monster[num].speed
			elseif table_monster[num].statut == "gauche" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
				table_monster[num].x = table_monster[num].x - table_monster[num].speed
			elseif table_monster[num].statut == "bas" and map_e[math.floor((table_monster[num].y+35)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
				table_monster[num].y = table_monster[num].y + table_monster[num].speed
			elseif table_monster[num].statut == "haut" and map_e[math.floor((table_monster[num].y+25)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
				table_monster[num].y = table_monster[num].y - table_monster[num].speed
			end
		end
	end
	
	if x >= (table_monster[num].x-2)-x - 120 and x <= (table_monster[num].x-2)-x+120 and y >= (table_monster[num].y-2)-y - 120 and y <= (table_monster[num].y-2)-y+120 - 14 then
		if table_monster[num].statut == "droite" and x > table_monster[num].x-x or table_monster[num].statut == "gauche" and x < table_monster[num].x-x or table_monster[num].statut == "haut" and y < table_monster[num].y-y or table_monster[num].statut == "bas" and y > table_monster[num].y-y then 
			table_monster[num].rage = "attaque"
		end
	end
	
end

function ia_squelette(num)
	if table_monster[num].step == 2 then--Initialisation de l'intelligence artificielle
		table_monster[num].life = 10--Vie du squelette est à 10
		table_monster[num].speed = 2--Vitesse du squelette est à 2
		table_monster[num].step = 3
	end
	
	------------DEGATS-----------
	if collision_p((table_monster[num].x-2)-x,(table_monster[num].y-2)-y,(table_monster[num].x-2)-x+18,(table_monster[num].y-2)-y+35) and pnjing:time() < 50 then
		energy_module = energy_module-1
	end
	
	if x >= (table_monster[num].x-2)-x - 20 and x <= (table_monster[num].x-2)-x+30 and y >= (table_monster[num].y-2)-y - 20 and y <= (table_monster[num].y-2)-y+30 and swording:time() == 100 then
		--Dégats infligé au monstre par le joueur
		poussetoi(num)
	end
	-------------------------------
	
	if table_monster[num].rage == "normal" then
 		if pnjing:time() > 1000 then
 			table_monster[num].statut = statut_alea[math.random(1,4)]
 		end
	elseif table_monster[num].rage == "attaque" then
	
		if x >= (table_monster[num].x-2)-x - 14 and x <= (table_monster[num].x-2)-x+18 and y >= (table_monster[num].y-2)-y - 14 and y <= (table_monster[num].y-2)-y+35 - 14 then
			--Dégats
			
		else
			if x > table_monster[num].x-x then
				table_monster[num].statut = "droite"
			elseif x < table_monster[num].x-x then
				table_monster[num].statut = "gauche"
			elseif y > table_monster[num].y-y then
				table_monster[num].statut = "bas"
			elseif y < table_monster[num].y-y then
				table_monster[num].statut = "haut"
			end
				
		end
		
		if table_monster[num].statut == "droite" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then--Fait bouger le personnage
			table_monster[num].x = table_monster[num].x + table_monster[num].speed
		elseif table_monster[num].statut == "gauche" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
			table_monster[num].x = table_monster[num].x - table_monster[num].speed
		elseif table_monster[num].statut == "bas" and map_e[math.floor((table_monster[num].y+35)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
			table_monster[num].y = table_monster[num].y + table_monster[num].speed
		elseif table_monster[num].statut == "haut" and map_e[math.floor((table_monster[num].y+25)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
			table_monster[num].y = table_monster[num].y - table_monster[num].speed
		end
			
	end
	
	if x >= (table_monster[num].x-2)-x - 100 and x <= (table_monster[num].x-2)-x+100 and y >= (table_monster[num].y-2)-y - 100 and y <= (table_monster[num].y-2)-y+100 - 14 then
		if table_monster[num].statut == "droite" and x > table_monster[num].x-x or table_monster[num].statut == "gauche" and x < table_monster[num].x-x or table_monster[num].statut == "haut" and y < table_monster[num].y-y or table_monster[num].statut == "bas" and y > table_monster[num].y-y then 
			table_monster[num].rage = "attaque"
		end
	end	
end

function ia_buldo(num)
	if table_monster[num].step == 2 then--Initialisation de l'intelligence artificielle
		table_monster[num].life = 20--Vie du bloups est à 20
		table_monster[num].speed = 1--Vitesse du bloups est à 1
		table_monster[num].step = 3
	end
	
	if x >= (table_monster[num].x-2)-x - 20 and x <= (table_monster[num].x-2)-x+30 and y >= (table_monster[num].y-2)-y - 20 and y <= (table_monster[num].y-2)-y+30 and swording:time() == 100 then
		--Dégats infligé au monstre par le joueur
		poussetoi(num)
	end
	
	if table_monster[num].rage == "normal" then
 		if pnjing:time() > 1000 then
 			table_monster[num].statut = statut_alea[math.random(1,4)]
 		end
		if table_monster[num].statut == "droite" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then--Fait bouger le personnage
			table_monster[num].x = table_monster[num].x + table_monster[num].speed
		elseif table_monster[num].statut == "gauche" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
			table_monster[num].x = table_monster[num].x - table_monster[num].speed
		elseif table_monster[num].statut == "bas" and map_e[math.floor((table_monster[num].y+35)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
			table_monster[num].y = table_monster[num].y + table_monster[num].speed
		elseif table_monster[num].statut == "haut" and map_e[math.floor((table_monster[num].y+25)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
			table_monster[num].y = table_monster[num].y - table_monster[num].speed
		else
			table_monster[num].statut = statut_alea[math.random(1,4)]
		end
		if x >= (table_monster[num].x-2)-x - 100 and x <= (table_monster[num].x-2)-x+100 and y >= (table_monster[num].y-2)-y - 100 and y <= (table_monster[num].y-2)-y+100 - 14 then
			if table_monster[num].statut == "droite" and x > table_monster[num].x-x or table_monster[num].statut == "gauche" and x < table_monster[num].x-x or table_monster[num].statut == "haut" and y < table_monster[num].y-y or table_monster[num].statut == "bas" and y > table_monster[num].y-y then 
				table_monster[num].rage = "attaque"
			end
		end
	elseif table_monster[num].rage == "attaque" then
	
		if x >= (table_monster[num].x-2)-x-10 and x <= (table_monster[num].x-2)-x+10 and y >= (table_monster[num].y-2)-y-10 and y <= (table_monster[num].y-2)-y+10 and pnjing:time() <= 60 then
			table_monster[num].rage = "miam"
			table_monster[num].tempx = table_monster[num].x
			table_monster[num].tempy = table_monster[num].y
		else
			if table_monster[num].statut == "droite" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001  then--Fait bouger le personnage
				table_monster[num].x = table_monster[num].x + table_monster[num].speed
			elseif table_monster[num].statut == "gauche" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
				table_monster[num].x = table_monster[num].x - table_monster[num].speed
			elseif table_monster[num].statut == "bas" and map_e[math.floor((table_monster[num].y+35)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
				table_monster[num].y = table_monster[num].y + table_monster[num].speed
			elseif table_monster[num].statut == "haut" and map_e[math.floor((table_monster[num].y+25)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
				table_monster[num].y = table_monster[num].y - table_monster[num].speed
			end	
			if x > table_monster[num].x-x then
				table_monster[num].statut = "droite"
			elseif x < table_monster[num].x-x then
				table_monster[num].statut = "gauche"
			elseif y > table_monster[num].y-y then
				table_monster[num].statut = "bas"
			elseif y < table_monster[num].y-y then
				table_monster[num].statut = "haut"
			end
		end
	elseif table_monster[num].rage == "miam" then
		statut = "bas"
		table_monster[num].statut = "bas"
		stopit = true
		table_monster[num].x = x
		table_monster[num].y = y
		if pnjing:time() <= 166 then
			image.blitsprite(img_monster.special[1],x,y,0)
		elseif pnjing:time() >= 166 and pnjing:time() <= 1000 then
			image.blitsprite(img_monster.special[1],x,y,1)
		elseif pnjing:time() >= 1000 then
			energy_module = energy_module-2
			table_monster[num].x = table_monster[num].tempx + 10
			table_monster[num].y = table_monster[num].tempy
			table_monster[num].tempx = nil
			table_monster[num].tempy = nil
			stopit = false
			table_monster[num].rage = "normal"
		end
	end
end

function ia_bloups(num)
	if table_monster[num].step == 2 then--Initialisation de l'intelligence artificielle
		table_monster[num].life = 30--Vie du bloups est à 30
		table_monster[num].speed = 0.5--Vitesse du bloups est à 0.5
		table_monster[num].step = 3
	end
	
	if x >= (table_monster[num].x-2)-x - 30 and x <= (table_monster[num].x-2)-x+30 and y >= (table_monster[num].y-2)-y - 30 and y <= (table_monster[num].y-2)-y+30 and swording:time() == 100 then
		--Dégats infligé au monstre par le joueur
		poussetoi(num)
	end	
	
	if table_monster[num].rage == "normal" then
 		if pnjing:time() > 1000 then
 			table_monster[num].statut = statut_alea[math.random(1,4)]
 		end
		if table_monster[num].statut == "droite" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then--Fait bouger le personnage
			table_monster[num].x = table_monster[num].x + table_monster[num].speed
		elseif table_monster[num].statut == "gauche" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
			table_monster[num].x = table_monster[num].x - table_monster[num].speed
		elseif table_monster[num].statut == "bas" and map_e[math.floor((table_monster[num].y+35)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
			table_monster[num].y = table_monster[num].y + table_monster[num].speed
		elseif table_monster[num].statut == "haut" and map_e[math.floor((table_monster[num].y+25)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
			table_monster[num].y = table_monster[num].y - table_monster[num].speed
		else
			table_monster[num].statut = statut_alea[math.random(1,4)]
		end
		if x >= (table_monster[num].x-2)-x - 100 and x <= (table_monster[num].x-2)-x+100 and y >= (table_monster[num].y-2)-y - 100 and y <= (table_monster[num].y-2)-y+100 - 14 then
			if table_monster[num].statut == "droite" and x > table_monster[num].x-x or table_monster[num].statut == "gauche" and x < table_monster[num].x-x or table_monster[num].statut == "haut" and y < table_monster[num].y-y or table_monster[num].statut == "bas" and y > table_monster[num].y-y then 
				table_monster[num].rage = "attaque"
			end
		else
			table_monster[num].rage = "normal"
		end
	elseif table_monster[num].rage == "attaque" then
	
		if x >= (table_monster[num].x-2)-x-10 and x <= (table_monster[num].x-2)-x+10 and y >= (table_monster[num].y-2)-y-10 and y <= (table_monster[num].y-2)-y+10 and pnjing:time() <= 60 then
			table_monster[num].rage = "miam"
			table_monster[num].tempx = table_monster[num].x
			table_monster[num].tempy = table_monster[num].y
		else
			if table_monster[num].statut == "droite" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001  then--Fait bouger le personnage
				table_monster[num].x = table_monster[num].x + table_monster[num].speed
			elseif table_monster[num].statut == "gauche" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
				table_monster[num].x = table_monster[num].x - table_monster[num].speed
			elseif table_monster[num].statut == "bas" and map_e[math.floor((table_monster[num].y+35)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
				table_monster[num].y = table_monster[num].y + table_monster[num].speed
			elseif table_monster[num].statut == "haut" and map_e[math.floor((table_monster[num].y+25)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
				table_monster[num].y = table_monster[num].y - table_monster[num].speed
			end	
			if x > table_monster[num].x-x then
				table_monster[num].statut = "droite"
			elseif x < table_monster[num].x-x then
				table_monster[num].statut = "gauche"
			elseif y > table_monster[num].y-y then
				table_monster[num].statut = "bas"
			elseif y < table_monster[num].y-y then
				table_monster[num].statut = "haut"
			end
		end
	elseif table_monster[num].rage == "miam" then
		statut = "bas"
		table_monster[num].statut = "bas"
		stopit = true
		table_monster[num].x = x
		table_monster[num].y = y
		if pnjing:time() <= 166 then
			image.blitsprite(img_monster.special[3],x,y,0)
		elseif pnjing:time() >= 166 and pnjing:time() <= 1000 then
			image.blitsprite(img_monster.special[3],x,y,1)
		elseif pnjing:time() >= 1000 then
			table_monster[num].x = table_monster[num].tempx + 10
			table_monster[num].y = table_monster[num].tempy
			energy_module = energy_module-2
			table_monster[num].tempx = nil
			table_monster[num].tempy = nil
			stopit = false
			table_monster[num].rage = "normal"
		end
	end
	
end

function ia_fantome(num)
	if table_monster[num].step == 2 then--Initialisation de l'intelligence artificielle
		table_monster[num].life = 20--Vie du fantome est à 20
		table_monster[num].speed = 1--Vitesse du fantome est à 1
		table_monster[num].step = 3
	end
	
	------------DEGATS-----------
	if collision_p((table_monster[num].x-2)-x,(table_monster[num].y-2)-y,(table_monster[num].x-2)-x+18,(table_monster[num].y-2)-y+35) and pnjing:time() < 50 then
		energy_module = energy_module-1
	end
	
	if x >= (table_monster[num].x-2)-x - 20 and x <= (table_monster[num].x-2)-x+30 and y >= (table_monster[num].y-2)-y - 20 and y <= (table_monster[num].y-2)-y+30 and swording:time() == 100 then
		--Dégats infligé au monstre par le joueur
		poussetoi(num)
	end
	-------------------------------
	if table_monster[num].rage == "normal" then
 		if pnjing:time() > 1000 then
 			table_monster[num].statut = statut_alea[math.random(1,4)]
 		end
	elseif table_monster[num].rage == "attaque" then
 		if pnjing:time() > 1000 then
 			table_monster[num].statut = statut_alea[math.random(1,4)]
			if table_monster[num].statut == "droite" then--Fait bouger le personnage
				table_monster[num].x = (x*2) - 80
				table_monster[num].y = (y*2)
			elseif table_monster[num].statut == "gauche" then
				table_monster[num].x = (x*2) +80
				table_monster[num].y = (y*2)
			elseif table_monster[num].statut == "bas" then
				table_monster[num].y = (y*2) -80
				table_monster[num].x = (x*2) 
			elseif table_monster[num].statut == "haut" then
				table_monster[num].y = (y*2)+80
				table_monster[num].x = (x*2) 
			end		
 		end
		
		if table_monster[num].statut == "droite" then--Fait bouger le personnage
			table_monster[num].x = table_monster[num].x + table_monster[num].speed
		elseif table_monster[num].statut == "gauche" then
			table_monster[num].x = table_monster[num].x - table_monster[num].speed
		elseif table_monster[num].statut == "bas" then
			table_monster[num].y = table_monster[num].y + table_monster[num].speed
		elseif table_monster[num].statut == "haut" then
			table_monster[num].y = table_monster[num].y - table_monster[num].speed
		end		
			
	end
	
	if x >= (table_monster[num].x-2)-x - 100 and x <= (table_monster[num].x-2)-x+100 and y >= (table_monster[num].y-2)-y - 100 and y <= (table_monster[num].y-2)-y+100 - 14 and table_monster[num].rage ~= "attaque" then
		if table_monster[num].statut == "droite" and x > table_monster[num].x-x or table_monster[num].statut == "gauche" and x < table_monster[num].x-x or table_monster[num].statut == "haut" and y < table_monster[num].y-y or table_monster[num].statut == "bas" and y > table_monster[num].y-y then 
 			table_monster[num].statut = statut_alea[math.random(1,4)]
			if table_monster[num].statut == "droite" then--Fait bouger le personnage
				table_monster[num].x = (x*2) - 80
				table_monster[num].y = (y*2)
			elseif table_monster[num].statut == "gauche" then
				table_monster[num].x = (x*2) +80
				table_monster[num].y = (y*2)
			elseif table_monster[num].statut == "bas" then
				table_monster[num].y = (y*2) -80
				table_monster[num].x = (x*2)
			elseif table_monster[num].statut == "haut" then
				table_monster[num].y = (y*2)+80
				table_monster[num].x = (x*2) 
			end		
			table_monster[num].rage = "attaque"
		end
	end
	
	
end

function ia_zombie(num)
	if table_monster[num].step == 2 then--Initialisation de l'intelligence artificielle
		table_monster[num].life = 20--Vie du zombie est à 20
		table_monster[num].speed = 1--Vitesse du zombie est à 1
		table_monster[num].step = 3
	end
	
	------------DEGATS-----------
	if collision_p((table_monster[num].x-2)-x,(table_monster[num].y-2)-y,(table_monster[num].x-2)-x+18,(table_monster[num].y-2)-y+35) and pnjing:time() < 50 then
		energy_module = energy_module-1
	end
	
	if x >= (table_monster[num].x-2)-x - 20 and x <= (table_monster[num].x-2)-x+30 and y >= (table_monster[num].y-2)-y - 20 and y <= (table_monster[num].y-2)-y+30 and swording:time() == 100 then
		--Dégats infligé au monstre par le joueur
		poussetoi(num)
	end
	-------------------------------
		
	if table_monster[num].rage == "normal" then
 		if pnjing:time() > 1000 then
 			table_monster[num].statut = statut_alea[math.random(1,4)]
 		end
	elseif table_monster[num].rage == "attaque" then
		if x >= (table_monster[num].x-2)-x - 20 and x <= (table_monster[num].x-2)-x+20 and y >= (table_monster[num].y-2)-y - 20 and y <= (table_monster[num].y-2)-y+20 then
			
		else
			if x > table_monster[num].x-x then
				table_monster[num].statut = "droite"
			elseif x < table_monster[num].x-x then
				table_monster[num].statut = "gauche"
			elseif y > table_monster[num].y-y then
				table_monster[num].statut = "bas"
			elseif y < table_monster[num].y-y then
				table_monster[num].statut = "haut"
			end
		end
		
		if table_monster[num].statut == "droite" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then--Fait bouger le personnage
			table_monster[num].x = table_monster[num].x + table_monster[num].speed
		elseif table_monster[num].statut == "gauche" and map_e[math.floor((table_monster[num].y+30)/16)][math.floor((table_monster[num].x+15)/16)] ~= 0x0001 then
			table_monster[num].x = table_monster[num].x - table_monster[num].speed
		elseif table_monster[num].statut == "bas" and map_e[math.floor((table_monster[num].y+35)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
			table_monster[num].y = table_monster[num].y + table_monster[num].speed
		elseif table_monster[num].statut == "haut" and map_e[math.floor((table_monster[num].y+25)/16)][math.floor((table_monster[num].x+30)/16)] ~= 0x0001 then
			table_monster[num].y = table_monster[num].y - table_monster[num].speed
		end
			
	end
	
	if x >= (table_monster[num].x-2)-x - 100 and x <= (table_monster[num].x-2)-x+100 and y >= (table_monster[num].y-2)-y - 100 and y <= (table_monster[num].y-2)-y+100 - 14 then
		if table_monster[num].statut == "droite" and x > table_monster[num].x-x or table_monster[num].statut == "gauche" and x < table_monster[num].x-x or table_monster[num].statut == "haut" and y < table_monster[num].y-y or table_monster[num].statut == "bas" and y > table_monster[num].y-y then 
			table_monster[num].rage = "attaque"
		end
	end
end

function poussetoi(num)--Simple function which puch the monster because of the sword damage
	
	table_monster[num].life = table_monster[num].life - (5*epee)
	if statut == "droite" then
		table_monster[num].x = table_monster[num].x + table_monster[num].speed +1
	elseif statut == "gauche" then
		table_monster[num].x = table_monster[num].x - table_monster[num].speed -1
	elseif statut == "bas" then
		table_monster[num].y = table_monster[num].y + table_monster[num].speed +1
	elseif statut == "haut" then
		table_monster[num].y = table_monster[num].y - table_monster[num].speed -1
	end
end