#Web zerbitzarien segurtasun kopiak egiteko script-ak

Segurtasun kopiak "/backup" karpetan egingo dira.

#####backup-mysql.sh
Mysqldump erabiliz mysql datu baseak fitxategi batetara exportatuko dira, "/backup/mysql" karpetara mugitu eta FTP bidez zerbitzaritik kanpora atera.

#####backup-web.sh
"/var/www" karpeta bakoitza konprimitu eta "/backup/www" karpetara mugituko du

#####backup-ezabatu.sh 
"/backup" karpetako fintxategietan bilaketa bat burutuko du eta hauek 60 egun baina zaharragoak badira ezabatu egingo ditu.


##### Tareak programatu
"crontab -e" aginduaren bidez, gauero exekutatzeko programatuko ditugu horrela:

	0 2 * * * /root/backup-mysql.sh > /var/log/backup-mysql.log
	0 3 * * * /root/backup-web.sh > /var/log/backup-web.log
	0 5 * * * /root/backup-ezabatu.sh >/var/log/backup-ezabatu.log