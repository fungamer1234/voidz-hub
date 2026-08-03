--[[ VOIDZ V3 — Roblox services + FTAP remote resolve ]]
return function(require)
	local Services = {}

	Services.Players = game:GetService("Players")
	Services.RunService = game:GetService("RunService")
	Services.UserInputService = game:GetService("UserInputService")
	Services.TweenService = game:GetService("TweenService")
	Services.ReplicatedStorage = game:GetService("ReplicatedStorage")
	Services.StarterGui = game:GetService("StarterGui")
	Services.CoreGui = game:GetService("CoreGui")
	Services.Lighting = game:GetService("Lighting")
	Services.HttpService = game:GetService("HttpService")
	Services.TextChatService = game:GetService("TextChatService")
	Services.Debris = game:GetService("Debris")

	Services.LP = Services.Players.LocalPlayer
	while not Services.LP do
		task.wait()
		Services.LP = Services.Players.LocalPlayer
	end

	Services.FTAP = {
		ok = false,
		CreateGrabLine = nil,
		DestroyGrabLine = nil,
		SetNetworkOwner = nil,
		Struggle = nil,
		StopAllVelocity = nil,
		SpawnToy = nil,
		BuyToy = nil,
		RagdollRemote = nil,
	}

	function Services.resolveFTAP()
		local FTAP = Services.FTAP
		FTAP.ok = false
		pcall(function()
			local rs = Services.ReplicatedStorage
			local ge = rs:FindFirstChild("GrabEvents") or rs:FindFirstChild("GrabEvents", true)
			if ge then
				FTAP.CreateGrabLine = ge:FindFirstChild("CreateGrabLine")
				FTAP.DestroyGrabLine = ge:FindFirstChild("DestroyGrabLine")
				FTAP.SetNetworkOwner = ge:FindFirstChild("SetNetworkOwner")
			end
			local ce = rs:FindFirstChild("CharacterEvents")
			if ce then
				FTAP.Struggle = ce:FindFirstChild("Struggle")
				FTAP.RagdollRemote = ce:FindFirstChild("RagdollRemote")
			end
			local mt = rs:FindFirstChild("MenuToys")
			if mt then
				FTAP.SpawnToy = mt:FindFirstChild("SpawnToyRemoteFunction") or mt:FindFirstChild("SpawnToy")
				FTAP.BuyToy = mt:FindFirstChild("BuyToyRemoteFunction") or mt:FindFirstChild("BuyToy")
			end
			local gce = rs:FindFirstChild("GameCorrectionEvents")
			if gce then
				FTAP.StopAllVelocity = gce:FindFirstChild("StopAllVelocity")
			end
			FTAP.ok = FTAP.SetNetworkOwner ~= nil or FTAP.SpawnToy ~= nil or FTAP.CreateGrabLine ~= nil
		end)
		return FTAP.ok
	end

	return Services
end
