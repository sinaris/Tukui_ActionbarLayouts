---------------------------------------------------------------------------------------------
-- Project: Tukui Actionbar Layouts Version 1.0
---------------------------------------------------------------------------------------------

local L, C = unpack( select( 2, ... ) )

if( C["options"]["enable"] ~= true or C["options"]["layout"] ~= 3 ) then return end

------------------------------
-- Debug
------------------------------
if( C["options"]["debug"] ~= true ) then return end

print( "|cff00AAFFTukui Actionbar Layouts:|r" )
print( "|cffFF6347Active Layout: 4x12 Bottom Bars + 1x12 Right Bars|r" )