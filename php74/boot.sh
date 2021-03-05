#!/bin/bash

/etc/init.d/php7.4-fpm restart && nginx -g "daemon off;"