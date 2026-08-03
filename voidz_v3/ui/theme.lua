--[[ VOIDZ HUB V3 - Premium dark theme tokens ]]
return function(_require)
	local function font(primary, fallback)
		local ok, f = pcall(function()
			return Enum.Font[primary]
		end)
		if ok and f then
			return f
		end
		ok, f = pcall(function()
			return Enum.Font[fallback]
		end)
		if ok and f then
			return f
		end
		return Enum.Font.SourceSans
	end

	return {
		bg = Color3.fromRGB(10, 10, 14),
		bgElevated = Color3.fromRGB(16, 16, 22),
		panel = Color3.fromRGB(18, 18, 26),
		panelSoft = Color3.fromRGB(22, 22, 32),
		sidebar = Color3.fromRGB(12, 12, 18),
		stroke = Color3.fromRGB(48, 48, 68),
		strokeSoft = Color3.fromRGB(36, 36, 52),
		text = Color3.fromRGB(245, 245, 250),
		textMuted = Color3.fromRGB(150, 150, 170),
		textDim = Color3.fromRGB(100, 100, 120),
		accent = Color3.fromRGB(140, 90, 255),
		accentSoft = Color3.fromRGB(100, 60, 200),
		accentGlow = Color3.fromRGB(180, 140, 255),
		success = Color3.fromRGB(80, 220, 140),
		warn = Color3.fromRGB(255, 190, 70),
		danger = Color3.fromRGB(255, 90, 110),
		info = Color3.fromRGB(100, 180, 255),
		toggleOn = Color3.fromRGB(120, 80, 255),
		toggleOff = Color3.fromRGB(40, 40, 55),
		button = Color3.fromRGB(28, 28, 40),
		buttonHover = Color3.fromRGB(40, 40, 58),
		radius = UDim.new(0, 10),
		radiusSm = UDim.new(0, 6),
		font = font("GothamMedium", "SourceSans"),
		fontBold = font("GothamBold", "SourceSansBold"),
		fontMono = font("RobotoMono", "Code"),
		sidebarW = 168,
		titleH = 44,
		pad = 12,
	}
end
