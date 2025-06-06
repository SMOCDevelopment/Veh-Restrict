RegisterServerEvent('veh_restrict:checkPerms')
AddEventHandler('veh_restrict:checkPerms', function(netVeh, vehicleName)
    local src = source
    if IsPlayerAceAllowed(src, 'veh.override') then return end

    TriggerClientEvent('veh_restrict:deleteNow', src, netVeh)

    local name = GetPlayerName(src)
    local ids = getIDs(src)

    local embed = {
        username = "🚨 Vehicle Restrict Logs",
        embeds = {{
            title = "Restricted Vehicle Removed",
            color = 16711680,
            fields = {
                { name = "Player", value = name .. " (`" .. src .. "`)", inline = true },
                { name = "Vehicle", value = vehicleName, inline = true },
                { name = "License", value = ids.license or "N/A", inline = false },
                { name = "Discord", value = ids.discord or "N/A", inline = false }
            },
            footer = { text = "Vehicle Restriction System" },
            timestamp = os.date('!%Y-%m-%dT%H:%M:%SZ')
        }}
    }

    PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode(embed), {
        ['Content-Type'] = 'application/json'
    })
end)

function getIDs(src)
    local ids = { license = nil, discord = nil }
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if id:find("license:") then
            ids.license = id
        elseif id:find("discord:") then
            ids.discord = "<@" .. id:gsub("discord:", "") .. ">"
        end
    end
    return ids
end
