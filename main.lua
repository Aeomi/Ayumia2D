require "player" 
require "maps"
require "menu"

function love.load( )
	PlyLoad( )
	
	FontMed = love.graphics.newFont( 20 )
	ImgBG = love.graphics.newImage( "Images/BGI.png" )
	love.graphics.setBackgroundColor( 255, 255, 255 )
	
	GState = "MenuStart"
	CurWorldNum = 1
	WorldLoad( CurWorldNum )
	
	
	BtnCreate( "Start", ScrWidth/2-100, ScrHeight/2, "Start", false )
	BtnCreate( "Options", ScrWidth/2-40, ScrHeight/2, "Options", false )
	BtnCreate( "Quit", ScrWidth/2+50, ScrHeight/2, "Quit", false )

	
end


function love.update( dt )
	Rate = dt
	MouseX = love.mouse.getX( )
	MouseY = love.mouse.getY( )
	
	if GState == "Playing" then
		PlyUpdate( )
		PlyMovement( Rate )
		BorderCollisions( )
	elseif GState == "MenuStart" then
		BtnCheck( )
	end
	
end


function love.draw( )
	if GState == "Playing" then
		WorldDraw( )
		PlyDraw( )
		love.graphics.print( Ply.XVel, 300, 300 )
		love.graphics.print( Ply.YVel, 300, 330 )
	elseif GState == "MenuStart" then
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.draw( ImgBG, 0, 0 )
		Btn_Draw( )
	end
	
	
end


function love.mousepressed( x, y )
	if GState == "MenuStart" then
		BtnDoClick( x, y )
	end
end
