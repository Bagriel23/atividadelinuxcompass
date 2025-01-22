SERVICE="nginx"
LOG_DIR="$HOME/nginx_check"  # Usando o diretório dentro da home do usuário
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Cria o diretório de logs dentro da home
mkdir -p "$LOG_DIR"

# Verifica o status do serviço
if systemctl is-active --quiet $SERVICE; then
    STATUS="ONLINE"
    MESSAGE="O serviço está funcionando corretamente."
    echo "$DATE - $SERVICE - $STATUS - $MESSAGE" >> "$LOG_DIR/nginx_online.log"
else
    STATUS="OFFLINE"
    MESSAGE="O serviço está fora do ar. Verifique!"
    echo "$DATE - $SERVICE - $STATUS - $MESSAGE" >> "$LOG_DIR/nginx_offline.log"
fi

