#!/bin/bash
echo "Web aplikazioen karpeten segurtasun kopia /var/www"
echo "Konprimituak /backup/www karpetan gordeko dira"
echo ""

cd /var/www

for f in */; 
do 

KARPETA=$f
echo "Karpeta: $KARPETA"
KONPRIMITUA=${f%/}-$(date +%Y-%m-%d-%H-%M-%S).tar.gz 
echo "Konprimitua: $KONPRIMITUA"
NORA=/backup/www/$KONPRIMITUA
echo "Nora: $NORA"

tar czf $KONPRIMITUA $KARPETA
mv $KONPRIMITUA $NORA

done

