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
Config.Webhook = '![image](https://github.com/user-attachments/assets/d27abd5f-6192-4fa8-8bf1-a33c590364d9)
'

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
https://cdn.discordapp.com/attachments/1366868452823928862/1366868536752078908/image.png?ex=68128306&is=68113186&hm=091076e476ff14f498524bad3c888d5e2e30ac9b20f480fc0660d73d8993f3df&
https://cdn.discordapp.com/attachments/1366868452823928862/1366868610756120626/image.png?ex=68128317&is=68113197&hm=34790d69172d5350de5c4a78079aa672633e665477f442b84f2226ce93c011b2&
https://cdn.discordapp.com/attachments/1366868452823928862/1366868756025839617/image.png?ex=6812833a&is=681131ba&hm=bf7e22704237cddf03701b95904a56cd399adf9dd6b42828eaf00ca69349db46&

Discord:
Mensagem formatada com título, descrição e menciona @everyone e <@&1354842354883760239> (cargo específico).

📄 Licença
Este projeto é livre para uso em servidores privados e públicos. Não é permitido revender ou repostar sem autorização da Space Store.

