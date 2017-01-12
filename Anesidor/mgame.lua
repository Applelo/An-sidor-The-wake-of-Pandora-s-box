--FUNCTION INVENTAIRE--
img_inventaire = {image.load("img/inventaire/1.png"),image.load("img/inventaire/2.png"),image.load("img/inventaire/3.png")}
img_select_inventaire = {curseur=image.load("img/inventaire/select.png"),center=image.load("img/inventaire/select_center.png"),menu=image.load("img/inventaire/select_menu.png")}
sword_inventaire = image.load("img/inventaire/sword.png",36,60)
color_inventaire = color.new(1,1,1,200)
item_inventaire = {{nombre=0,vie=1},{nombre=0,vie=2}}
grille_inventaire = {0,0,0,0,0,0,0,0,0,0,0,0}
img_item_inventaire = image.load("img/inventaire/item.png",34,34)
step_inventaire = 0
deux_selecteur = 1
true_selecteur = 1
option_inventaire = false
alert_inventaire = 0
-----------------------
--FUNCTION ACHAT--
img_achat = image.load("img/achat.png")
step_achat = 0
--------------------

function inventaire()
	
	--Changement d'inventaire
	if step_inventaire > 0 then
		if buttons.r then
			sound.play(sound_wav.bip,2)
			selecteur = 1
			deux_selecteur = 1
			step_inventaire = step_inventaire + 1
		elseif buttons.l then
			sound.play(sound_wav.bip,2)
			selecteur = 1
			deux_selecteur = 1
			step_inventaire = step_inventaire - 1
		end
		if step_inventaire < 1 then
			step_inventaire = 3
		elseif step_inventaire > 3 then
			step_inventaire = 1
		end
		image.blit(img_inventaire[step_inventaire],10,10)
		screen.print(240,30,l_inventaire[step_inventaire],0.8,color.white,color.black,__ACENTER)
	end
	-------
	
	if step_inventaire == 1 then
		
		--Gauche
		for i=1,3 do
			if grille_inventaire[i] == 0 then
				draw.fillrect(29,23+63*i,35,35,color_inventaire)
			else
				image.blitsprite(img_item_inventaire,30,23+63*i,grille_inventaire[i]-1)
				screen.print(30,23+63*i,item_inventaire[grille_inventaire[i]].nombre,0.6,color.white,color.black)
			end
		end
		for i=1,2 do
			if grille_inventaire[i+3] == 0 then
				draw.fillrect(85,86+63*i,35,35,color_inventaire)
			else
				image.blitsprite(img_item_inventaire,85,86+63*i,grille_inventaire[i+3]-1)
				screen.print(85,86+63*i,item_inventaire[grille_inventaire[i+3]].nombre,0.6,color.white,color.black)
			end
		end
		if grille_inventaire[6] == 0 then
			draw.fillrect(141,212,35,35,color_inventaire)
		else
			image.blitsprite(img_item_inventaire,141,212,grille_inventaire[6]-1)
			screen.print(141,212,item_inventaire[grille_inventaire[6]].nombre,0.6,color.white,color.black)
		end
		-------
		
		image.blitsprite(sword_inventaire,222,150,epee-1)--Image Blit
		
		--Droite
		if grille_inventaire[7] == 0 then
			draw.fillrect(305,212,35,35,color_inventaire)
		else
			image.blitsprite(img_item_inventaire,305,212,grille_inventaire[7]-1)
			screen.print(305,212,item_inventaire[grille_inventaire[7]].nombre,0.6,color.white,color.black)
		end
		for i=1,2 do
			if grille_inventaire[i+7] == 0 then
				draw.fillrect(361,86+63*i,35,35,color_inventaire)
			else
				image.blitsprite(img_item_inventaire,361,86+63*i,grille_inventaire[7+i]-1)
				screen.print(361,86+63*i,item_inventaire[grille_inventaire[i+7]].nombre,0.6,color.white,color.black)
			end
		end
		for i=1,3 do
			if grille_inventaire[i+9] == 0 then
				draw.fillrect(417,23+63*i,35,35,color_inventaire)
			else
				image.blitsprite(img_item_inventaire,417,23+63*i,grille_inventaire[9+i]-1)
				screen.print(417,23+63*i,item_inventaire[grille_inventaire[i+9]].nombre,0.6,color.white,color.black)
			end
		end
		-------
		
		if buttons.right then
			sound.play(sound_wav.bip,2)
			deux_selecteur = deux_selecteur + 1
		elseif buttons.left then
			sound.play(sound_wav.bip,2)
			deux_selecteur = deux_selecteur - 1
		elseif buttons.up then
			sound.play(sound_wav.bip,2)
			selecteur = selecteur - 1
		elseif buttons.down then
			sound.play(sound_wav.bip,2)
			selecteur = selecteur + 1
		end
		
		if deux_selecteur == 1 or deux_selecteur == 7 then
			if selecteur < 1 then
				selecteur = 3
			elseif selecteur >3 then
				selecteur = 1
			end
		elseif deux_selecteur == 2 or deux_selecteur == 6 then
			if selecteur < 2 then
				selecteur = 3
			elseif selecteur >3 then
				selecteur = 2
			end
		elseif deux_selecteur == 3 or deux_selecteur == 5 then
			selecteur = 3
		end
		
		if deux_selecteur < 1 then
			deux_selecteur = 7
		elseif deux_selecteur > 7 then
			deux_selecteur = 1
		end
		
		--Selecteur dans la grille de l'inventaire
		if deux_selecteur == 1 or deux_selecteur == 5 then
			true_selecteur = selecteur+deux_selecteur-1
		elseif deux_selecteur == 2 or deux_selecteur == 3 or deux_selecteur == 6 then
			true_selecteur = selecteur+deux_selecteur
		elseif deux_selecteur == 7 then
			true_selecteur = selecteur+deux_selecteur+2
		else
			true_selecteur = -1--Pour éviter tout conflit
		end
		
		if deux_selecteur < 4 then
			image.blit(img_select_inventaire.curseur,-31+(deux_selecteur*56),19+63*selecteur)
		end
		if deux_selecteur == 4 then
			image.blit(img_select_inventaire.center,211,138)
			screen.print(240,230,l_epee[epee],0.6,color.white,color.black,__ACENTER)--Epée
		end
		if deux_selecteur > 4 then
			image.blit(img_select_inventaire.curseur,22+(deux_selecteur*56),19+63*selecteur)
		end
		
		if grille_inventaire[true_selecteur] ~= 0 and true_selecteur ~= -1 then
			screen.print(240,230,l_inventaire_item[grille_inventaire[true_selecteur]],0.7,color.white,color.black,__ACENTER)
			if item_inventaire[grille_inventaire[true_selecteur]].vie > 0 then
				screen.print(240,80,"X - Utiliser",0.7,color.white,color.black,__ACENTER)
				screen.print(240,95,"+"..item_inventaire[grille_inventaire[true_selecteur]].vie,0.7,color.green,color.black,__ACENTER)
				if buttons.cross and energy_module < level_module then
					sound.play(sound_wav.bip,2)
					energy_module = energy_module + item_inventaire[grille_inventaire[true_selecteur]].vie--Ajoute de la vie
					if energy_module>level_module then
						energy_module=level_module
					end
					item_inventaire[grille_inventaire[true_selecteur]].nombre = item_inventaire[grille_inventaire[true_selecteur]].nombre - 1
					if item_inventaire[grille_inventaire[true_selecteur]].nombre == 0 then
						grille_inventaire[true_selecteur] = 0
						reload_inventaire()
					end
				end
			end
		end
		
	elseif step_inventaire == 2 then
		
	elseif step_inventaire == 3 then
		
		if selecteur == 1 then
			draw.fillrect(94,137,292,49,color_inventaire)
			draw.fillrect(94,200,292,49,color_inventaire)
		elseif selecteur == 2 then
			draw.fillrect(94,74,292,49,color_inventaire)
			draw.fillrect(94,200,292,49,color_inventaire)
		elseif selecteur == 3 then
			draw.fillrect(94,74,292,49,color_inventaire)
			draw.fillrect(94,137,292,49,color_inventaire)
		end
		
		for i=1,3 do
			screen.print(240,35.5+(i*63),l_inventaire_menu[i],0.9,color.white,color.black,__ACENTER)
		end
		image.blit(img_select_inventaire.menu,90,7+(63*selecteur))
		
		if buttons.cross then
			sound.play(sound_wav.bip,2)
			if selecteur == 1 then
				save()
				--RAJOUTER POUR LES OPTIONS
			elseif selecteur == 3 and alert_inventaire == 0 then
				alert_inventaire = 1
			elseif selecteur == 3 and alert_inventaire == 1 then	
				selecteur = 1
				alert_inventaire = 0
				step_inventaire = 0
				task = "menu"
			end
		end
		if buttons.circle and alert_inventaire > 0 then
			sound.play(sound_wav.bip,2)
			alert_inventaire = 0
		end
	
		if alert_inventaire == 0 then
			if buttons.up then
				sound.play(sound_wav.bip,2)
				selecteur = selecteur - 1
			elseif buttons.down then
				sound.play(sound_wav.bip,2)
				selecteur = selecteur + 1
			end
		else
			draw.fillrect(0,0,480,272,color_inventaire)
			image.blit(img_selecteur_menu,90,74)
			screen.print(240,85,l_inventaire_alert[1],0.6,color.white,color.black,__ACENTER,280)
			screen.print(100,140,"X:"..l_inventaire_alert[2],0.6,color.white,color.black,__ALEFT)
			screen.print(380,140,"O:"..l_inventaire_alert[3],0.6,color.white,color.black,__ARIGHT)
		end
		if selecteur < 1 then
			selecteur = 3
		elseif selecteur >3 then
			selecteur = 1
		end
		
		
	end
end

function reload_inventaire()
	rangement_inventaire = 1
	temp_grille_inventaire = {0,0,0,0,0,0,0,0,0,0,0,0}
	
	for i=1,12 do
		if grille_inventaire[i] > 0 then
			temp_grille_inventaire[rangement_inventaire] = grille_inventaire[i]
			rangement_inventaire = rangement_inventaire +1
		end
	end
	
	for i=1,12 do
		grille_inventaire[i] = temp_grille_inventaire[i]
	end
	
	rangement_inventaire = nil
	temp_grille_inventaire = nil
end

function achat()
	if step_achat == 1 then
		image.blit(img_achat,389,0)
	end
	
end