--[[ VOIDZ V3 - default feature flags / values (2.0.0) ]]
return function(_require)
	return {
		toggles = {
			gucci = false,
			antiGrab = false,
			antiGrabSafeTP = false,
			warMode = false,
			warUseStopVel = false,
			blobGrabLoop = false,
			blobGrabAllLoop = false,
			blobStickySeat = false,
			grabLoop = false,
			kickLoop = false,
			anchorWatch = false,
			anchorAutoReplace = false,
			anchorKeepAnchored = true,
			uiAnimations = true,
			publicLoadChat = true,
			noclip = false,
			fly = false,
		},
		values = {
			flingPower = 12000,
			trainSpeed = 140,
			kickType = "Phoenix",
			flySpeed = 60,
		},
	}
end
