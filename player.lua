

function PlyLoad( ) -- Load the player up when the game starts

	-- Tables & Arrays --
	Ply = { 
		AvImg = false;
		World = false; 
		X = 10;
		Y = 10;
		XVel = 0;
		YVel = 0;
		Width = false;
		Height = false;
		Friction = 3.5;
		HP = 100;
		Speed = 25
	}

		
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

function PlyUpdate( )
	Ply.Width = Ply.AvImg:getWidth( )
	Ply.Height = Ply.AvImg:getHeight( )
end

function PlyDraw( )

	if not Ply.AvImg then
		Ply.AvImg = CharError
	end
	love.graphics.draw( Ply.AvImg, Ply.X, Ply.Y )
	
end


function PlyMovement( Rate )
	local Sprint
	local MaxSpeed
	Ply.X = Ply.X + Ply.XVel
	Ply.Y = Ply.Y + Ply.YVel
	Ply.XVel = Ply.XVel * ( 1 - math.min( Rate * Ply.Friction, 1 ) )
	Ply.YVel = Ply.YVel * ( 1 - math.min( Rate * Ply.Friction, 1 ) )
	
	if love.keyboard.isDown( "lshift" ) then
		Sprint = ( Ply.Speed / 1.5 )
		MaxSpeed = 4
	else
		Sprint = 0
		MaxSpeed = 2
	end

	if love.keyboard.isDown( "d" ) then
		Ply.AvImg = CharRight
		if Ply.XVel < MaxSpeed then Ply.XVel = Ply.XVel + ( Ply.Speed + Sprint ) * Rate end
	end
	if love.keyboard.isDown( "a" ) then
		Ply.AvImg = CharLeft
		if Ply.XVel > -MaxSpeed then Ply.XVel = Ply.XVel - ( Ply.Speed + Sprint ) * Rate end
	end
	
	
	if love.keyboard.isDown( "s" ) then
		Ply.AvImg = CharDown
		if Ply.YVel < MaxSpeed then Ply.YVel = Ply.YVel + ( Ply.Speed + Sprint ) * Rate end
	end
	if love.keyboard.isDown( "w" ) then
		Ply.AvImg = CharUp
		if Ply.YVel > -MaxSpeed then Ply.YVel = Ply.YVel - ( Ply.Speed + Sprint ) * Rate end
	end

	
end


