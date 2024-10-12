function StartNightmareVision()
    local fadeOut = 5
    local fadeIn = 0
    hook.Add( "RenderScreenspaceEffects", "NightmarePostProcessing", function()
        if fadeOut > 0.5 then
            fadeOut = fadeOut - 0.05
            fadeIn = fadeIn + 0.05
        else
            fadeOut = 0
            fadeIn = 5
        end
        local tab = {
            ["$pp_colour_addr"] = 0,
            ["$pp_colour_addg"] = 0,
            ["$pp_colour_addb"] = 0,
            ["$pp_colour_brightness"] = 0,
            ["$pp_colour_contrast"] = fadeIn / 5,
            ["$pp_colour_colour"] = fadeOut / 5,
            ["$pp_colour_inv"] = fadeIn / 5,
            ["$pp_colour_mulr"] = 0,
            ["$pp_colour_mulg"] = 0,
            ["$pp_colour_mulb"] = 0
        }
        DrawColorModify( tab )
        DrawSharpen( fadeIn, fadeIn )
        DrawSobel( fadeIn / 10 )
        DrawBokehDOF( fadeOut, 1, fadeOut )
        DrawMaterialOverlay( "shaders/nightmare_overlay", 0 )
    end )
end

function EndNightmareVision()
    local fadeOut = 5
    local fadeIn = 0
    hook.Add( "RenderScreenspaceEffects", "NightmarePostProcessing", function()
        if fadeOut > 0.5 then
            fadeOut = fadeOut - 0.05
            fadeIn = fadeIn + 0.05
        else
            hook.Remove( "RenderScreenspaceEffects", "NightmarePostProcessing" )
        end
        local tab = {
            ["$pp_colour_addr"] = 0,
            ["$pp_colour_addg"] = 0,
            ["$pp_colour_addb"] = 0,
            ["$pp_colour_brightness"] = 0,
            ["$pp_colour_contrast"] = fadeOut / 5,
            ["$pp_colour_colour"] = fadeIn / 5,
            ["$pp_colour_inv"] = fadeOut / 5,
            ["$pp_colour_mulr"] = 0,
            ["$pp_colour_mulg"] = 0,
            ["$pp_colour_mulb"] = 0
        }
        DrawColorModify( tab )
        DrawSharpen( fadeOut, fadeOut )
        DrawSobel( fadeOut / 10 )
    end )

end

net.Receive( "start_nightmare_vision", StartNightmareVision )
net.Receive( "end_nightmare_vision", EndNightmareVision )


function StartCerebralVision()
    local fadeOut = 5
    local fadeIn = 0
    hook.Add( "RenderScreenspaceEffects", "CerebralPostProcessing", function()
        if fadeOut > 0.5 then
            fadeOut = fadeOut - 0.05
            fadeIn = fadeIn + 0.05
        else
            fadeOut = 0
            fadeIn = 5
        end
        local tab = {
            ["$pp_colour_addr"] = 0,
            ["$pp_colour_addg"] = 0,
            ["$pp_colour_addb"] = 0,
            ["$pp_colour_brightness"] = fadeIn / 20,
            ["$pp_colour_contrast"] = fadeIn / 20,
            ["$pp_colour_colour"] = fadeIn * 5,
            ["$pp_colour_inv"] = 0,
            ["$pp_colour_mulr"] = 0,
            ["$pp_colour_mulg"] = 0,
            ["$pp_colour_mulb"] = 0
        }
        DrawColorModify( tab )
        DrawSharpen( fadeIn / 5, fadeIn / 5 )
        DrawSobel( fadeIn )
        DrawBokehDOF( fadeOut, 1, fadeOut )
        DrawMaterialOverlay( "shaders/cerebral_overlay", 0 )
    end )
end

function EndCerebralVision()
    local fadeOut = 5
    local fadeIn = 0
    hook.Add( "RenderScreenspaceEffects", "CerebralPostProcessing", function()
        if fadeOut > 0.5 then
            fadeOut = fadeOut - 0.05
            fadeIn = fadeIn + 0.05
        else
            hook.Remove( "RenderScreenspaceEffects", "CerebralPostProcessing" )
        end
        local tab = {
            ["$pp_colour_addr"] = 0,
            ["$pp_colour_addg"] = 0,
            ["$pp_colour_addb"] = 0,
            ["$pp_colour_brightness"] = fadeOut / 20,
            ["$pp_colour_contrast"] = fadeOut / 20,
            ["$pp_colour_colour"] = fadeOut * 5,
            ["$pp_colour_inv"] = 0,
            ["$pp_colour_mulr"] = 0,
            ["$pp_colour_mulg"] = 0,
            ["$pp_colour_mulb"] = 0
        }
        DrawColorModify( tab )
        DrawSharpen( fadeOut / 5, fadeOut / 5 )
        DrawSobel( fadeOut )
    end )

end

net.Receive( "start_cerebral_vision", StartCerebralVision )
net.Receive( "end_cerebral_vision", EndCerebralVision )