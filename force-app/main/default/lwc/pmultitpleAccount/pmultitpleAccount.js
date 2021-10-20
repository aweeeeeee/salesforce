import { LightningElement, track } from 'lwc';
import saveAccount from '@salesforce/apex/AccountCreationController.createAccounts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class PmultitpleAccount extends LightningElement {
    @track keyIndex = 0;
    @track accountRecList = [
        {
            Name: '',
            Industry: '',
            Phone: ''
        }
    ];

    addRow(){
        this.keyIndex+1;
        this.accountRecList.push({
            Name: '',
            Type: '',
            Phone: ''
        });
    }

    changeHandler(event){

    }

    saveMultipleAccounts(){

    }

    removeRow(event){

    }
}