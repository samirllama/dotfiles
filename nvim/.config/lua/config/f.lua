-- Simple utility functions for function wrapping
return {
	-- Function wrapper for simpler callback definitions
	fn = function(func, opts)
		return function()
			func(opts)
		end
	end,
}
