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
> geth --datadir /home/eth/data --nodiscover --rpc --rpcapi "web3,eth,personal,miner" --rpccorsdomain "*"  --rpcaddr 0.0.0.0 --rpcport 8545 --networkid 10 --dev.period 10 console

创建新账户
> personal.newAccount()
这里密码123456
这里创建地址0xbb8110cb7a88235d243e8f1f0e5fe0b3aae86cb8


设置挖矿Coinbase账户
> miner.setEtherbase("0xbb8110cb7a88235d243e8f1f0e5fe0b3aae86cb8")

开始挖矿
> miner.start()

等待Generating DAG in progress完成percentage=100 

退出
> exit

把密码写到本地文件
```
vi /home/eth/password
123456
wq
```


后台启动
> nohup geth --datadir /home/eth/data --port 30010 --nodiscover --unlock '0' --password /home/eth/password --rpc --rpcaddr 192.168.1.70 --rpcport 18545 --rpcapi "personal,db,eth,net,web3,mine,miner" --rpccorsdomain "*" --cache=2048 --maxpeers 100  --mine --dev.period 10 >/home/eth/debug.log &


### METAMASK轻钱包
点击链接：https://github.com/MetaMask/metamask-extension/releases  
STEP 2 点击 “Assets” 列表下的 “metamask-chrome-4.4.0.zip” (或你看到的最新版), 下载并解压此压缩包  
用谷歌浏览器 (Chrome) 打开链接：chrome://extensions  
选择 "加载已解压的扩展程序” (Load unpacked extension)，在跳出菜单中选择刚才解压的文件包  
网页将跳转到新的页面，选择 “Get Chrome Extension"  
执行上述步骤后，浏览器右上角将出现一个新图标（MetaMask 狐狸插件图标）, 成功安装 MetaMask 钱包。  
  
### 连接私链网络
点击MetaMask 右上角网络, 自定义RPC
填写表单
RPCURL=http://192.168.1.70:18545
ChainID=11

## OMNI私链
下载钱包
> wget https://github.com/OmniLayer/omnicore/releases/download/v0.6.0/omnicore-0.6.0-x86_64-linux-gnu.tar.gz
> tar -xzvf omnicore-0.6.0-x86_64-linux-gnu.tar.gz
> cd omnicore-0.6.0-x86_64-linux-gnu.tar.gz/bin
> ln -s omnicored /usr/bin/
> ln -s omnicore-cli /usr/bin/
配置
> mkdir -p /home/omni/data/
> mv omni.conf /home/omni/
启动脚本
> mv start.sh /home/omni/
> chmod +x /home/omni/start.sh
> /home/omni/start.sh
omni-client脚本
> mv cli.sh /home/omni/
> chmod +x /home/omni/cli.sh
> /home/omni/cli.sh help


