local function isAdmin(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end
    for _, group in ipairs(Config.AdminGroups) do
        if xPlayer.getGroup() == group then
            return true
        end
    end
    return false
end

-- Função para buscar jogadores próximos
local function getNearbyPlayers(src, radius)
    local players = {}
    local coords = GetEntityCoords(GetPlayerPed(src))

    for _, playerId in ipairs(GetPlayers()) do
        local ped = GetPlayerPed(playerId)
        if ped ~= 0 and playerId ~= src then
            local targetCoords = GetEntityCoords(ped)
            local distance = #(coords - targetCoords)
            if distance <= radius then
                local citizenid = GetPlayerIdentifier(playerId, 0) or "Desconhecido"
                table.insert(players, string.format("- %s (ID: %s)", citizenid, playerId))
            end
        end
    end

    return table.concat(players, "\n")
end

RegisterServerEvent('space_report:sendReport', function(message)
    local src = source
    local name = GetPlayerName(src)
    local id = src
    local nearby = getNearbyPlayers(src, 20.0) -- raio de 20 metros

    local content = string.format(
        "@everyone <@&1354842354883760239> Novo reporte de **%s** (ID: %s):\n%s",
        name, id, message
    )

    local embedDescription = content
    if nearby ~= "" then
        embedDescription = embedDescription .. "\n\n**Jogadores próximos:**\n" .. nearby
    end

    -- Envia pro Discord
    PerformHttpRequest(Config.Webhook, function() end, 'POST', json.encode({
        username = 'Sistema de Reporte',
        embeds = {{
            title = 'Novo Reporte',
            description = embedDescription,
            color = 16711680
        }},
        content = '@everyone <@&1354842354883760239>'
    }), { ['Content-Type'] = 'application/json' })

    -- Notifica admins online
    for _, playerId in ipairs(GetPlayers()) do
        if isAdmin(tonumber(playerId)) then
            TriggerClientEvent('ox_lib:notify', tonumber(playerId), {
                title = '📢 Novo Reporte',
                description = ('De %s (ID: %s)'):format(name, id),
                type = 'inform',
                duration = 10000
            })
        end
    end
end)
