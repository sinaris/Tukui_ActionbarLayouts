---------------------------------------------------------------------------------------------
-- Project: Tukui Actionbar Layouts Version 1.0
---------------------------------------------------------------------------------------------

local L, C = unpack( select( 2, ... ) )

if( C["options"]["enable"] ~= true or C["options"]["layout"] ~= 1 ) then return end

if( IsAddOnLoaded( "Tukui" ) ) then

	local T, C, L, G = unpack( Tukui )

	if( C["actionbar"]["enable"] ~= true ) then return end

	------------------------------
	-- Actionbar 2
	------------------------------
	do
		local bar = G.ActionBars.Bar2
		MultiBarBottomLeft:SetParent( bar )

		for i = 1, 12 do
			local b = _G["MultiBarBottomLeftButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" .. i - 1]

			b:SetSize( T.buttonsize, T.buttonsize )
			b:ClearAllPoints()
			b:SetFrameStrata( "BACKGROUND" )
			b:SetFrameLevel( 15 )

			if( i == 1 ) then
				b:SetPoint( "TOPLEFT", bar,"TOPLEFT", T.buttonspacing, -T.buttonspacing )
			else
				b:SetPoint( "LEFT", b2, "RIGHT", T.buttonspacing, 0 )
			end
		end
	end

	------------------------------
	-- Actionbar 3
	------------------------------
	do
		local bar = G.ActionBars.Bar3
		MultiBarBottomRight:SetParent( bar )

		for i = 1, 12 do
			local b = _G["MultiBarBottomRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i - 1]

			b:SetSize( T.buttonsize, T.buttonsize )
			b:ClearAllPoints()
			b:SetFrameStrata( "BACKGROUND" )
			b:SetFrameLevel( 15 )

			if( i == 1 ) then
				b:SetPoint( "TOPLEFT", bar,"TOPLEFT", T.buttonspacing, -T.buttonspacing )
			else
				b:SetPoint( "TOP", b2, "BOTTOM", 0, -T.buttonspacing )
			end
		end
	end

	------------------------------
	-- Actionbar 4
	------------------------------
	do
		local bar = G.ActionBars.Bar4
		bar:SetAlpha( 1 )
		MultiBarRight:SetParent( bar )

		for i = 1, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarRightButton" .. i - 1]

			b:SetSize( T.buttonsize, T.buttonsize )
			b:ClearAllPoints()
			b:SetFrameStrata( "BACKGROUND" )
			b:SetFrameLevel( 15 )

			if( i == 1 ) then
				b:SetPoint( "TOPLEFT", bar, "TOPLEFT", T.buttonspacing, -T.buttonspacing )
			else
				b:SetPoint( "TOP", b2, "BOTTOM", 0, -T.buttonspacing )
			end
		end
	end

	------------------------------
	-- Actionbar 5
	------------------------------
	do
		local bar = G.ActionBars.Bar5
		bar:SetAlpha( 1 )
		MultiBarLeft:SetParent( bar )

		for i = 1, 12 do
			local b = _G["MultiBarLeftButton" .. i]
			local b2 = _G["MultiBarLeftButton" .. i - 1]

			b:SetSize( T.buttonsize, T.buttonsize )
			b:ClearAllPoints()
			b:SetFrameStrata( "BACKGROUND" )
			b:SetFrameLevel( 15 )

			if( i == 1 ) then
				b:SetPoint( "TOPLEFT", bar, "TOPLEFT", T.buttonspacing, -T.buttonspacing )
			else
				b:SetPoint( "TOP", b2, "BOTTOM", 0, -T.buttonspacing )
			end
		end
	end
end