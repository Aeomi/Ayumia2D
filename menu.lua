Menu = {}

function Menu.init( )
	hook.add( "OnMenuDraw", function( )
			love.graphics.setColor( 255, 255, 255 )
			love.graphics.draw( ImgBG, 0, 0 )
		end)
	hook.add( "OnMenuDraw", Menu.DrawButtons )
	hook.add( "OnMenuThink", Menu.CheckButtons )
end


Menu.Buttons = { }
Menu.Options = { ShowFPS = false }

function Menu.CreateButton( ID, X, Y, Text )
	local Insertion = { ID = ID, X = X, Y = Y, Text = Text, MouseOver = false }
	table.insert( Menu.Buttons, Insertion )

end


function Menu.DrawButtons(  )
	for k, v in ipairs( Menu.Buttons ) do
		if v.MouseOver then
			love.graphics.setColor( 75, 75, 200 )
		else
			love.graphics.setColor( 255, 255, 255 )
		end
		love.graphics.setFont( FontMed )
		love.graphics.print( v.Text, v.X, v.Y )
	end
end


function BtnDoClick( X, Y )
	for k, v in ipairs( Menu.Buttons ) do
		if X > v.X and X < v.X + FontMed:getWidth( v.Text ) and Y > v.Y and Y < v.Y + FontMed:getHeight( v.Text ) then
			if v.ID == "Quit" then
				love.event.push( "quit" )
			elseif v.ID == "Start" then
				GState = "Playing"
			elseif v.ID == "Options" then
				GState = "MenuOptions"
			end
		end
	end

end

function Menu.CheckButtons( )
	for k, v in ipairs( Menu.Buttons ) do
		if MouseX > v.X and MouseX < v.X + FontMed:getWidth( v.Text ) and MouseY > v.Y and MouseY < v.Y + FontMed:getHeight( v.Text ) then
			v.MouseOver = true
		else
			v.MouseOver = false
		end
	end
end












