# backup current brightness
python -c "print(\"$(ddcutil getvcp 10 -d 1)\".split(\"=\")[1].split(\",\")[0])" >> /tmp/brightness-d1.txt
python -c "print(\"$(ddcutil getvcp 10 -d 2)\".split(\"=\")[1].split(\",\")[0])" >> /tmp/brightness-d2.txt

ddcutil setvcp 10 0 -d 1
ddcutil setvcp 10 10 -d 2
