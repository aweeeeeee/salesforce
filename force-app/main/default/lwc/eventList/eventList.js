import { LightningElement, track } from 'lwc';
import upcomingEvents from '@salesforce/apex/EventDetailsService.upcomingEvents';
const columns = [
    {
        label: 'View',
        fieldName: 'URL',
        type: 'url',
        wrapText: 'true',
        typeAttributes: {
            label: {
                fieldName: 'Name__c'
            }
        }
    },
    {   label: 'Name',
        fieldName: 'Name__c',
        cellAttributes: {
            iconName: 'standard:event',
            iconPosition: 'left'
        } 
    },
    {   label: 'Name',
        fieldName: 'EVNT_ORG',
        cellAttributes: {
            iconName: 'standard:user',
            iconPosition: 'left'
        } 
    },
    { label: 'Location', fieldName: 'Location' , type: 'text',
        cellAttributes: {
            iconName: 'utility:location',
            iconPosition: 'left'
        }  
    },
    { label: 'Details', fieldName: 'Event_Detail__c' , type: 'text', wrapText:true }
];

export default class EventList extends LightningElement {
    columnsList = columns;
    error;
    @track result;
    
        connectedCallback(){
            this.upcomingEventsFromApex();
        }

        upcomingEventsFromApex(){
            upcomingEvents()
            .then((data) => {
                data.forEach(event => {
                    event.URL = 'https://' + location.host + '/'+event.Id;
                    event.EVNT_ORG = event.Event_Organizer__r.Name;
                    if(event.Location__c){
                        event.Location = event.Location__r.Name;
                    } else { 
                        event.Location = 'this is virtual event';
                    }
                });
                this.result = data;
                this.error = undefined;
            }).catch((err) => {
                this.error = JSON.stringify(err);
                this.result = undefined;
            });

        }
    
}