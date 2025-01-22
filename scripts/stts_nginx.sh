SERVICE="nginx"
LOG_DIR="/var/log/nginx_check"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

mkdir -p "$LOG_DIR"

# Verificar status do serviço
if systemctl is-active --quiet $SERVICE; then
    STATUS="ONLINE"
    MESSAGE="O serviço está funcionando corretamente."
    echo "$DATE - $SERVICE - $STATUS - $MESSAGE" >> "$LOG_DIR/nginx_online.log"
else
    STATUS="OFFLINE"
    MESSAGE="O serviço está fora do ar. Verifique!"
    echo "$DATE - $SERVICE - $STATUS - $MESSAGE" >> "$LOG_DIR/nginx_offline.log"
fi

