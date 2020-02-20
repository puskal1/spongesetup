#------- Sub Domain Scraping -------

crtsh(){
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g'
}

assetfinder-init(){
assetfinder -subs-only $1 | sed 's/\*\.//g'
}

amass-init(){
amass enum -passive -d $1
}

subfinder-init(){
subfinder -d $1 -silent
}

dnsscrape(){
mkdir ./$1;
crtsh $1 | tee ./$1/crtsh.txt;
assetfinder-init $1 | tee ./$1/crtsh.txt;
amass-init $1 | tee ./$1/assetfinder.txt;
subfinder-init $1 | tee ./$1/subfinder.txt;
cat ./$1/* | sort -u | httprobe >> ./$1/domains.txt;
rm ./$1/crtsh.txt ./$1/assetfinder.txt ./$1/amass.txt ./$1/subfinder.txt;
#python3 /opt/EyeWitness/EyeWitness.py -f ./domains.txt --web
}


