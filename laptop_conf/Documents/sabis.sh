#!/bin/bash

# head --bytes -6	will output everything except the last six.
# cut -c 105-		will cut the first 105 characters.
# sed -n '5p'		will print the fifth line of output


while true; do

read -p "Sabis? (y/n) " yn

case $yn in
	[yY] ) echo fetching menu;
	curl -s https://www.sabis.se/restauranger-cafeer/vara-publika-restauranger/brasserie-sabis-solna/ > temp.txt
	read -p "Enter day (ex: Tisdag): " DAY
	sed -i 's/M&#229;ndag/Måndag/g' temp.txt

	echo "One: $(grep -A11 $DAY temp.txt | sed -n '5p' | cut -c 105- | head --bytes -6)"
	echo "Two: $(grep -A11 $DAY temp.txt | sed -n '11p' | cut -c 105- | head --bytes -6)"
	rm temp.txt
		break;;
	[nN] )
		toilet "no food I cri" --rainbow
		exit;;
	* ) echo invalid response;;
esac

done
