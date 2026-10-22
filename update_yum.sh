#!/usr/bin/env bash
php -v
set -e
[[ $EUID -eq 0 ]] || { echo "run as root" >&2; exit 1; }

PHP_VER=$(php -v | sed -nE '1s/^PHP ([0-9]+\.[0-9]+).*/\1/p')
[[ -n "$PHP_VER" ]] || { echo "cannot detect PHP version" >&2; exit 1; }

yum update
yum install -y --only-upgrade "php${PHP_VER}*"
php -v
