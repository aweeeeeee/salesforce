public with sharing class SoqlExercisesThree {
    //public class PropertyUtility {
        public static void newListedProperties(){
            List<Property__c> newPropList = 
                new List<Property__c>([SELECT Name, (SELECT Email__c FROM Broker__c)
                                               FROM Property__c WHERE Date_Listed__c < LAST_N_DAYS:30]);
            System.debug(newPropList);
        }
   //}
   //trailhead SELECT Name, Email__c, (SELECT Address__c, Price__c FROM Properties__r) FROM Broker__c
}
