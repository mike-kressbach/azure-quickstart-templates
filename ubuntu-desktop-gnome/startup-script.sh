AZUREUSER=$1
HOMEDIR="/home/$AZUREUSER"
sudo -i -u $AZUREUSER $HOMEDIR/bin/startvnc
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports 3001
sudo iptables-save
cd $HOMEDIR/Desktop/mavin-site/mavin-enterprise
sudo forever start app.js
