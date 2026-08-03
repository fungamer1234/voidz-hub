--[[
  Chat - single TextChat path. Classic public load once per JobId.
  No hangul fillers. No dual legacy system inject.
]]
return function(require)
	local Services = require("core.services")

	local Chat = {
		_loadAnnounced = {},
	}

	function Chat.sendPublic(text)

		if type(text) ~= "string" or text == "" then
			return false
		end
		-- Modern TextChat only (one path)
		local ok = pcall(function()
			local tcs = Services.TextChatService
			if not tcs then
				return
			end
			local channel = tcs.TextChannels and (tcs.TextChannels:FindFirstChild("RBXGeneral") or tcs.TextChannels:FindFirstChildWhichIsA("TextChannel"))
			if channel and channel.SendAsync then
				channel:SendAsync(text)
				return
			end
			-- fallback: wait briefly for channel
			local ch = tcs:FindFirstChild("TextChannels")
			if ch then
				local gen = ch:FindFirstChild("RBXGeneral") or ch:FindFirstChildWhichIsA("TextChannel")
				if gen and gen.SendAsync then
					gen:SendAsync(text)
				end
			end
		end)
		if ok then
			return true
		end
		-- Legacy chat only if TextChat path unavailable
		return pcall(function()
			local rs = game:GetService("ReplicatedStorage")
			local de = rs:FindFirstChild("DefaultChatSystemChatEvents")
			local say = de and de:FindFirstChild("SayMessageRequest")
			if say then
				say:FireServer(text, "All")
			end
		end)
	end

	function Chat.announceLoadOnce()
		local job = tostring(game.JobId or "solo")
		if Chat._loadAnnounced[job] then
			return false
		end
		local g = (getgenv and getgenv()) or _G
		g.VOIDZ_V3_LOAD_CHAT = g.VOIDZ_V3_LOAD_CHAT or {}
		if g.VOIDZ_V3_LOAD_CHAT[job] then
			Chat._loadAnnounced[job] = true
			return false
		end
		g.VOIDZ_V3_LOAD_CHAT[job] = true
		Chat._loadAnnounced[job] = true
		-- classic public line (emoji may strip in some filters; core words preserved)
		local msg = "\xF0\x9F\x92\x80 VoIdZ HuB LoAdEd \xF0\x9F\x92\x80"
		task.defer(function()
			task.wait(0.6)
			Chat.sendPublic(msg)
		end)
		return true
	end

	return Chat
end
