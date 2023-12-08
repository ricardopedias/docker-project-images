#!/bin/bash

/etc/init.d/php8.3-fpm restart && nginx -g "daemon off;"
