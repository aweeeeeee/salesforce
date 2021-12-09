@isTest
public with sharing class EventAttendeeTriggerTest {
    
    @TestSetup
    public static void setupData(){
        
        Event_Organizer__c org = new Event_Organizer__c(
            Name = 'Awe',
            Phone__c = '123123',
            Email__c = 'awe@yahoo.com',
            Alternative_Phone__c = '123123',
            Alternative_Email__c = 'awe@yahoo.com'
        );

        insert org;

        Event__c event = new Event__c(
            Name__c = 'awe',
            Event_organizer__c = org.id,
            Event_type__c = 'virtual',
            Frequency__c = 'Weekly',
            Max_Seats__c = 199,
            Recurring__c = true,
            Live__c = true,
            Start_DateTime__c = System.now(),
            End_Date_Time__c = System.now().addDays(3)
        );

        insert event;
        
        Attendee__c att = new Attendee__c(
            Name = 'awe',
            Email__c = 'awe@yahoo.com',
            Phone__c = '123123'
        );

        insert att;

        Event_Attendee__c evtAtt = new Event_Attendee__c(Event__c = event.Id, Attendee__c = att.Id);
        insert evtAtt;

    }
    
    @isTest
    static void sendEmailTest(){
        
    }
}
