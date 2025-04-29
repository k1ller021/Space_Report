🚨 Space Report - Sistema de Reporte para FiveM (com ox_lib e Webhook Discord)
Sistema simples e eficaz de denúncias no servidor. Permite que qualquer jogador envie reports diretamente do jogo, que são enviados para um canal no Discord e notificados para administradores online.

✨ Funcionalidades
Interface de reporte utilizando ox_lib.

Comando /report acessível por todos os jogadores.

Envio automático para webhook no Discord, com menção a @everyone e cargos específicos.

Notificação ingame para administradores online usando ox_lib:notify.

Suporte à permissão de grupos via ESX.

🧩 Requisitos
ox_lib


🛠️ Instalação
Copie a pasta space_report para a sua pasta de recursos (resources/[local] por exemplo).

Adicione ao seu server.cfg:

cfg
Copiar
Editar
ensure ox_lib
ensure space_report
🧾 Comando
/report: Abre o menu para o jogador enviar um reporte.

⚙️ Configuração
Abra o arquivo config.lua e configure:

lua
Copiar
Editar
Config = {}

-- Webhook do seu canal no Discord
Config.Webhook = 'https://discord.com/api/webhooks/SEU_WEBHOOK'

-- Grupos de admin que receberão a notificação ingame
Config.AdminGroups = {
    'admin',
    'superadmin',
    'mod'
}
🛡️ Permissões de Admin
O script usa grupos ESX (xPlayer.getGroup()), então verifique se seus administradores estão corretamente atribuídos em Config.AdminGroups.

📷 Prévia
Ingame (admin):
Notificação aparece no canto da tela com nome e ID do jogador.

Discord:
Mensagem formatada com título, descrição e menciona @everyone e <@&1354842354883760239> (cargo específico).

📄 Licença
Este projeto é livre para uso em servidores privados e públicos. Não é permitido revender ou repostar sem autorização da Space Store.

