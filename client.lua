local restrictedVehicles = {
    "rhino", "hydra", "insurgent", "insurgent2", "oppressor", "oppressor2",
    "nightshark", "kuruma", "kuruma2", "deluxo", "toreador", "bullet", "voltic",
    "vigilante", "scramjet", "phantom2", "zhaba", "halftrack", "ruiner2",
    "bruiser", "bruiser2", "bruiser3", "cerberus", "cerberus2", "cerberus3",
    "dominator4", "dominator5", "dominator6"
}

local function isRestricted(model)
    for _, name in pairs(restrictedVehicles) do
        if model == GetHashKey(name) then return true end
    end
    return false
end

CreateThread(function()
    while true do
        Wait(100)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped, false)
            local model = GetEntityModel(veh)
            if isRestricted(model) then
                TriggerServerEvent('veh_restrict:checkPerms', VehToNet(veh), GetDisplayNameFromVehicleModel(model))
            end
        end
    end
end)

RegisterNetEvent('veh_restrict:deleteNow', function(netVeh)
    local veh = NetToVeh(netVeh)
    if DoesEntityExist(veh) then
        SetEntityAsMissionEntity(veh, true, true)
        DeleteVehicle(veh)

        if lib then
            lib.notify({
                title = 'Restricted Vehicle',
                description = 'That vehicle was not allowed and has been removed.',
                type = 'error'
            })
        end
    end
end)
