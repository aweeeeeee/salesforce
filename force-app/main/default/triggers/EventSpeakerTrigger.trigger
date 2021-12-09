trigger EventSpeakerTrigger on EventSpeakers__c (before insert, before update) {
    // event
    // step 1 = get the speaker id and event id
    // step 2 - soql on event to get the start date and put them into map
    // step 3 - soql on event speaker to get the related speaker along witht he event start date
    // step 4 - check the conditions and show the error

    //step 1 -start
    Set<Id> speakerIdsSet = new Set<Id>();
    Set<Id> eventIdsSet = new Set<Id>();

    for( EventSpeakers__C es : Trigger.New){
        speakerIdsSet.add(es.Speaker__c);
        eventIdsSEt.add(es.Event__c);
    }

    Map<Id, DateTime> requestedEvents = new Map<Id, DateTime>();

    List<Event__c> relatedEventsList = [Select Id, Start_DateTime__c From Event__c
                                        Where Id IN : eventIdsSet];
    for(Event__c evt : relatedEventsList){
        requestedEvents.put(evt.Id, evt.Start_DateTime__c);
    }

    List<EventSpeakers__c> relatedEventSpeakerList = [SELECT Id, Event__c, Speaker__c,
                                                        Event__r.Start_DateTime__c
                                                        From EventSpeakers__c
                                                        Where Speaker__c In :speakerIdsSet];
    for(EventSpeakers__c es : Trigger.New){
        DateTime bookingTime = requestedEvents.get(es.Event__c);
        for(EventSpeakers__c es1 : relatedEventSpeakerList){
            if(es1.Speaker__c == es.Speaker__c && es1.Event__r.Start_DateTime__c == bookingTime){
                es.Speaker__c.addError('the speaker is already booked at that time');
                es.addError('the speaker is already booked at that time');
            }
        }
    }
}