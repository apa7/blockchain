#!/bin/bash
nohup geth --datadir /home/eth/data --port 30010 --nodiscover --unlock '0' --password /home/eth/password --rpc --rpcaddr 192.168.1.70 --rpcport 18545 --rpcapi "personal,db,eth,net,web3,mine,miner" --rpccorsdomain "*" --cache=2048 --maxpeers 100  --mine --dev.period 10 >/home/eth/debug.log &
