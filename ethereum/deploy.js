require('dotenv').config()


const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface, bytecode } = require('./compile');

const provider = new HDWalletProvider(
    'online sleep fuel record shop rely churn skate wolf ball vivid worry',
    'https://rinkeby.infura.io/v3/f86d729ac9964a4085750eec1beaed72'
    
);

const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();

    console.log('Attempting to deploy from account', accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface)) //iterface is the ABI
      .deploy({ data: '0x' + bytecode })
      .send({ gas: '5000000', from: accounts[0] });

    console.log(interface);
    console.log('Contract deployed to', result.options.address);
};

deploy();
