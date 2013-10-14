

local Worlds = { 
	"Images/Worlds/Aeos/Aeos_Area2.png";
}



function WorldLoad( WorldToLoad )

	CurWorld = love.graphics.newImage( Worlds[ WorldToLoad ] )

end


function WorldDraw( )
	love.graphics.draw( CurWorld, 0, 0 )
end


--[[function BorderCollisions( )

	if Ply.X < 0 then
		Ply.X = 0
	end
	
	if Ply.X + Ply.AvImg:getWidth( ) > ScrWidth then
		Ply.X = ScrWidth - Ply.AvImg:getWidth( )
	end
	
	if Ply.Y < 0 then
		Ply.Y = 0
	end
	
	if Ply.Y + Ply.AvImg:getHeight( ) > ScrHeight then
		Ply.Y = ScrHeight - Ply.AvImg:getHeight( )
	end

	
end]]

