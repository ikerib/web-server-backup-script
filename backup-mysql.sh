#!/bin/bash
echo "MySQL Datu basearen segurtasun kopia burutzen..."
echo ""
DB_BK_FOLDER="/backup/mysql/"

DB_NAME1="DATUBASEIZENA1"
DB_FILE1="$DB_NAME1-`date +%Y%m%d_%H%M%S`"
DB_BACKUP1="$DB_BK_FOLDER$DB_FILE1"

DB_USER="MYSQL ERABILTZAILEA"
DB_PASSWD="MYSQL PASAHITZA"
#FTP_SERVER="ftp zerbitzaria"
#FTP_USER="ftp erabiltzailea"
#FTP_PASSW="ftp pasahitza"

echo ""
echo "Sortzen MySQL Dump => $DB_NAME1"
mysqldump -u $DB_USER --password=$DB_PASSWD --lock-tables=false $DB_NAME1 > $DB_FILE1.sql
echo "$DB_FILE1.sql sortu da"

echo "Base datua konprimitzen:"
tar czvf $DB_BACKUP1.tar.gz $DB_FILE1.sql

echo "dump $DB_FILE1.sql fitxategia ezabatzen"
rm $DB_FILE1.sql

echo ""
echo "---"
echo ""

#echo "FTP-ra igo"
#lftp -u $FTP_USER,$FTP_PASSW -e "cd backup;
#mput $DB_BK_FOLDER$DB_FILE1.tar.gz; quit" $FTP_SERVER
echo ""
echo "Amaitu da."
