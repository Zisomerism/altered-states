if SERVER then
    AddCSLuaFile( "altered-states/client/evil.lua" )
else
    include( "altered-states/client/evil.lua" )
end