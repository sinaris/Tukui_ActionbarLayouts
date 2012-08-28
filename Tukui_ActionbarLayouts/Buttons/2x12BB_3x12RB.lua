---------------------------------------------------------------------------------------------
-- Project: Tukui Actionbar Layouts Version 1.0
---------------------------------------------------------------------------------------------

local L, C = unpack( select( 2, ... ) )

if( C["options"]["enable"] ~= true or C["options"]["layout"] ~= 1 ) then return end

if( not IsAddOnLoaded( "Tukui" ) ) then return end

local T, C, L, G = unpack( Tukui )

if( C["actionbar"]["enable"] ~= true ) then return end

G.ActionBars.Bar2.ShowHideButton:Kill()
G.ActionBars.Bar3.ShowHideButton:Kill()
G.ActionBars.Bar4.ShowHideButton:Kill()
G.ActionBars.Bar5.ShowHideButtonTop:Kill()
G.ActionBars.Bar5.ShowHideButtonBottom:Kill()

G.ActionBars.ExitVehicleLeft:ClearAllPoints()
G.ActionBars.ExitVehicleLeft:SetParent( TukuiUIHider )

G.ActionBars.ExitVehicleRight:ClearAllPoints()
G.ActionBars.ExitVehicleRight:SetParent( TukuiUIHider )

local width1 = ( T.buttonsize * 1 ) + ( T.buttonspacing * 2 )
local width2 = ( T.buttonsize * 2 ) + ( T.buttonspacing * 3 )
local width3 = ( T.buttonsize * 3 ) + ( T.buttonspacing * 4 )

