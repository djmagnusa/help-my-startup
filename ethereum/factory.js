import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
    JSON.parse(CampaignFactory.interface),
    '0x1bA5BD1e8136eF60C731b2B099eE4De02A712aFF'
);

export default instance;