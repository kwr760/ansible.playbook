ExtendedStatus On

listen 9080
<VirtualHost *:9080>
   ServerAdmin webmaster@intelius.com

   <Location /server-status>
	SetHandler server-status
	Require ip 127.0.0.1
   </Location>

   <Location /server-info>
	SetHandler server-info
   Require ip 127.0.0.1
   </Location>

</VirtualHost>
