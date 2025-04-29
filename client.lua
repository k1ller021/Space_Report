-- Verifica se ox_lib está carregado corretamente
if not lib then
    return print('[space_report] ox_lib não está carregado!')
end

RegisterCommand('report', function()
    local input = lib.inputDialog('Sistema de Reporte', {
        {type = 'input', label = 'Assunto', placeholder = 'Ex: RDM na praça', required = true},          -- Opção 1
        {type = 'textarea', label = 'Descrição', placeholder = 'Descreva o que aconteceu', required = true}, -- Opção 2
        {type = 'input', label = 'ID do Jogador Envolvido', placeholder = 'Opcional'},                  -- Opção 4
        {type = 'input', label = 'Horário do Ocorrido', placeholder = 'Ex: 20:35 ou "agora"'},           -- Opção 6
        {type = 'input', label = 'Link de Prova (Vídeo/Foto)', placeholder = 'Ex: imgur.com/...'},       -- Opção 7
    })

    if not input then return end

    local title, description = input[1], input[2]
    local idInvolved, hour, proof = input[3], input[4], input[5]

    local fullMessage = ("**Assunto:** %s\n\n**Descrição:** %s"):format(title, description)
    if idInvolved and idInvolved ~= '' then
        fullMessage = fullMessage .. ("\n\n**Jogador Envolvido:** %s"):format(idInvolved)
    end
    if hour and hour ~= '' then
        fullMessage = fullMessage .. ("\n**Horário:** %s"):format(hour)
    end
    if proof and proof ~= '' then
        fullMessage = fullMessage .. ("\n**Prova:** %s"):format(proof)
    end

    TriggerServerEvent('space_report:sendReport', fullMessage)
    lib.notify({title = 'Reporte Enviado', description = 'A equipe foi notificada.', type = 'success'})
end)
