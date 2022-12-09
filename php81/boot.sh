#!/bin/bash

/etc/init.d/php8.1-fpm restart && nginx -g "daemon off;"
