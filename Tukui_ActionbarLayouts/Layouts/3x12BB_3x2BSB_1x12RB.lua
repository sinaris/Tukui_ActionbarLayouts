---------------------------------------------------------------------------------------------
-- Project: Tukui Actionbar Layouts Version 1.0
---------------------------------------------------------------------------------------------

local L, C = unpack( select( 2, ... ) )

if( C["options"]["enable"] ~= true or C["options"]["layout"] ~= 6 ) then return end

------------------------------
-- Debug
------------------------------
if( C["options"]["debug"] ~= true ) then return end

print( "|cff00AAFFTukui Actionbar Layouts:|r" )
print( "|cffFF6347Active Layout: 3x12 Bottom Bars + 3x2 Bottom Split Bars + 1x12 Right Bars|r" )