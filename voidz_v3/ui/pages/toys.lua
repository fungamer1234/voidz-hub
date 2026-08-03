return function(require)
	local C = require("ui.components")
	local Theme = require("ui.theme")
	local Notify = require("ui.notify")
	local Toys = require("systems.object.toys")
	local Anchor = require("systems.grab.anchor")

	return function(parent)
		local scroll = C.scroll(parent)

		local head = C.section(scroll, "TOYS")
		C.label(head, Toys.canSpawn() and "SpawnToy remote: OK" or "SpawnToy remote: missing (resolve FTAP)", {
			size = 12,
			color = Toys.canSpawn() and Theme.success or Theme.warn,
			h = 18,
		})

		C.button(head, "Re-resolve remotes", function()
			Toys.resolve()
			Notify.info("Toys", Toys.canSpawn() and "OK" or "Still missing")
		end, { w = 150 })

		local list = C.section(scroll, "SPAWN")
		for _, name in ipairs(Toys.COMMON) do
			C.button(list, name, function()
				task.spawn(function()
					local ok, model = Toys.spawnInFront(name)
					if ok and model then
						Notify.success("Toys", "Spawned " .. name)
						local pp = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart", true)
						if pp then
							Anchor.set(pp)
						end
					else
						Notify.warn("Toys", "Failed: " .. name)
					end
				end)
			end, { w = 220, h = 30 })
		end

		local util = C.section(scroll, "UTILITY")
		C.button(util, "Destroy nearest owned toy", function()
			if Toys.destroyNearest() then
				Notify.info("Toys", "Destroyed nearest")
			else
				Notify.warn("Toys", "None found")
			end
		end, { w = 200 })

		C.button(util, "Spawn Blobman (front)", function()
			task.spawn(function()
				local ok = Toys.spawnInFront("CreatureBlobman")
				Notify.info("Toys", ok and "Blobman spawned" or "Failed")
			end)
		end, { w = 180, accent = true })
	end
end
