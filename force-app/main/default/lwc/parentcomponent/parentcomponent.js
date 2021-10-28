import { LightningElement, track } from 'lwc';

export default class Parentcomponent extends LightningElement {
    @track message;
    @track messageFromChild;
    SendDatatoChild(event){
        this.message = 'message from parent';
    }
    handlechildMessage(event){
        this.messageFromChild = event.detail;
    }
}