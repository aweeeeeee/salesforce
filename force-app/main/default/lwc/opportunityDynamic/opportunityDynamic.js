import { LightningElement, api, wire } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityData.getOpportunities';
export default class OpportunityDynamic extends LightningElement {
    @api recordId;
    //@wire(getOpportunities,{ accId: '$recordId' })
    //opportunities;

    @wire(getOpportunities) opportunities;
}