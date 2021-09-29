import { 
    LightningElement , api
} from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class CurrentDateTime extends LightningElement {
    @api tdate;
    tdate = new Date().toDateString();

    accountObject = ACCOUNT_OBJECT;

    handleFormSubmitted(event){
        
    }
}