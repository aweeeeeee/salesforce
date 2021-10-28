import { LightningElement, api } from 'lwc';

export default class Childcomponent extends LightningElement {
    @api textMessage;
    sendMessagetoParent(event){
        const sendMessageFromChild = new CustomEvent('childmessage', {detail: 'hi i am child'});
        this.dispatchEvent(sendMessageFromChild);
    }
}