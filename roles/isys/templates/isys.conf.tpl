; Config file for Intelius app code
;
; This is a System Configuration File. Settings here can be accessed via
; ISys_GetSysConf(PROPERTY_DEFINE) call
; Comments start with ';', as in php.ini

[Memcached]
{% for server in isys.memcached.servers %}
Servers[] = "{{server}}"
{% endfor %}
No_Block = On
TCP_NoDelay = On
Connect_Timeout = 250
Retry_Timeout = 360000
Send_Timeout = 250
Recv_Timeout = 250
Poll_Timeout = 250
Server_Failure_Limit = 10
