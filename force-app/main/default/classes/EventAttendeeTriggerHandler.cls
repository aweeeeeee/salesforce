public class EventAttendeeTriggerHandler {
    
    public static void sendConfirmationEmail(List<Event_Attendee__c> newRecordList){
        Set<Id> attendeesIdsSet = new Set<Id>();
        Set<Id> eventIdsSet = new Set<Id>();

        for(Event_Attendee__c ea : newRecordList){
            attendeesIdsSet.add(ea.Attendee__c);
            eventIdsSet.add(ea.Event__c);
        }
        Map<Id, Attendee__c> attendeeMap = new Map<Id, Attendee__c>(
            [Select Id, Name, Email__c From Attendee__c WHERE Id IN : attendeesIdsSet]
        );

        Map<Id, Event__c> eventMap = new Map<Id, Event__c>( [Select Id, Start_DateTime__c, Event_Organizer__c, Event_Organizer__r.Name,
                                Location__c, Location__r.Name, Location__r.City__c,
                                Location__r.State__c, Location__r.Country__c,
                                Location__r.Postal_Code__c, Location__r.Street__c
                                FROM Event__c WHERE ID IN : eventIdsSet]);

        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

        for(Event_Attendee__c ea: newRecordList){
            System.debug('awe');
            Attendee__c att = attendeeMap.get(ea.Attendee__c);
            Event__c evt = eventMap.get(ea.Event__c);

            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

            mail.setSubject('pas for the'+evt.Name__c);
            List<String> toAddress = new List<String>();
            toAddress.add(att.Email__c);
            mail.setToAddresses( toAddress );
            mail.setSenderDisplayName(evt.Event_Organizer__r.Name);

            String emailBody = 'Dear ' +att.Name + ' , ' +
                        'ty for reg for ' +evt.Name__c+ 'which organised on' +evt.Start_DateTime__c+ 'will held on' +evt.Location__r.Name + 'thanks <br/>' +evt.Event_Organizer__r.Name;

            mail.setHtmlBody(EmailBody);
            emailList.add(mail);
        }

        try{
            List<Messaging.SendEmailResult> results = Messaging.sendEmail(emailList, false);
            System.debug('awe22');
            for(Messaging.SendEmailResult email : results){
                System.debug('awe2');
                System.debug(email.isSuccess());
                if(!email.isSuccess()){
                    List<Messaging.SendEmailError> errors = email.getErrors();
                    TransactionLogHandler.doHandleExceptionWithError(JSON.serialize(errors), 'EventAttendeeTriggerHandler');
                }
            }
        }catch(System.Exception ex){
            TransactionLogHandler.doHandleException(ex, 'EventAttendeeTriggerHandler');
        }
    }
}
