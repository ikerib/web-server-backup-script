#!/bin/bash
echo "Web aplikazioen karpeten segurtasun kopiako zaharrak ezabatu"
echo ""

cd /backup/www

find .  -name "*.gz" -atime -1 -print |xargs --no-run-if-empty rm -v

cd /backup/mysql
find .  -name "*.gz" -atime -1 -print |xargs --no-run-if-empty rm -v
