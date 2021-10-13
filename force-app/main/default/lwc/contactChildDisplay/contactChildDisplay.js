import { LightningElement, wire } from 'lwc';
import dipslayAcctRecords from '@salesforce/apex/AccountDemoController.dipslayAcctRecords';
export default class ContactChildDisplay extends LightningElement {

    @wire(dipslayAcctRecords) accounts;
    accountId;
    handleClick(event){
        this.accountId = event.target.value;
        const sampledempevent = new CustomEvent('samplevent',{
            detail:this.accountId
        });
        this.dispatchEven(sampledempevent);
    }

}