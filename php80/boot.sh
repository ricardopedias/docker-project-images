#!/bin/bash

/etc/init.d/php8.0-fpm restart && nginx -g "daemon off;"