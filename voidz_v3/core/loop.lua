--[[ VOIDZ V3 - named cancellable loops (perf: min wait, no double-start stack) ]]
return function(require)
	local State = require("core.state")

	local Loop = {
		_active = {}, -- id -> true while spawn running
	}

	function Loop.stop(id)
		State.loops[id] = false
		State.loopGen[id] = (State.loopGen[id] or 0) + 1
		Loop._active[id] = nil
	end

	function Loop.start(id, waitTime, fn)
		-- cancel previous generation first (prevents stacked ticks)
		local gen = (State.loopGen[id] or 0) + 1
		State.loopGen[id] = gen
		State.loops[id] = true
		Loop._active[id] = true
		local waitSec = math.max(tonumber(waitTime) or 0.1, 0.05)
		task.spawn(function()
			while State.loops[id] and State.loopGen[id] == gen do
				local t0 = os.clock()
				local ok, err = pcall(fn)
				if not ok then
					local Errors = require("core.errors")
					Errors.report("loop:" .. tostring(id), err)
				end
				local spent = os.clock() - t0
				-- if tick was expensive, still yield at least 1 frame-ish
				local rest = waitSec - spent
				if rest < 0.03 then
					rest = 0.03
				end
				task.wait(rest)
			end
			if State.loopGen[id] == gen then
				Loop._active[id] = nil
			end
		end)
	end

	function Loop.isRunning(id)
		return State.loops[id] == true and Loop._active[id] == true
	end

	function Loop.list()
		local out = {}
		for id, on in pairs(State.loops) do
			if on then
				out[#out + 1] = id
			end
		end
		table.sort(out)
		return out
	end

	function Loop.stopAll()
		for id in pairs(State.loops) do
			Loop.stop(id)
		end
		for id in pairs(Loop._active) do
			Loop.stop(id)
		end
	end

	return Loop
end
