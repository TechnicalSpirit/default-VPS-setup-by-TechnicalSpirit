#!/bin/bash

iptables -N PORTSCAN 2>/dev/null
iptables -F PORTSCAN

iptables -A PORTSCAN -m recent --set --name portscan
iptables -A PORTSCAN -m recent \
  --update --seconds {{ portscan_seconds }} \
  --hitcount {{ portscan_hitcount }} \
  --name portscan \
  -j LOG --log-prefix "PORTSCAN "
iptables -A PORTSCAN -j DROP

iptables -C INPUT -m state --state NEW -j PORTSCAN 2>/dev/null || \
iptables -A INPUT -m state --state NEW -j PORTSCAN
