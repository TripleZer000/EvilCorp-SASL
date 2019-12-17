#!/bin/bash
 
echo "N=fsociety
I=YourNicknameGoesHere
i=YourNicknameGoesHere_
U=YourUsernameGoesHere
R=realname
L=10
E=UTF-8 (Unicode)
F=116
D=0
S=irc.evilcorp.ga/+6697
J=#lobby" >> ~/.config/hexchat/servlist.conf
 
## Install necesarry dependencies
sudo apt install openssl --no-install-recommends -y
 
## Create cert dir
mkdir -p ~/.config/hexchat/certs
 
## Create fsociety cert
sudo openssl req -x509 -sha512 -nodes -days 365 -newkey rsa:4096 -keyout ~/.config/hexchat/certs/fsocietySASL.pem -out ~/.config/hexchat/certs/fsocietySASL.pem
  
## Edit fsociety cert
sudo openssl x509 -in ~/.config/hexchat/certs/client.pem -outform der | sha1sum -b | cut -d \  -f1
 
## Finish
echo "Launch HexChat, connect to fsociety, identify your nick, then  identify with /MGS NickServ CERT ADD (paste the string that is above here)."
