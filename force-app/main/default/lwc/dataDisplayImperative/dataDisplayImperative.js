import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/awe.getAccountRecordList';

export default class DataDisplayImperative extends LightningElement {
    @track accountRecords;
    @track errors;
    @track columns  = [{Label:'Name',fieldName: 'Name', type:'text'},
                       {Label:'Industry',fieldName: 'Industry', type:'text'},];

    connectedCallback(){
        getAccounts()
            .then(result=>{
                this.accountRecords  = result;
            })
            .catch(errors=>{
                    this.errors = undefined;
            });
    }

}