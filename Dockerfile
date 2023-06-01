FROM alpine:latest
RUN apk add --no-cache postfix

EXPOSE 25

# Configure Postfix.
RUN postconf -e 'inet_interfaces = all' \
    && postconf -e 'inet_protocols = ipv4' \
    && postconf -e 'mydestination = localhost' \
    && postconf -e 'mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 0.0.0.0/0' \
    && postconf -e 'smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination' \
    && postconf -e 'smtpd_tls_security_level = may' \
    && postconf -e 'smtpd_tls_auth_only = no'

# Ejecuta posstfix
CMD postfix start && tail -f /dev/null
