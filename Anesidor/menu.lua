task = "menu"--Charge menu
selecteur = 1--Selecteur menu
img_menu = image.load("img/menu.png")
img_selecteur_menu = image.load("img/menu_principal.png")
img_fond_menu = image.load("img/fond.png")

function menu()
	for i=1,2 do
		image.blit(img_fond_menu,x_fog_meteo+(481*i),0)
	end
	x_fog_meteo = x_fog_meteo-0.2
	if x_fog_meteo < -960 then
		x_fog_meteo = -480
	end
	
	image.blit(img_menu,0,0)
	screen.print(240,30,"Anésidor:The wake of Pandora's box",1.0,color.white,color.black,__ACENTER)--Titre
	draw.line(120,45,360,45,color.white)
	draw.line(118,48,362,48,color.white)
	if selecteur == 1 then
		draw.fillrect(94,123.5,292,49,color_inventaire)
		draw.fillrect(94,186,292,49,color_inventaire)
	elseif selecteur == 2 then
		draw.fillrect(94,61,292,49,color_inventaire)
		draw.fillrect(94,186,292,49,color_inventaire)
	elseif selecteur == 3 then
		draw.fillrect(94,61,292,49,color_inventaire)
		draw.fillrect(94,123.5,292,49,color_inventaire)
	end
	
	for i=1,3 do
		image.blit(img_selecteur_menu,90,-5.5+(i*62.5))
		screen.print(240,20+(i*62.5),l_menu[i],0.9,color.white,color.black,__ACENTER)
	end
	image.blit(img_select_inventaire.menu,90,-5.5+(62.5*selecteur))
	
	screen.print(380,250,"Version alpha",0.5,color.white)
	
	if buttons.cross then
		sound.play(sound_wav.bip,2)
		if selecteur == 1 then
			selecteur = 1
			load()--Charge une deuxième fois pour la forme :p
			task = "jeu"
		elseif selecteur == 2 then
			selecteur = 1
			task = "credits"
		else
			os.exit()
		end
	end

	if buttons.up then
		sound.play(sound_wav.bip,2)
		selecteur = selecteur - 1
	elseif buttons.down then
		sound.play(sound_wav.bip,2)
		selecteur = selecteur + 1
	end
	if selecteur < 1 then
		selecteur = 3
	elseif selecteur >3 then
		selecteur = 1
	end
	
end


function credit()
	
	
end