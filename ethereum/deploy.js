require("dotenv").config()


const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const compiledFactory = require('./build/CampaignFactory.json');

const mnemonicPhrase = process.env.ACCOUNT_MNEMONIC;
const network = process.env.RINKEBY_ENDPOINT;

const provider = new HDWalletProvider(
    mnemonicPhrase,
    network
);

const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();

    console.log('Attempting to deploy from account', accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(compiledFactory.interface)) //iterface is the ABI
      .deploy({ data: '0x' + compiledFactory.bytecode })
      .send({ gas: '5000000', from: accounts[0] });

    //console.log(interface);
    console.log('Contract deployed to', result.options.address);
};

deploy();
