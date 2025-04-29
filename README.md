🚨 Space Report - Sistema de Reporte para FiveM (com ox_lib e Webhook Discord)
Sistema simples e eficaz de denúncias no servidor. Permite que qualquer jogador envie reports diretamente do jogo, que são enviados para um canal no Discord e notificados para administradores online.

✨ Funcionalidades
Interface de reporte utilizando ox_lib.

Comando /report acessível por todos os jogadores.

Envio automático para webhook no Discord, com menção a @everyone e cargos específicos.

Notificação ingame para administradores online usando ox_lib:notify.

Suporte à permissão de grupos.

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

configure os cargos mecionados
![image](https://github.com/user-attachments/assets/a6b8b9b3-62db-4c2d-b404-188df18409c0)

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
![image](https://github.com/user-attachments/assets/ad50f11d-5618-4a31-8460-4cbdb3cf4cc5)

![image](https://github.com/user-attachments/assets/fce250d5-0ecb-45ac-9bfc-d80ab2ad0cdc)

![image](https://github.com/user-attachments/assets/b626830e-a636-4050-a631-151257599d17)



Discord:
Mensagem formatada com título, descrição e menciona @everyone e <@&1354842354883760239> (cargo específico).

📄 Licença
Este projeto é livre para uso em servidores privados e públicos. Não é permitido revender ou repostar sem autorização da Space Store.