local function ShowOrHideBar( bar, button )
	local db = TABLDataPerChar

	if( bar:IsShown() ) then
		UnregisterStateDriver( bar, "visibility" )
		bar:Hide()

	else
		RegisterStateDriver( bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show" )
		bar:Show()
	end
end

local function MoveButtonBar( button, bar )
	local db = TABLDataPerChar

	if( button == Bar2Button ) then
		if( bar:IsShown() ) then
			db.hidebar2 = false
			button.text:SetText( "|cff4BAF4C- - - - - -|r" )
		else
			db.hidebar2 = true
			button.text:SetText( "|cff4BAF4C+ + + + + +|r" )
		end
	end

	if( button == Bar3Button ) then
		if( bar:IsShown() ) then
			db.hidebar3 = false
			button:ClearAllPoints()
			button:Point( "LEFT", TukuiBar3, "RIGHT", T.buttonspacing, 0 )
			button.text:SetText( "|cff4BAF4C>|r" )
			if( TukuiBar4:IsShown() ) then
				if( TukuiBar5:IsShown() ) then
					TukuiPetBar:Point( "RIGHT", TukuiBar5, "LEFT", -6, 0 )
				else
					TukuiPetBar:Point( "RIGHT", TukuiBar4, "LEFT", -6, 0 )
				end
			else
				TukuiPetBar:Point( "RIGHT", TukuiBar3, "LEFT", -6, 0 )
			end
		else
			db.hidebar3 = true
			button:ClearAllPoints()
			button:Point( "RIGHT", UIParent, "RIGHT", -2, -14 )
			button.text:SetText( "|cff4BAF4C<|r" )
			TukuiPetBar:Point( "RIGHT", UIParent, "RIGHT", -23, -14 )
		end
	end

	if( button == Bar4ButtonTop or button == Bar4ButtonBottom ) then
		local buttontop = Bar4ButtonTop
		local buttonbot = Bar4ButtonBottom
		if( bar:IsShown() ) then
			db.hidebar4 = false
			buttontop.text:SetText( "|cff4BAF4C>|r" )
			buttonbot.text:SetText( "|cff4BAF4C>|r" )

			TukuiPetBar:ClearAllPoints()
			if( TukuiBar5:IsShown() ) then
				TukuiPetBar:Point( "RIGHT", TukuiBar5, "LEFT", -6, 0 )
			else
				TukuiPetBar:Point( "RIGHT", bar, "LEFT", -6, 0 )
			end
		else
			db.hidebar4 = true
			buttontop.text:SetText( "|cff4BAF4C<|r" )
			buttonbot.text:SetText( "|cff4BAF4C<|r" )

			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:Point( "RIGHT", TukuiBar3, "LEFT", -6, 0 )
		end
	end

	if( button == Bar5ButtonTop or button == Bar5ButtonBottom ) then
		local buttontop = Bar5ButtonTop
		local buttonbot = Bar5ButtonBottom
		if( bar:IsShown() ) then
			db.hidebar5 = false
			buttontop.text:SetText( "|cff4BAF4C>|r" )
			buttonbot.text:SetText( "|cff4BAF4C>|r" )

			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:Point( "RIGHT", bar, "LEFT", -6, 0 )
		else
			db.hidebar5 = true
			buttonbot.text:SetText( "|cff4BAF4C<|r" )
			buttontop.text:SetText( "|cff4BAF4C<|r" )

			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:Point( "RIGHT", TukuiBar4, "LEFT", -6, 0 )
		end	
	end
end

local function UpdateBar( self, bar )
	if( InCombatLockdown() ) then
		print( ERR_NOT_IN_COMBAT )
		return
	end

	local button = self

	ShowOrHideBar( bar, button )
	MoveButtonBar( button, bar )
end

local Bar2Button = CreateFrame( "Button", "Bar2Button", UIParent )
Bar2Button:SetWidth( TukuiBar1:GetWidth() )
Bar2Button:Height( 10 )
Bar2Button:Point( "TOP", TukuiBar1, "BOTTOM", 0, -2 )
Bar2Button:SetTemplate( "Default" )
Bar2Button:RegisterForClicks( "AnyUp" )
Bar2Button:SetAlpha( 0 )
Bar2Button:SetScript( "OnClick", function( self ) UpdateBar( self, TukuiBar2 ) end )
Bar2Button:SetScript( "OnEnter", function( self ) self:SetAlpha( 1 ) end )
Bar2Button:SetScript( "OnLeave", function( self ) self:SetAlpha( 0 ) end )
Bar2Button.text = T.SetFontString( Bar2Button, C["media"]["uffont"], 24 )
Bar2Button.text:SetPoint( "CENTER", 0, 0 )
Bar2Button.text:SetText( "|cff4BAF4C- - - - - -|r" )

local Bar3Button = CreateFrame( "Button", "Bar3Button", UIParent )
Bar3Button:Width( 17 )
Bar3Button:SetHeight( TukuiBar3:GetHeight() )
Bar3Button:Point( "LEFT", TukuiBar3, "RIGHT", T.buttonspacing, 0 )
Bar3Button:SetTemplate( "Default" )
Bar3Button:RegisterForClicks( "AnyUp" )
Bar3Button:SetAlpha( 0 )
Bar3Button:SetScript( "OnClick", function( self ) UpdateBar( self, TukuiBar3 ) end )
Bar3Button:SetScript( "OnEnter", function( self ) self:SetAlpha( 1 ) end )
Bar3Button:SetScript( "OnLeave", function( self ) self:SetAlpha( 0 ) end )
Bar3Button.text = T.SetFontString( Bar3Button, C["media"]["uffont"], 24 )
Bar3Button.text:Point( "CENTER", 1, 1 )
Bar3Button.text:SetText( "|cff4BAF4C>|r" )

local Bar4ButtonTop = CreateFrame( "Button", "Bar4ButtonTop", TukuiBar3 )
Bar4ButtonTop:SetWidth( width1 )
Bar4ButtonTop:Height( 17 )
Bar4ButtonTop:Point( "BOTTOM", TukuiBar3, "TOP", 0, T.buttonspacing )
Bar4ButtonTop:SetTemplate( "Default" )
Bar4ButtonTop:RegisterForClicks( "AnyUp" )
Bar4ButtonTop:SetAlpha( 0 )
Bar4ButtonTop:SetScript( "OnClick", function( self ) UpdateBar( self, TukuiBar4 ) end )
Bar4ButtonTop:SetScript( "OnEnter", function( self ) self:SetAlpha( 1 ) end )
Bar4ButtonTop:SetScript( "OnLeave", function( self ) self:SetAlpha( 0 ) end )
Bar4ButtonTop.text = T.SetFontString( Bar4ButtonTop, C["media"]["uffont"], 20 )
Bar4ButtonTop.text:SetPoint( "CENTER", 0, 0 )
Bar4ButtonTop.text:SetText( "|cff4BAF4C>|r" )
 
local Bar4ButtonBottom = CreateFrame( "Button", "Bar4ButtonBottom", TukuiBar3 )
Bar4ButtonBottom:SetWidth( width1 )
Bar4ButtonBottom:Height( 17 )
Bar4ButtonBottom:Point( "TOP", TukuiBar3, "BOTTOM", 0, -T.buttonspacing )
Bar4ButtonBottom:SetTemplate( "Default" )
Bar4ButtonBottom:RegisterForClicks( "AnyUp" )
Bar4ButtonBottom:SetAlpha( 0 )
Bar4ButtonBottom:SetScript( "OnClick", function( self ) UpdateBar( self, TukuiBar4 ) end )
Bar4ButtonBottom:SetScript( "OnEnter", function( self ) self:SetAlpha( 1 ) end )
Bar4ButtonBottom:SetScript( "OnLeave", function( self ) self:SetAlpha( 0 ) end )
Bar4ButtonBottom.text = T.SetFontString( Bar4ButtonBottom, C["media"]["uffont"], 20 )
Bar4ButtonBottom.text:SetPoint( "CENTER", 0, 0 )
Bar4ButtonBottom.text:SetText( "|cff4BAF4C>|r" )

local Bar5ButtonTop = CreateFrame( "Button", "Bar5ButtonTop", TukuiBar4 )
Bar5ButtonTop:SetWidth( width1 )
Bar5ButtonTop:Height( 17 )
Bar5ButtonTop:Point( "BOTTOMLEFT", TukuiBar4, "TOPLEFT", 0, T.buttonspacing )
Bar5ButtonTop:SetTemplate( "Default" )
Bar5ButtonTop:RegisterForClicks( "AnyUp" )
Bar5ButtonTop:SetAlpha( 0 )
Bar5ButtonTop:SetScript( "OnClick", function( self ) UpdateBar( self, TukuiBar5 ) end )
Bar5ButtonTop:SetScript( "OnEnter", function( self ) self:SetAlpha( 1 ) end )
Bar5ButtonTop:SetScript( "OnLeave", function( self ) self:SetAlpha( 0 ) end )
Bar5ButtonTop.text = T.SetFontString( Bar5ButtonTop, C["media"]["uffont"], 20 )
Bar5ButtonTop.text:Point( "CENTER", 1, 1 )
Bar5ButtonTop.text:SetText( "|cff4BAF4C>|r" )
 
local Bar5ButtonBottom = CreateFrame( "Button", "Bar5ButtonBottom", TukuiBar4 )
Bar5ButtonBottom:SetFrameLevel( Bar5ButtonTop:GetFrameLevel() + 1 )
Bar5ButtonBottom:SetWidth( width1 )
Bar5ButtonBottom:Height( 17 )
Bar5ButtonBottom:Point( "TOPLEFT", TukuiBar4, "BOTTOMLEFT", 0, -T.buttonspacing )
Bar5ButtonBottom:SetTemplate( "Default" )
Bar5ButtonBottom:RegisterForClicks( "AnyUp" )
Bar5ButtonBottom:SetAlpha( 0 )
Bar5ButtonBottom:SetScript( "OnClick", function( self ) UpdateBar(self, TukuiBar5 ) end )
Bar5ButtonBottom:SetScript( "OnEnter", function( self ) self:SetAlpha( 1 ) end )
Bar5ButtonBottom:SetScript( "OnLeave", function( self ) self:SetAlpha( 0 ) end )
Bar5ButtonBottom.text = T.SetFontString( Bar5ButtonBottom, C["media"]["uffont"], 20 )
Bar5ButtonBottom.text:Point( "CENTER", 1, 1 )
Bar5ButtonBottom.text:SetText( "|cff4BAF4C>|r" )

local init = CreateFrame( "Frame" )
init:RegisterEvent( "VARIABLES_LOADED" )
init:SetScript( "OnEvent", function( self, event )
	if( not TABLDataPerChar ) then TABLDataPerChar = {} end
	local db = TABLDataPerChar

	if( db.hidebar2 ) then
		UpdateBar( Bar2Button, TukuiBar2 )
	end

	if( db.hidebar3 ) then
		UpdateBar( Bar3Button, TukuiBar3 )
	end

	if( db.hidebar4 ) then
		UpdateBar( Bar4Button, TukuiBar4 )
	end

	if( db.hidebar5 ) then
		UpdateBar( Bar5Button, TukuiBar5 )
	end
end )