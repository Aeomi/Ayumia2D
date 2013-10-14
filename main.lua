--require "player"
require "maps"
require "menu"
require "entity"
require "hook"

function love.load( )
	hook.new( "OnGameThink" )
	hook.new( "OnMenuThink" )
	hook.new( "OnOptionsThink" )

	hook.new( "OnWorldDraw" )
	hook.new( "OnGameDraw" )
	hook.new( "OnMenuDraw")
	hook.new( "OnOptionsDraw" )

	hook.add( "OnWorldDraw", WorldDraw )

	ply = Player.create()
	--mrts = { }
	--MrTest.create()
	for I=1, 3 do
		MrTest.create()
		--mrts[#mrts+1] = MrTest.create()
	end
	--PlyLoad( )

	FontMed = love.graphics.newFont( 20 )
	ImgBG = love.graphics.newImage( "Images/BGI.png" )
	love.graphics.setBackgroundColor( 255, 255, 255 )

	GState = "MenuStart"
	CurWorldNum = 1
	WorldLoad( CurWorldNum )

	Menu.CreateButton( "Start", ScrWidth/2-100, ScrHeight/2, "Start", false )
	Menu.CreateButton( "Options", ScrWidth/2-40, ScrHeight/2, "Options", false )
	Menu.CreateButton( "Quit", ScrWidth/2+50, ScrHeight/2, "Quit", false )

	Menu.init()

end


function love.update( dt )
	Rate = dt
	MouseX = love.mouse.getX( )
	MouseY = love.mouse.getY( )
	if GState == "Playing" then
		hook.trigger( "OnGameThink", dt )
		--PlyUpdate( )
		--ply:think( dt )
		--for I=1, 3 do
			--mrts[I]:think(dt)
		--end
		-- PlyMovement( Rate )
		--BorderCollisions( )
	elseif GState == "MenuOptions" then
		hook.trigger( "OnOptionsThink" )
	elseif GState == "MenuStart" then
		hook.trigger( "OnMenuThink", dt )
		--BtnCheck( )
	end

end


function love.draw( )
	if GState == "Playing" then
		hook.trigger( "OnWorldDraw" )
		hook.trigger( "OnGameDraw" )
		-- PlyDraw( )
		--ply:draw()
		--for I=1, 3 do
			--mrts[I]:draw()
		--end
		love.graphics.print( ply.Pos.XVel, 300, 300 )
		love.graphics.print( ply.Pos.YVel, 300, 330 )
	elseif GState == "MenuOptions" then
		hook.trigger( "OnOptionsDraw" )
		-- TODO: Make a proper options menu ~
		--love.graphics.setColor( 255, 255, 255 )
		--love.graphics.draw( ImgBG, 0, 0 )
		--if Options.ShowFPS == true then
		--	love.graphics.print( tostring( love.timer.getFPS( ) ), 10, 10 )
		--end
	elseif GState == "MenuStart" then
		hook.trigger( "OnMenuDraw" )
		--[[love.graphics.setColor( 255, 255, 255 )
		love.graphics.draw( ImgBG, 0, 0 )
		Btn_Draw( )]]
	end


end


function love.mousepressed( x, y )
	if GState == "MenuStart" then
		BtnDoClick( x, y )
	end
end




