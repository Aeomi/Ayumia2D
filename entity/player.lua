require "entity/entity"

Player = {}
Player.mt = { __index = Player }
setmetatable( Player, { __index = Entity } )

Player.Images = {}
Player.Images.AnimateError = love.graphics.newImage( "Images/Error1.png" )
Player.Images.AnimateUp = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Up.png" )
Player.Images.AnimateDown = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Down.png" )
Player.Images.AnimateLeft = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Left.png" )
Player.Images.AnimateRight = love.graphics.newImage( "Images/Chars/Player/Male/Default/AvImg_Right.png" )

function Player.create( )
	local newPly = { }
	setmetatable( newPly, Player.mt )
	newPly:init()
	return newPly
end

function Player:init( )
	Entity.init( self )

	-- Stats
	self.Speed = 25
	self.Pos.X = 0.0
	self.Pos.Y = 0.0
	self.Pos.XVel = 0.0
	self.Pos.YVel = 0.0

	self.AnimateActive = self.Images.AnimateDown
end

function Player:think( dt )
	Running = love.keyboard.isDown( "lshift" )

	self:AccelerateApply( Running )

	if love.keyboard.isDown( "w" ) then
		self:AccelerateUp(Running, dt) -- BaseEntity:AccelerateLeft
	end

	if love.keyboard.isDown( "s" ) then
		self:AccelerateDown(Running, dt) -- BaseEntity:AccelerateDown
	end

	if love.keyboard.isDown( "a" ) then
		self:AccelerateLeft(Running, dt)
	end

	if love.keyboard.isDown( "d" ) then
		self:AccelerateRight(Running, dt)
	end
end
