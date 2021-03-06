#!/bin/sh

iptables -F
iptables -X
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# iptables -A INPUT -j DROP
# iptables -A OUTPUT -j DROP
# make a commandline addremove feature
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
#telnet
iptables -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
#ftp
#iptables -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
#
#iptables -A OUTPUT -p tcp -m tcp --dport 22 -j LOG_ACCEPT
#iptables -A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT

iptables -A OUTPUT -p tcp -m tcp --dport 23 -j ACCEPT

#SMTP
iptables -A INPUT -p tcp -m tcp --dport 25 -j LOG_ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT
#WHOIS
iptables -A INPUT -p tcp -m tcp --dport 43 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 43 -j ACCEPT
#DNS
iptables -A INPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
#HTTP
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
#HTTPS
iptables -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 110 -j ACCEPT
#email
iptables -A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 143 -j ACCEPT
#ssl webtraffic
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
#email - SMTP 
iptables -A INPUT -p tcp -m tcp --dport 465 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 465 -j ACCEPT
#email - imapssl
iptables -A INPUT -p tcp -m tcp --dport 995 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 995 -j ACCEPT
#email - popssl
iptables -A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 993 -j ACCEPT
#hobohost
iptables -A INPUT -p tcp -m tcp --dport 2083 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 2083 -j ACCEPT
#shoutcast
iptables -A INPUT -p tcp -m tcp --dport 8000 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 8000 -j ACCEPT
#irc
iptables -A INPUT -p tcp -m tcp --dport 6667 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 6667 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 9999 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 9999 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 6668 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 6668 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 6669 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 6669 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 7001 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 7001 -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 3306 -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 515 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 515 -j ACCEPT

#iptables -I INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

iptables -I INPUT -p icmp -j DROP
iptables -I INPUT -p udp -j DROP
iptables -I OUTPUT -p icmp -j DROP
iptables -I OUTPUT -p udp -j DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
