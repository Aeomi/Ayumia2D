Entity = {}
Entity.__index = Entity
Entity.Pos = { X=nil, Y=nil, XVel=nil, YVel=nil }

function Entity.create()
	assert( false )
end

function Entity:init()
	self.Pos = { X=nil, Y=nil, XVel=nil, YVel=nil }
	self.Speed = 0
	self.Friction = 5
end

function Entity:draw()
	assert( self.AnimateActive )
	love.graphics.draw( self.AnimateActive, self.Pos.X, self.Pos.Y )
end

function Entity.AccelerateGetRate( Delta )
	return Delta * 10
end

-- Annoyingly repetitive, probably should change this~

function Entity:AccerateApply( Running )
	self.Pos.X = self.Pos.X + self.Pos.XVel
	self.Pos.Y = self.Pos.Y + self.Pos.YVel
	
	self.Pos.XVel = self.Pos.XVel * ( 1 - math.min( Rate * self.Friction, 1 ) )
	self.Pos.YVel = self.Pos.YVel * ( 1 - math.min( Rate * self.Friction, 1 ) )
	
	if not Running and self.Pos.XVel > 2 then
		self.Pos.XVel = 2
	end
	
	if not Running and self.Pos.XVel < -2 then
		self.Pos.XVel = -2
	end
	
	if not Running and self.Pos.YVel > 2 then
		self.Pos.YVel = 2
	end
	
	if not Running and self.Pos.YVel < -2 then
		self.Pos.YVel = -2
	end
	
	if self.Pos.X < 0 then
		self.Pos.X = 0
	elseif self.Pos.X > ( ScrWidth - self.AnimateActive:getWidth( ) ) then
		self.Pos.X = ( ScrWidth - self.AnimateActive:getWidth( ) )
	end
	
	if self.Pos.Y < 0 then
		self.Pos.Y = 0
	elseif self.Pos.Y > ( ScrHeight - self.AnimateActive:getHeight( ) ) then
		self.Pos.Y = ( ScrHeight - self.AnimateActive:getHeight( ) )
	end
end

function Entity:AccelerateUp( Run, Delta )
	local Rate = Entity.AccelerateGetRate( Delta )
	local MaxSpeed = 2
	if Run then MaxSpeed = 4 end
	self.AnimateActive = self.AnimateUp
	
	if self.Pos.YVel > -MaxSpeed then 
		local Sprint = 0.0
		if self.Run then Sprint = self.Speed / 1.5 end
		self.Pos.YVel = self.Pos.YVel - ( self.Speed + Sprint ) * Rate 
	end
end

function Entity:AccelerateDown( Run, Delta )
	local Rate = Entity.AccelerateGetRate( Delta )
	local MaxSpeed = 2
	if Run then MaxSpeed = 4 end
	self.AnimateActive = self.AnimateDown
	
	if self.Pos.YVel < MaxSpeed then
		local Sprint = 0.0
		if self.Run then Sprint = self.Speed / 1.5 end
		self.Pos.YVel = self.Pos.YVel + ( self.Speed + Sprint ) * Rate
	end
end

function Entity:AccelerateLeft( Run, Delta )
	local Rate = Entity.AccelerateGetRate( Delta )
	local MaxSpeed = 2
	if Run then MaxSpeed = 4 end
	self.AnimateActive = self.AnimateLeft
	
	if self.Pos.XVel > -MaxSpeed then 
		local Sprint = 0.0
		if self.Run then Sprint = self.Speed / 1.5 end
		self.Pos.XVel = self.Pos.XVel - ( self.Speed + Sprint ) * Rate
	end
end

function Entity:AccelerateRight( Run, Delta )
	local Rate = Entity.AccelerateGetRate( Delta )
	local MaxSpeed = 2
	if Run then MaxSpeed = 4 end
	self.AnimateActive = self.AnimateRight
	
	if self.Pos.XVel < MaxSpeed then 
		local Sprint = 0.0
		if self.Run then Sprint = self.Speed / 1.5 end
		self.Pos.XVel = self.Pos.XVel + ( self.Speed + Sprint ) * Rate
	end
end