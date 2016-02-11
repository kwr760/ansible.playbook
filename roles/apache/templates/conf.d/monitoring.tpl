# apache configuration for monitoring

ExtendedStatus On


<Location /server-status>
SetHandler server-status

{% if apache.monitoring is defined and apache.monitoring.allowed_ips is defined %}

{% for ip in apache.monitoring.allowed_ips %}
Require ip {{ ip }}
{%endfor%}
{% else %}
Require all denied
{% endif %}
</Location>
