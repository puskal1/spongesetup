#------- TLD Lookup -------

bgp(){
  #With results from https://bgp.he.net/search?search%5Bsearch%5D=yahoo&commit=Search
  expand $1 | cut -d " " -f1 | sed 's/AS//g'
  echo ""
  echo ""
  lined=`expand $1 | cut -d " " -f1 | sed 's/AS//g'| tr '\n' ','`
  echo "amass intel -asn $lined"
  echo "for i in $(cat yahoobgp); do echo""; echo "ASN $i";echo ""; amass intel -asn $i;echo ""; done"
}

asnlookup(){

echo "lol"
}

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
}

#------- Content Discovery -------

arjun-init(){
arjun -u "$1" --get -f ~/bugBountys/wordlists/web/parameters/parameters.txt -t 50 -o ./arjun.txt
}

fuff-recursive(){
fuff -recursion -u $1/FUZZ -w ~/wordlists/
}


#dirsearch-quickhits(){
#dirsearch -u $1 -b -e $2 -t 50 --wordlist=~/bugBountys/wordlists/quickhits.txt -r --plain-text-report=dirsearch-quickhits.txt
#}

#dirsearch-directories(){
#dirsearch -u $1 -b -e -t 50 --wordlist=~/bugBountys/wordlists/web/content_discovery_all.txt -r --plain-text-report=dirsearch-all.txt
#}

#dirsearch-api(){
#dirsearch -u $1 -b -e json -t 50 --wordlist=/home/nulinc/bugBountys/wordlists/web/content_discovery_all.txt -r --plain-text-report=dirsearch-all.txt
#}

waybackurl-init(){
cat $1 | waybackurls
}

waybackrobots(){
python3 /opt/scripts/recon/waybackrobots.py $1
}

wayback-all(){
echo "$1" | waybackurls
}

wayback-js(){
echo "$1" | waybackurls | grep -E "(.*).js"
}

git-dork(){
echo ""
echo "************ Github Dork Links (must be logged in) *******************"
echo ""
echo "  password"
echo "https://github.com/search?q=%22$1%22+password&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+password&type=Code"
echo ""
echo " npmrc _auth"
echo "https://github.com/search?q=%22$1%22+npmrc%20_auth&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+npmrc%20_auth&type=Code"
echo ""
echo " dockercfg"
echo "https://github.com/search?q=%22$1%22+dockercfg&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+dockercfg&type=Code"
echo ""
echo " pem private"
echo "https://github.com/search?q=%22$1%22+pem%20private&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+extension:pem%20private&type=Code"
echo ""
echo "  id_rsa"
echo "https://github.com/search?q=%22$1%22+id_rsa&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+id_rsa&type=Code"
echo ""
echo " aws_access_key_id"
echo "https://github.com/search?q=%22$1%22+aws_access_key_id&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+aws_access_key_id&type=Code"
echo ""
echo " s3cfg"
echo "https://github.com/search?q=%22$1%22+s3cfg&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+s3cfg&type=Code"
echo ""
echo " htpasswd"
echo "https://github.com/search?q=%22$1%22+htpasswd&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+htpasswd&type=Code"
echo ""
echo " git-credentials"
echo "https://github.com/search?q=%22$1%22+git-credentials&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+git-credentials&type=Code"
echo ""
echo " bashrc password"
echo "https://github.com/search?q=%22$1%22+bashrc%20password&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+bashrc%20password&type=Code"
echo ""
echo " sshd_config"
echo "https://github.com/search?q=%22$1%22+sshd_config&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+sshd_config&type=Code"
echo ""
echo " xoxp OR xoxb OR xoxa"
echo "https://github.com/search?q=%22$1%22+xoxp%20OR%20xoxb%20OR%20xoxa&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+xoxp%20OR%20xoxb&type=Code"
echo ""
echo " SECRET_KEY"
echo "https://github.com/search?q=%22$1%22+SECRET_KEY&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+SECRET_KEY&type=Code"
echo ""
echo " client_secret"
echo "https://github.com/search?q=%22$1%22+client_secret&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+client_secret&type=Code"
echo ""
echo " sshd_config"
echo "https://github.com/search?q=%22$1%22+sshd_config&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+sshd_config&type=Code"
echo ""
echo " github_token"
echo "https://github.com/search?q=%22$1%22+github_token&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+github_token&type=Code"
echo ""
echo " api_key"
echo "https://github.com/search?q=%22$1%22+api_key&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+api_key&type=Code"
echo ""
echo " FTP"
echo "https://github.com/search?q=%22$1%22+FTP&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+FTP&type=Code"
echo ""
echo " app_secret"
echo "https://github.com/search?q=%22$1%22+app_secret&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+app_secret&type=Code"
echo ""
echo "  passwd"
echo "https://github.com/search?q=%22$1%22+passwd&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+passwd&type=Code"
echo ""
echo " s3.yml"
echo "https://github.com/search?q=%22$1%22+.env&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+.env&type=Code"
echo ""
echo " .exs"
echo "https://github.com/search?q=%22$1%22+.exs&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+.exs&type=Code"
echo ""
echo " beanstalkd.yml"
echo "https://github.com/search?q=%22$1%22+beanstalkd.yml&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+beanstalkd.yml&type=Code"
echo ""
echo " deploy.rake"
echo "https://github.com/search?q=%22$1%22+deploy.rake&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+deploy.rake&type=Code"
echo ""
echo " mysql"
echo "https://github.com/search?q=%22$1%22+mysql&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+mysql&type=Code"
echo ""
echo " credentials"
echo "https://github.com/search?q=%22$1%22+credentials&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+credentials&type=Code"
echo ""
echo " PWD"
echo "https://github.com/search?q=%22$1%22+PWD&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+PWD&type=Code"
echo ""
echo " deploy.rake"
echo "https://github.com/search?q=%22$1%22+deploy.rake&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+deploy.rake&type=Code"
echo ""
echo " .bash_history"
echo "https://github.com/search?q=%22$1%22+.bash_history&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+.bash_history&type=Code"
echo ""
echo " .sls"
echo "https://github.com/search?q=%22$1%22+.sls&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+PWD&type=Code"
echo ""
echo " secrets"
echo "https://github.com/search?q=%22$1%22+secrets&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+secrets&type=Code"
echo ""
echo " composer.json"
echo "https://github.com/search?q=%22$1%22+composer.json&type=Code"
echo "https://github.com/search?q=%22$without_suffix%22+composer.json&type=Code"
echo ""
}

profile(){
vim ~/.bash_aliases
source ~/.bash_aliases
}
