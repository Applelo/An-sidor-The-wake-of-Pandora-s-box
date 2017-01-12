os.debug()
--CHARGE LES FONCTIONS ET AFFICHE LA PROGRESSION DU TELECHARGEMENT
img_load = image.load("img/load.png")
image.center(img_load)	
image.blit(img_load,15,250)
screen.flip()
font.setdefault("font/ltn12.pgf")--Chargement de la police
dofile("menu.lua")--chargement des menus hors jeu
image.rotate(img_load,90)	
image.blit(img_load,15,250)
screen.flip()
dofile("game.lua")--chargement du jeu
image.rotate(img_load,180)	
image.blit(img_load,15,250)
screen.flip()
dofile("engine.lua")--chargement du moteur du jeu
dofile("ia.lua")--chargement des intelligences artificielles
image.rotate(img_load,270)	
image.blit(img_load,15,250)
screen.flip()
dofile("mgame.lua")--chargement des menus dans le jeu
dofile("lib/starlight.lua")--chargement librairie
image.blit(img_load,15,250)
screen.flip()
image.reset(img_load)
if os.language() == "FRENCH" then
	lang = "FRENCH"
	dofile("lang/FRENCH/system.lua")--chargement du fichier langue
else
	lang = "ENGLISH"
	dofile("lang/ENGLISH/system.lua")--chargement du fichier langue
end
--

--42*6 + 5*8

--Charge la sauevarde--
load()
-------------------------
stop_it = false
color.loadpalette()
nil_color = color.new(0,0,0,0,0)
alpha = {
	white = color.new(255,255,255,200),
	black = color.new(0,0,0,0,200),
	red = color.new(255,0,0,0,50),
	dark = color.new(2,2,4,200),
	font_white = color.new(255,255,255,50)
}
tel_color = {color.new(14,121,255),color.new(0,146,255)}
--------------------------
starlight_set()--Met en place les étoiles
--------------------------
sound_wav = {bip=sound.load("sound/wav/bip.wav"),save=sound.load("sound/wav/save.wav"),slash=sound.load("sound/wav/slash.wav"),menu_open=sound.load("sound/wav/menu_open.wav"),menu_close=sound.load("sound/wav/menu_close.wav")}		
---------SPLASH--------------A REMETTRE QUAND FINI
--splash.show()	
--splash.show({"img/zenyth.png","img/cp.png"})
-----------------------------


while true do
	buttons.read()--Lecture des contrôles
	if task == "menu" then
		menu()
	elseif task == "jeu" then
		jeu()
	elseif task == "credits" then
		credit()
	end
	screen.flip()
end