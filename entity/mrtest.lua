require "entity/entity"

MrTest = { }
MrTest.mt = { __index = MrTest }
setmetatable( MrTest, { __index = Entity } )

MrTest.Images = {}
MrTest.Images.AnimateError = love.graphics.newImage( "Images/Error1.png" )
MrTest.Images.AnimateUp = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Up.png" )
MrTest.Images.AnimateDown = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Down.png" )
MrTest.Images.AnimateLeft = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Left.png" )
MrTest.Images.AnimateRight = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Right.png" )

function MrTest.create( )
	local newMrTest = { }
	setmetatable( newMrTest, MrTest.mt )
	newMrTest:init( )
	return newMrTest
end

function MrTest:init( )
	Entity.init( self )

	self.Speed = 25
	self.Pos.X = math.random(1, 800)
	self.Pos.Y = math.random(1, 800)
	self.Pos.XVel = 0.0
	self.Pos.YVel = 0.0

	self.Images = MrTest.Images
	self.AnimateActive = self.Images.AnimateDown
end

function MrTest:think( dt )
	self:AccelerateApply()

	local dist = Entity.GetDistance( self, ply )
	if dist > 100 then
		local Running = dist > 200
		if ply.Pos.X < self.Pos.X then
			self:AccelerateLeft(Running, dt)
		else
			self:AccelerateRight(Running, dt)
		end

		if ply.Pos.Y < self.Pos.Y then
			self:AccelerateUp(Running, dt)
		else
			self:AccelerateDown(Running, dt)
		end
	end

	--[[if direct == 1 then
		self:AccelerateDown(true, dt)
	elseif direct == 2 then
		self:AccelerateUp(true, dt)
	elseif direct == 3 then
		self:AccelerateLeft(true, dt)
	else
		self:AccelerateRight(true, dt)
	end]]
end
