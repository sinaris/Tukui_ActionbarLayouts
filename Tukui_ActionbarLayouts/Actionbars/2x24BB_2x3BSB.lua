---------------------------------------------------------------------------------------------
-- Project: Tukui Actionbar Layouts Version 1.0
---------------------------------------------------------------------------------------------

local L, C = unpack( select( 2, ... ) )

if( C["options"]["enable"] ~= true or C["options"]["layout"] ~= 10 ) then return end

------------------------------
-- Debug
------------------------------
if( C["options"]["debug"] ~= true ) then return end

print( "|cff00AAFFTukui Actionbar Layouts:|r" )
print( "|cffFF6347Active Layout: 2x24 Bottom Bars + 2x3 Bottom Split Bars|r" )