public class PropertyUtility {
    //trailhead Create Relationship Queries with Custom Objects
    public static void newListedProperties(){
        List<Property__c> newPropList = new List<Property__c>([SELECT Id, Name, Broker__r.Email__c, Days_On_Market__c from Property__c where Days_On_Market__c <=30 ]);
        for(Property__c p: newPropList){
            String PropEmail = p.Name + ':' + p.Broker__r.Email__c;
            System.debug(PropEmail);
        }
    }
}