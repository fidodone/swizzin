#!/bin/bash

# Nginx configuration for monitor
# Author - hwcltjn
MASTER=$(cut -d: -f1 < /root/.master.info)

if [[ ! -f /etc/nginx/apps/monitor.conf ]]; then
	cat > /etc/nginx/apps/monitor.conf <<MON
location /monitor {
  include /etc/nginx/snippets/proxy.conf;
  proxy_pass        http://127.0.0.1:8555/;
  auth_basic "What's the password?";
  auth_basic_user_file /etc/htpasswd.d/htpasswd.${MASTER};
}
MON
fi