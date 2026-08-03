--[[ VOIDZ V3 — named cancellable loops ]]
return function(require)
	local State = require("core.state")

	local Loop = {}

	function Loop.stop(id)
		State.loops[id] = false
		State.loopGen[id] = (State.loopGen[id] or 0) + 1
	end

	function Loop.start(id, waitTime, fn)
		local gen = (State.loopGen[id] or 0) + 1
		State.loopGen[id] = gen
		State.loops[id] = true
		local waitSec = math.max(tonumber(waitTime) or 0.1, 0.03)
		task.spawn(function()
			while State.loops[id] and State.loopGen[id] == gen do
				local t0 = os.clock()
				pcall(fn)
				local spent = os.clock() - t0
				task.wait(math.max(waitSec - spent, 0.03))
			end
		end)
	end

	function Loop.stopAll()
		for id in pairs(State.loops) do
			Loop.stop(id)
		end
	end

	return Loop
end
