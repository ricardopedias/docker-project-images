#!/bin/bash

/etc/init.d/php8.0-fpm restart \
&& envsubst < /etc/supervisor/conf.d/up-worker.conf.template | tee /etc/supervisor/conf.d/up-worker.conf \
&& envsubst < /opt/worker.php.template | tee /opt/worker.php \
&& chmod a+x /opt/worker.php \
&& nginx -g "daemon off;"
