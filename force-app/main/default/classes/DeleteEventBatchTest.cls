@isTest
public with sharing class DeleteEventBatchTest {
    
    @TestSetup
    public static void testSetupData(){
        
        Event_Organizer__c org = new Event_Organizer__c(
            Name = 'Awe',
            Phone__c = '123123',
            Email__c = 'awe@yahoo.com',
            Alternative_Phone__c = '123123',
            Alternative_Email__c = 'awe@yahoo.com'
        );

        insert org;

        List<Event__c> eventList = new List<Event__c>();
        for(Integer i=0; i<=100; i++){
            Event__c event = new Event__c(
                Name__c = 'awe' +i+1,
                Event_organizer__c = org.id,
                Event_type__c = 'virtual',
                Frequency__c = 'Weekly',
                Max_Seats__c = 199,
                Recurring__c = true,
                Live__c = true,
                Start_DateTime__c = System.now().addMonths(-4),
                End_Date_Time__c = System.now().addDays(3).addMonths(-4)
            );
            eventList.add(event);
        }

        insert eventList;

    }
    @isTest
    static void sendDeleteEventTest(){
        Test.startTest();
        String jobId = Database.executeBatch(new DeleteEventBatch(), 250);
        Test.stopTest();
    }
}
