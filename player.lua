

function PlyLoad( ) -- Load the player up when the game starts

	-- Tables & Arrays --
	Ply = { AvImg = nil, World = nil, X = 10, Y = 10, HP = 100, Speed = 1 }

		
	CharError = love.graphics.newImage( "Images/Error1.png" )
	CharUp = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Up.png" )
	CharDown = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Down.png" )
	CharLeft = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Left.png" )
	CharRight = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Right.png" )
	
	
	
	-- Set Player to Defaults on startup --
	local RandSpawn = false
	Ply.AvImg = CharDown
	if RandSpawn then
		Ply.X = math.random( 100, ( ScrHeight - 100 ) )
		Ply.Y = math.random( 100, ( ScrWidth - 100 ) )
	else
		Ply.X = ScrHeight / 2 
		Ply.Y = ScrWidth / 2
	end
	


end


function PlyDraw( )

	if Ply.AvImg == nil then
		Ply.AvImg = CharError
	end
	love.graphics.draw( Ply.AvImg, Ply.X, Ply.Y )
	
end


function PlyMovement( Rate )
	local Sprint
	
	if love.keyboard.isDown( "lshift" ) then
		Sprint = 1
	else
		Sprint = 0
	end

	if love.keyboard.isDown( "d" ) then
		Ply.AvImg = CharRight
		Ply.X = Ply.X + ( Ply.Speed + Sprint ) * Rate
	end
	if love.keyboard.isDown( "a" ) then
		Ply.AvImg = CharLeft
		Ply.X = Ply.X - ( Ply.Speed + Sprint ) * Rate
	end
	if love.keyboard.isDown( "s" ) then
		Ply.AvImg = CharDown
		Ply.Y = Ply.Y + ( Ply.Speed + Sprint ) * Rate
	end
	if love.keyboard.isDown( "w" ) then
		Ply.AvImg = CharUp
		Ply.Y = Ply.Y - ( Ply.Speed + Sprint ) * Rate
	end

	
end

