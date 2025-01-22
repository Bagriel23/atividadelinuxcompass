# atividadelinuxcompass
Documentação para a Atividade Prática de Monitoramento do Nginx
Esta documentação descreve o passo a passo da atividade prática de monitoramento do serviço Nginx em um servidor Linux. O objetivo é subir o servidor Nginx, criar um script que verifique se o serviço está online, registre o status em arquivos de log e automatize a execução dessa verificação a cada 5 minutos.

Antes de mais nada, foi necessário configurar um ambiente Linux. A distribuição recomendada para isso é o Ubuntu Server, que pode ser instalado em uma máquina física ou virtual. Como utilizei o Windows, foi necessário instalar o WSL (Windows Subsystem for Linux), que me permitiu rodar uma distribuição Linux dentro do Windows. Você tem tanto a opção de instalar na Microsoft Store como instala-lo por linha de comando no powershell. Qualquer seja sua opção, verifique a atualização da sua máquina.
Depois de instalar o sistema operacional, o próximo passo é instalar o Nginx. Utilizei os seguintes comandos para instalar e configurar o serviço: 

sudo apt update && sudo apt upgrade -y
sudo apt install nginx -y

Logo em seguida, iniciei o serviço nginx:

sudo systemctl start nginx
sudo systemctl enable nginx

Note que, além de iniciar o serviço, configurei também para ser executado automaticamente ao iniciar o sistema. Em sequência, verifiquei o status do servidor com:

sudo systemctl status nginx

Após a instalação e configuração do nginx, criei um script em bash para monitorar o statu de serviço Nginx. O script deve verificar a situação do servidor Ngix e retornar a saída dele em um arquivo. Nesse repositório você terá acesso ao script, chamado stts_nginx.sh, que está em uma pasta nomeada "scripts".

Uma rápida explicação do Script:
Verifica se o serviço Nginx está ativo usando o comando systemctl is-active.
Se o serviço estiver funcionando, ele registra uma mensagem no arquivo online.log. Se o serviço estiver fora do ar, a mensagem vai para o arquivo offline.log.
A mensagem inclui a data e hora, o nome do serviço, o status (ONLINE ou OFFLINE) e uma mensagem personalizada sobre o status do serviço.

Não se esqueça que seu script tem que ter permissões de execução. Garanta iso com o comando:

chmod +x /caminho/para/nginx_checker.sh

Lembre de trocar "caminho/para" para o path correto no seu contexto.
Para que o script seja executado automaticamente a cada 5 minutos, foi necessário configurar o cron, que é o agendador de tarefas do Linux. Para a configuração do cron, foi utilizado o comando:

crontab -e

Dentro do editor, foi adicioando a seguinte linha para agendar a execução do script a cada 5 minutos:

*/5 * * * * /caminho/para/nginx_checker.sh

Mesma coisa sobre o path, use o certo para o eu contexto.
Os arquivos de log gerados pelo script são os responsáveis por registrar o status do serviço Nginx. Eles serão salvos nos caminhos que você especifiquei no script(Linha 2), como online.log e offline.log.
Além disso, foi feito o verionamento de toda a atividade no git.
