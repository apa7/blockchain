# blockchain
BTC/ETH/OMNI公链/私链配置


## BTC私链
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
> bitcoind -conf=/home/btc/bitcoin.conf -rpcport=18332 -rpcbind=192.168.1.70


测试
> curl --user user:password --data-binary '{"jsonrpc":"1.0", "id":"curltest", "method":"getbalance"}' -H 'content-type: text/plain;' http://192.168.1.70:18332/


## ETH私链
genesis.json
```json
{
    "config": {
        "chainId": 10, 
        "homesteadBlock": 0, 
        "eip155Block": 0, 
        "eip158Block": 0
    }, 
    "coinbase": "0x0000000000000000000000000000000000000000", 
    "difficulty": "0x99999", 
    "extraData": "", 
    "gasLimit": "0x2fefd8", 
    "nonce": "0x0000000000000042", 
    "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000", 
    "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000", 
    "timestamp": "0x00", 
    "alloc": { }
}
```

初始化
> geth --datadir /home/eth/data init genesis.json

启动
> geth --datadir /home/eth/data --nodiscover --rpc --rpcapi "web3,eth,personal,miner" --rpccorsdomain "*"  --rpcaddr 0.0.0.0 --rpcport 8545 --networkid 10 console

创建新账户
> personal.newAccount()
假设密码输123456

设置挖矿Coinbase账户
> miner.setCoinbase()

开始挖矿
> miner.start()

退出
> exit

把密码写到本地文件
```
vi /home/eth/password
123456
wq
```


后台启动
> nohup geth --datadir /home/eth/data --port 30010 --nodiscover --unlock '0' --password /home/eth/password --rpc --rpcaddr 192.168.1.70 --rpcport 18545 --rpcapi personal,db,eth,net,web3,mine --rpccorsdomain "*" --cache=2048 --maxpeers 100  --mine >/home/eth/debug.log &





