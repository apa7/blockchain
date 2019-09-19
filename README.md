# blockchain
BTC/ETH/OMNI公链/私链配置

bitcoin.conf
```
#regtest测试网络
regtest=1 

datadir=/home/btc/

port=18331
#rpc端口
rpcport=18332
#允许ip
rpcallowip=192.168.1.0/255.255.255.0
rpcuser=user
rpcpassword=password
server=1
listen=1 
daemon=1 
txindex=1

deprecatedrpc=generate
gen=1
```

启动
```
bitcoind -conf=/home/btc/bitcoin.conf -rpcport=18332 -rpcbind=192.168.1.70
```

测试
```
curl --user user:password --data-binary '{"jsonrpc":"1.0", "id":"curltest", "method":"getbalance"}' -H 'content-type: text/plain;' http://192.168.1.70:18332/
```
