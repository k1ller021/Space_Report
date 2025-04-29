-- Verifica se ox_lib está carregado corretamente
if not lib then
    return print('[space_report] ox_lib não está carregado!')
end

RegisterCommand('report', function()
    local input = lib.inputDialog('Sistema de Reporte', {
        {type = 'input', label = 'Assunto', placeholder = 'Ex: RDM na praça', required = true},
        {type = 'textarea', label = 'Descrição', placeholder = 'Descreva o que aconteceu', required = true}
    })

    if not input then return end

    local title, description = input[1], input[2]
    TriggerServerEvent('space_report:sendReport', title, description)
    lib.notify({title = 'Reporte Enviado', description = 'A equipe foi notificada.', type = 'success'})
end)
