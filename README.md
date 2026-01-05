```
# Список всех jails
docker exec -it fail2ban fail2ban-client status

# Детали конкретного jails
docker exec -it fail2ban fail2ban-client status sshd
docker exec -it fail2ban fail2ban-client status portscan

# Посмотреть список забаненных IP
docker exec -it fail2ban fail2ban-client status sshd | grep "Banned IP list"
```