--[[ VOIDZ V3 — default feature flags / values for Phase 1+ ]]
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
		},


		values = {
			flingPower = 12000,
			trainSpeed = 140,
			kickType = "Phoenix",
		},

	}
end
