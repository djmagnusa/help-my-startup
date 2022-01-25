# Help My Startup

A blockchain fundraiser app allowing people to post their project or startup
ideas and get investments for it promising to give some kind of reward later to
the contributors. A contribution is considered valid only if it is approved by enough 
number of contributors from the same campaign.

All the transactions are done in terms of Ethereum using the [metamask extension](https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=en)

### 1. Clone the project 

```sh
$ git clone https://github.com/djmagnusa/help-my-startup.git
$ cd help-my-startup
```
### 2. Install the modules required for the project 

```sh
$ npm install
$ npm install --save solc ganache-cli web3 mocha
```

### 3. Run the test file 

```sh
$ node ./ethereum/compile.js
$ npm test
```

### 4. Deploy the Contract to Rinkeby Test Network
 - Create a project in the infura and store the endpoint for rinkeby network
 - Install the following packages(if not present)

 ```sh
$ npm install –-save truffle-hdwallet-provider@0.0.3
$ npm install -- save dotenv
```
 - Write your 12 word mnemonic provided by metamask in ```ACCOUNT_MNEMONIC``` in .env file present in ethereum folder
 - Write the rinkeby test network link in ```RINKEBY_ENDPOINT``` in the same .env file
 - Run ```node deploy.js``` 

 ### 5. Run the application
 After running ```node deploy.js``` , a message in the conosole will be shown saying "Contract Deployed to <yourCampaignAddress>"
 
 Update <yourCampaignAddress> in factory.js 
 
 Update the infura address on web3.js
 
 Run the command ```npm run dev``` to see your application live on http://localhost:3000/ 
 

 