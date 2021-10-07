import { LightningElement, wire } from 'lwc';
import dipslayAcctRecords from '@salesforce/apex/AccountDemoController.dipslayAcctRecords';
export default class Contact extends LightningElement {

    @wire(dipslayAcctRecords) accounts;
    accountId;
    handleClick(event){
        this.accountId=event.target.value;
        const sampledemoevent=new CustomEvent('samplevent',{
            detail:this.accountId
        });

        this.dispatchEvent(sampledemoevent);
        console.log(sampledemoevent);
    }

}