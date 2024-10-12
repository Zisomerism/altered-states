if SERVER then
    AddCSLuaFile( "altered-states/client/altered-states.lua" )
else
    include( "altered-states/client/altered-states.lua" )
end