#!/bin/bash

/etc/init.d/php8.4-fpm restart && nginx -g "daemon off;"
