---------------------------------------------------------------------------------------------
-- Project: Tukui Actionbar Layouts Version 1.0
---------------------------------------------------------------------------------------------

local L, C = unpack( select( 2, ... ) )

local ResetActionbars = function()
	TABLData = {}
	TABLDataPerChar = {}
	ReloadUI()
end

local OnLogon = CreateFrame( "Frame" )
OnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
OnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	if( TABLData == nil ) then TABLData = {} end
	if( TABLDataPerChar == nil ) then TABLDataPerChar = {} end
end )

SLASH_RESETABL1 = "/resetabl"
SlashCmdList.RESETABL = function() ResetActionbars() end