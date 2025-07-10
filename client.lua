ESX = exports['es_extended']:getSharedObject()

RegisterCommand("odkazy", function()
    OpenOdkazyMenu()
end, false)

local odkazy = {
    { label = "Discord Server", value = "https://discord.gg/PwpEekFXCW" },
    { label = "Pravidla Serveru", value = "https://spectreroleplay.gitbook.io/pravidla/herni-pravidla" },
    { label = "TikTok Serveru", value = "https://www.tiktok.com/@spectre_roleplay" },
    { label = "Tebex Serveru", value = "https://spectreroleplay.tebex.io/" },
    { label = "Instagram Serveru", value = "https://www.instagram.com/spectreroleplay.cz/" }
}

function OpenOdkazyMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'odkazy_menu', {
        title = "SPECTRE ROLEPLAY",
        align = "top-left",
        elements = odkazy
    }, function(data, menu)
        OpenOdkazyActions(data.current)
    end, function(data, menu)
        menu.close()
    end)
end

function OpenOdkazyActions(link)
    local elements = {
        { label = "Kopírovat do schránky", value = "copy" },
    }
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'odkazy_action', {
        title = link.label,
        align = "top-left",
        elements = elements
    }, function(data, menu)
        if data.current.value == "copy" then
            CopyToClipboard(link.value)
        elseif data.current.value == "open" then
            OpenWebPage(link.value)
        end
    end, function(data, menu)
        menu.close()
        OpenOdkazyMenu()
    end)
end


function CopyToClipboard(url)
    exports['okokNotify']:Alert("Info", "Odkaz byl zkopírován do schránky.", 5000, 'info')
    SendNUIMessage({
        action = "copy",
        text = url
    })
end


-- Callback pro zavření NUI a vrácení fokusu
RegisterNUICallback('closeUI', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)
