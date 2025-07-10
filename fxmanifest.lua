fx_version 'cerulean'
game 'gta5'

author 'filipp'
description 'ESX Odkazy Menu s kopírováním, s okokNotify'
version '1.0.0'

shared_script '@es_extended/imports.lua'
client_script 'client.lua'
-- server_script 'server.lua'  -- pokud máte server script

ui_page 'html/index.html'

files {
    'html/index.html'
}

dependencies {
    'okokNotify'
}
