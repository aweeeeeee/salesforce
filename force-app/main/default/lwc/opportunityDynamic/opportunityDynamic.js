import { LightningElement, api, wire } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityData.getOpportunities';
import getContactList from '@salesforce/apex/OpportunityData.getContactList';

const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Title', fieldName: 'Title' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'email' }
];

export default class OpportunityDynamic extends LightningElement {
    @api recordId;
    //@wire(getOpportunities,{ accId: '$recordId' })
    //opportunities;

    error;
    columns = columns;

    @wire(getOpportunities) opportunities;

    @wire(getContactList) contacts;
}