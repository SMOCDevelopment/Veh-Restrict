fx_version 'cerulean'
game 'gta5'

description 'Vehicle Restriction System using ox_lib'
author 'SMOC Development'
version '1.0.0'

client_scripts {
    '@ox_lib/init.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

lua54 'yes'
dependency 'ox_lib'
