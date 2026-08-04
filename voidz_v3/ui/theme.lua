--[[ VOIDZ HUB 2.0 - premium glass theme ]]
return function(_require)
	local function font(a, b)
		local ok, f = pcall(function()
			return Enum.Font[a]
		end)
		if ok and f then
			return f
		end
		ok, f = pcall(function()
			return Enum.Font[b]
		end)
		if ok and f then
			return f
		end
		return Enum.Font.SourceSans
	end

	return {
		-- deep void glass
		bg = Color3.fromRGB(8, 8, 12),
		bgGlass = Color3.fromRGB(14, 14, 20),
		bgElevated = Color3.fromRGB(18, 18, 28),
		panel = Color3.fromRGB(22, 22, 34),
		panelSoft = Color3.fromRGB(28, 28, 42),
		panelHover = Color3.fromRGB(36, 36, 54),
		sidebar = Color3.fromRGB(10, 10, 16),
		rail = Color3.fromRGB(12, 12, 18),
		stroke = Color3.fromRGB(70, 55, 120),
		strokeSoft = Color3.fromRGB(45, 40, 70),
		strokeGlow = Color3.fromRGB(160, 110, 255),
		text = Color3.fromRGB(248, 246, 255),
		textMuted = Color3.fromRGB(155, 150, 180),
		textDim = Color3.fromRGB(95, 92, 120),
		accent = Color3.fromRGB(148, 96, 255),
		accentSoft = Color3.fromRGB(95, 55, 190),
		accentGlow = Color3.fromRGB(200, 160, 255),
		accent2 = Color3.fromRGB(90, 200, 255),
		success = Color3.fromRGB(72, 220, 150),
		warn = Color3.fromRGB(255, 195, 80),
		danger = Color3.fromRGB(255, 85, 110),
		dangerSoft = Color3.fromRGB(90, 30, 45),
		info = Color3.fromRGB(110, 185, 255),
		toggleOn = Color3.fromRGB(130, 85, 255),
		toggleOff = Color3.fromRGB(42, 42, 58),
		button = Color3.fromRGB(32, 32, 48),
		buttonHover = Color3.fromRGB(48, 48, 72),
		chip = Color3.fromRGB(26, 26, 40),
		chipOn = Color3.fromRGB(70, 40, 140),
		navOn = Color3.fromRGB(50, 30, 100),
		navOff = Color3.fromRGB(14, 14, 22),
		shadow = Color3.fromRGB(0, 0, 0),
		radius = UDim.new(0, 12),
		radiusSm = UDim.new(0, 8),
		radiusLg = UDim.new(0, 16),
		font = font("GothamMedium", "SourceSans"),
		fontBold = font("GothamBold", "SourceSansBold"),
		fontMono = font("RobotoMono", "Code"),
		sidebarW = 148,
		playerW = 196,
		titleH = 48,
		pad = 12,
	}
end
