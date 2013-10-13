require "player" 
require "maps"
require "menu"
require "sound"
require "camera"

function love.load( )
	PlyLoad( )
	
	FontMed = love.graphics.newFont( 20 )
	ImgBG = love.graphics.newImage( "Images/BGI.png" )
	love.graphics.setBackgroundColor( 255, 255, 255 )
	
	GState = "MenuStart"
	CurWorldNum = 1
	WorldLoad( CurWorldNum )
	Options.ShowFPS = false
	-- Sounds --
	TEsound.playLooping( Sound_BGM1, "bgm", 3, 0.05 )
	
	BtnCreate( "Start", ScrWidth/2-100, ScrHeight/2, "Start", false )
	BtnCreate( "Options", ScrWidth/2-40, ScrHeight/2, "Options", false )
	BtnCreate( "Quit", ScrWidth/2+50, ScrHeight/2, "Quit", false )

	
end


function love.update( dt )
	Rate = dt
	MouseX = love.mouse.getX( )
	MouseY = love.mouse.getY( )
	TEsound.cleanup( )
	
	if GState == "Playing" then
		PlyUpdate( )
		PlyMovement( Rate )
		--BorderCollisions( )
		
		if Ply.X > love.graphics.getWidth( ) / 2 then
			camera.x = Ply.X - love.graphics.getWidth( ) / 2
		end
		if Ply.Y > love.graphics.getHeight( ) / 2 then
			camera.y = Ply.Y - love.graphics.getHeight( ) / 2
		end
		
	elseif GState == "MenuStart" then
		BtnCheck( )
	end


end


function love.draw( )
	if GState == "Playing" then
		camera:set( )
		WorldDraw( )
		PlyDraw( )
		camera:unset( )
		
	elseif GState == "MenuOptions" then
		love.graphics.setColor( 255, 255, 255 )
		love.graphics.draw( ImgBG, 0, 0 )
		if Options.ShowFPS == true then
			love.graphics.print( tostring( love.timer.getFPS( ) ), 10, 10 )
		end
		
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



   
