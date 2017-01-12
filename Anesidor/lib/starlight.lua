--Starlight by Shine, readapted by Applelo
function starlight_set()
	star = {}
	star.size = 200
	star.zMax = 5
	star.speed = 0.1
	star.x = 0
	star.y = 0
	star.width = 480
	star.height = 272

	star.field = {}
	math.randomseed(os.time())
	
	for i = 1, star.size do
		starlight_create(i)
		star.field[i].z = math.random(star.zMax)
	end
	
end

function starlight_create(i)
	star.field[i] = {}
	star.field[i].x = math.random(2*star.width) - star.width
	star.field[i].y = math.random(2*star.height) - star.height
	star.field[i].z = star.zMax
end

function starlight_launch(color)
	
	for i = 1, star.size do
		star.field[i].z = star.field[i].z - star.speed
		if star.field[i].z < star.speed then starlight_create(i) end
		star.x = star.width / 2 + star.field[i].x / star.field[i].z
		star.y = star.height / 2 + star.field[i].y / star.field[i].z
		if star.x < 0 or star.y < 0 or star.x >= star.width or star.y >= star.height then
			starlight_create(i)
		else
			  draw.fillrect(star.x, star.y,4,4,color)
		end
	end
	
end

