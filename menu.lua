

Btn = { }
Options = { ShowFPS = false }

function BtnCreate( ID, X, Y, Text )
	local Insertion = { ID = ID, X = X, Y = Y, Text = Text, MouseOver = false }
	table.insert( Btn, Insertion )

end


function Btn_Draw(  )
	for k, v in ipairs( Btn ) do
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
	for k, v in ipairs( Btn ) do
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


function BtnCheck( )
	for k, v in ipairs( Btn ) do
		if MouseX > v.X and MouseX < v.X + FontMed:getWidth( v.Text ) and MouseY > v.Y and MouseY < v.Y + FontMed:getHeight( v.Text ) then
			v.MouseOver = true
		else
			v.MouseOver = false
		end
	end
end












