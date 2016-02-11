; xDebug specific information.
; Any changes made by dev in this file will not
; be overwritten by subqequent ansible runs.
; Modify to fit whatever IDE you're using.
xdebug.remote_enable=1
xdebug.remote_host={{ansible_default_ipv4.address}}
xdebug.idekey=phpstorm-xdebug
