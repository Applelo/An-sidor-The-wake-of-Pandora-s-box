function jeu()
	if state == 1 then
		--effect("seisme")
		mapper("test",1)
		monster(2,2,"squelette",270,300,1)
		--monster(0,0,"fantome",300,300,1)
		--monster(1,1,"pistol",330,300,4)
		--monster(4,4,"zombie",270,300,2)
		--monster(3,3,"buldo",360,300,3)
		transition("gauche",2)
		transition("droite",2)
		pnj(4,2,"pensky/louis",370,250,"bas","normal",2,"Bugy","tour",258,115)
		pnj(1,1,"pensky/louis",500,150,"bas","normal",1,"Wirus","gauche_droite",80,0)
		pnj(19,3,"pensky/jenny",684,220,"droite","normal",3,"Jenny")
		pnj(5,1,"pensky/clement",736,220,"gauche","normal",4,"Clément")
		link_dial(3,4,2,false,"pensky/Jenny-Clement/jenny","pensky/Jenny-Clement/clement","Jenny","Clément",1)--Lier deux personnages pour qu'il discute ensemble
		pnj(2,7,"pensky/valentin",232,166,"bas","normal",5,"Valentin")
		pnj(2,2,"pensky/vincent",232,212,"haut","normal",6,"Vincent")
		link_dial(5,6,2,true,"pensky/Valentin-Vincent/valentin","pensky/Valentin-Vincent/vincent","Valentin","Vincent",2)--Lier deux personnages pour qu'il discute ensemble
	 teleporter(100,100,1)
	elseif state == 2 then
		mapper("test",1)
		transition("gauche",1)
		transition("droite",1)
	end
	
	if info_dev == 1 then
		screen.print(2,2,x.."\n"..y.."\n"..tempo_save,0.7,color.white)
		screen.print(400,2,"FPS: "..screen.fps(),0.7,color.white)
	end
	
	weather()
	print_dialogue()
	inventaire()
	module()
	
end