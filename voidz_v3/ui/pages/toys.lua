return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local Notify = require("ui.notify")
	local Toys = require("systems.object.toys")
	local Anchor = require("systems.grab.anchor")

	return function(parent)
		local scroll = C.scroll(parent)
		local head = C.section(scroll, "TOYS")
		C.label(head, Toys.canSpawn() and "SpawnToy remote OK" or "SpawnToy missing - rejoin FTAP", {
			size = 12,
			color = Toys.canSpawn() and Theme.success or Theme.warn,
			h = 18,
		})
		C.button(head, "Re-resolve remotes", function()
			Toys.resolve()
			Notify.info("Toys", Toys.canSpawn() and "OK" or "Missing")
		end, { w = 150, h = 32 })

		local list = C.section(scroll, "SPAWN")
		local g = C.grid(list, 150, 32, 8)
		for _, name in ipairs(Toys.COMMON) do
			C.button(g, name, function()
				task.spawn(function()
					local ok, model = Toys.spawnInFront(name)
					if ok and model then
						Notify.success("Toys", name)
						local pp = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
						if pp then
							Anchor.set(pp)
						end
					else
						Notify.warn("Toys", "Failed " .. name)
					end
				end)
			end, { w = 150, h = 32 })
		end

		local util = C.section(scroll, "UTILITY")
		C.button(util, "Destroy nearest owned toy", function()
			Notify.info("Toys", Toys.destroyNearest() and "Destroyed" or "None")
		end, { w = 200, h = 34, danger = true })
	end
end
