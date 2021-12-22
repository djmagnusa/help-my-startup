import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
    JSON.parse(CampaignFactory.interface),
    '0x253CB3C687Ee9071928Ab773351A3e4d4C2aCAf9'
);

export default instance;