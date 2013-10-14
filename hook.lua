hook = { }
hook.hooks = { }
hook.revoffset = { }
hook.offset = { }
hook.offsetnum = 0
hook.block_width = 1000000 -- Effectively how many callbacks a hook can ever have.

function hook.add( alias, callback, self )
	if not hook.isHook( alias ) then
		hook.new( alias )
	end
	local NewID = hook.offset[alias]
	hook.offset[alias] = NewID + 1
	hook.hooks[alias][NewID] = { _callback=callback, _self=self }
	return NewID
end

function hook.isHook( alias )
	return hook.hooks[alias] ~= nil
end

function hook.new( alias )
	hook.hooks[alias] = { }
	hook.offsetnum = hook.offsetnum + 1
	hook.offset[alias] = hook.offsetnum * hook.block_width
	hook.revoffset[ hook.offset[alias] ] = alias
end

function hook.removeCallback( id )
	local alrev = math.floor( id / hook.block_width ) * hook.block_width
	local alias = hook.revoffset[ alrev ]
	local finalid = id % hook.block_width
	hook.hooks[alias][id] = nil
	hook.offset[alias] = nil
	hook.revoffset[ alrev ] = nil
end

function hook.removeHook( alias )
	hook.hooks[alias] = nil
end

function hook.trigger( alias, ... )
	local curHook = hook.hooks[alias]
	for k, v in pairs(curHook) do
		if v._self then
			v._callback( v._self, ... )
		else
			v._callback( ... )
		end
	end
end

