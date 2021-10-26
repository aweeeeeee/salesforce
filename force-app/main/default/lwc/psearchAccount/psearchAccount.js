import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountSearchlwc.getAccounts';

export default class PsearchAccount extends LightningElement {
    accountName='';
    @track accountList =[];
    @wire(getAccounts,{actName:'$accountName'})
    retrieveAccounts({error,data}){
        if(data){
            this.accountList = data;

            console.log(this.accountList);
        } else if(error) {
            console.log(error);
        }
    }

    handleKeyChange(event){
        this.accountName = event.target.value;
        console.log('test');
    }

}