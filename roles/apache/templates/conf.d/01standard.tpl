
#
# -old- Custom server settings, per RT#11287.
# Kevin's research settings, per RT29058 20090824
#
StartServers {{apache.conf.start_servers if apache.conf.start_servers is defined else 5}}
MinSpareServers {{apache.conf.min_spare_servers if apache.conf.min_spare_servers is defined else 5}}
MaxSpareServers {{apache.conf.max_spare_servers if apache.conf.max_spare_servers is defined else 10}}
ServerLimit {{apache.conf.server_limit if apache.conf.server_limit is defined else 256}}
MaxRequestWorkers {{apache.conf.max_request_workers if apache.conf.max_request_workers is defined else 256}}

KeepAliveTimeout {{apache.conf.keep_alive_timeout}}

ErrorLog "|/usr/bin/rotatelogs /usr/local/apache/logs/error_log.%Y%m%d 86400 -480"
LogLevel warn

<IfModule log_config_module>
   #
   # The following directives define some format nicknames for use with
   # a CustomLog directive (see below).
   #
   #    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
   LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" \"%{PHPSESSID}C\"" combined
   LogFormat "%V\t%h\t%l\t%u\t%t\t\"%r\"\t%>s\t%b\t%D\t\"%{Referer}i\"\t\"%{User-Agent}i\"\t\"%{PHPSESSID}C\"" combined_vhost
   LogFormat "%h %l %u %t \"%r\" %>s %b" common
   LogFormat "%V\t%{X-Intelius-Forwarded}i\t%l\t%u\t%t\t\"%r\"\t%>s\t%b\t%D\t\"%{Referer}i\"\t\"%{User-Agent}i\"\t\"%{PHPSESSID}C\"" f5_forwarded

   CustomLog "|/usr/bin/rotatelogs /usr/local/apache/logs/access_log.%Y%m%d 86400 -480" combined_vhost

</IfModule>

<IfModule alias_module>
   #this is safe to leave this way for all environments
   ServerTokens Prod
   ServerSignature Off
   ScriptAlias /cgi-bin/ "/usr/local/apache/cgi-bin/"
</IfModule>

<IfModule mime_module>
   TypesConfig /etc/mime.types
   AddType application/x-compress .Z
   AddType application/x-gzip .gz .tgz
   AddType application/x-httpd-php .php
   AddType application/x-httpd-php .html
   AddType application/x-httpd-php .htm
</IfModule>

BrowserMatch "Mozilla/2" nokeepalive
BrowserMatch "MSIE 4\.0b2;" nokeepalive downgrade-1.0 force-response-1.0
BrowserMatch "RealPlayer 4\.0" force-response-1.0
BrowserMatch "Java/1\.0" force-response-1.0
BrowserMatch "JDK/1\.0" force-response-1.0

<IfModule ssl_module>
   SSLRandomSeed startup builtin
   SSLRandomSeed connect builtin
</IfModule>

