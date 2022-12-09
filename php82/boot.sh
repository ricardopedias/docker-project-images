#!/bin/bash

/etc/init.d/php8.2-fpm restart && nginx -g "daemon off;"
