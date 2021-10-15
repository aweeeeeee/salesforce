import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/awe.getAccounts';
export default class WelcomeComp extends LightningElement {
    welcomeMsg = 'welcome';
    @track greetings;

    handleGreetingsChanges(event){
        this.greetings = event.target.value;
    }

    firstNumber = 0;
    secondNumber = 0;
    @track result = 0;

    handleChanges(event){
        if(event.target.name=='fnumber'){
            this.firstNumber = event.target.value;
        }

        if(event.target.name=='snumber'){
            this.secondNumber = event.target.value;
        }

        this.result = parseInt(this.firstNumber) + parseInt(this.secondNumber);
    }

    @track data;
    @wire(getAccounts) accountRecords({error,data}){
        if(data){
            this.data = data;
        }else {
            this.data = undefined;
        }
    }
}