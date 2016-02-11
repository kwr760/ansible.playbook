<Directory />
    Options FollowSymLinks
    AllowOverride None
    Require all denied
</Directory>

<Directory "/usr/local/html">
    Options FollowSymLinks
    AllowOverride AuthConfig
    Require all granted
</Directory>

<IfModule dir_module>
    DirectoryIndex index.html
</IfModule>

<FilesMatch "^\.ht">
    Require all denied
    Satisfy All
</FilesMatch>

<Directory "/usr/local/apache/cgi-bin">
    AllowOverride None
    Options None
    Require all granted
</Directory>

