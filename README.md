# docker-irssivpn

## To Build:
```
git clone https://github.com/JonathanShrek/docker-irssivpn.git
cd docker-irssivpn
docker build -t jonathanshrek/irssivpn .
```

## To Run:
```
docker run --privileged  -it \
        -v /home/triz3n/Configs/irssivpn/config/:/config \
        -e "VPN_ENABLED=yes" \
        -e "LAN_NETWORK=192.168.1.0/24" \
        -e "NAME_SERVERS=8.8.8.8,8.8.4.4" \
        jonathanshrek/irssivpn
```
