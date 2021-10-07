import { LightningElement, track, wire } from 'lwc';
import displayConRecords from '@salesforce/apex/AccountDemoController.displayConRecords';

export default class ContactP extends LightningElement {

    @track accountId;
    @track records;
    @track error;
    @wire(displayConRecords,{accId:'$accountId'})
    wiredcondata({error,data}){
        if(data){
            this.records=data;
            this.error=undefined;
        } else {
            this.records=undefined;
            this.error=error;
        }
    }
    handlechange(event){
        this.accountId=event.detail;
        console.log(event.detail);
    }
}