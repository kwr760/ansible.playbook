# Default Intelius virtual host template

<VirtualHost *:80>
    ServerAdmin webmaster@email.com
    DocumentRoot /usr/local/html
    ErrorLog "|/usr/bin/rotatelogs /var/log/apache2/error_log.%Y%m%d 86400 -480"
    CustomLog "|/usr/bin/rotatelogs /var/log/apache2/access_log.%Y%m%d 86400 -480" f5_forwarded env=forwarded
    CustomLog "|/usr/bin/rotatelogs /var/log/apache2/access_log.%Y%m%d 86400 -480" combined_vhost env=!forwarded

    RewriteEngine On
    RewriteCond %{REQUEST_METHOD} ^(TRACE|TRACK)
    RewriteRule .* - [F]
    RewriteRule ^/(.*)$ /siteconfig.inc.php [L]

<IfModule mod_dir.c>
    DirectoryIndex index.php
</IfModule>
</VirtualHost>
