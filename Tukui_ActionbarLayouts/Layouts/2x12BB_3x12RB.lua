---------------------------------------------------------------------------------------------
-- Project: Tukui Actionbar Layouts Version 1.0
---------------------------------------------------------------------------------------------

local L, C = unpack( select( 2, ... ) )

if( C["options"]["enable"] ~= true or C["options"]["layout"] ~= 1 ) then return end

------------------------------
-- Debug
------------------------------
if( C["options"]["debug"] == true ) then
	print( "|cff00AAFFTukui Actionbar Layouts:|r" )
	print( "|cffFF6347Active Layout: 2x12 Bottom Bars + 3x12 Right Bars|r" )
end

if( IsAddOnLoaded( "Tukui" ) ) then

	local T, C, L, G = unpack( Tukui )

	------------------------------
	-- Not needed
	------------------------------
	G.ActionBars.Bar6:ClearAllPoints()
	G.ActionBars.Bar6:SetParent( TukuiUIHider )

	G.ActionBars.Bar7:ClearAllPoints()
	G.ActionBars.Bar7:SetParent( TukuiUIHider )

	------------------------------
	-- Actionbars
	------------------------------
	G.ActionBars.Bar1:ClearAllPoints()
	G.ActionBars.Bar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 14 )
	G.ActionBars.Bar1:SetWidth( ( T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) )
	G.ActionBars.Bar1:SetHeight( ( T.buttonsize * 1 ) + ( T.buttonspacing * 2 ) )

	G.ActionBars.Bar2:ClearAllPoints()
	G.ActionBars.Bar2:SetPoint( "BOTTOM", G.ActionBars.Bar1, "BOTTOM", 0, 0 )
	G.ActionBars.Bar2:SetWidth( ( T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) )
	G.ActionBars.Bar2:SetHeight( ( T.buttonsize * 2 ) + ( T.buttonspacing * 3 ) )

	G.ActionBars.Bar3:ClearAllPoints()
	G.ActionBars.Bar3:SetPoint( "RIGHT", UIParent, "RIGHT", -23, -14 )
	G.ActionBars.Bar3:SetWidth( ( T.buttonsize * 1 ) + ( T.buttonspacing * 2 ) )
	G.ActionBars.Bar3:SetHeight( ( T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) )
	G.ActionBars.Bar3:SetFrameStrata( "BACKGROUND" )
	G.ActionBars.Bar3:SetFrameLevel( 1 )

	G.ActionBars.Bar4:ClearAllPoints()
	G.ActionBars.Bar4:SetPoint( "RIGHT", G.ActionBars.Bar3, "RIGHT", 0, 0 )
	G.ActionBars.Bar4:SetWidth( ( T.buttonsize * 2 ) + ( T.buttonspacing * 3 ) )
	G.ActionBars.Bar4:SetHeight( ( T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) )
	G.ActionBars.Bar4:SetFrameStrata( "BACKGROUND" )
	G.ActionBars.Bar4:SetFrameLevel( 2 )

	G.ActionBars.Bar5:ClearAllPoints()
	G.ActionBars.Bar5:SetPoint( "RIGHT", G.ActionBars.Bar4, "RIGHT", 0, 0 )
	G.ActionBars.Bar5:SetWidth( ( T.buttonsize * 3 ) + ( T.buttonspacing * 4 ) )
	G.ActionBars.Bar5:SetHeight( ( T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) )
	G.ActionBars.Bar5:SetFrameStrata( "BACKGROUND" )
	G.ActionBars.Bar5:SetFrameLevel( 3 )
end