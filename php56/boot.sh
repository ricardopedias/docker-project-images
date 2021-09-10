#!/bin/bash

/etc/init.d/php5-fpm restart && nginx -g "daemon off;"
