public class CityCensusTriggerHelper  {

    public static void initCensus(List<City_Census__c> censusList) {

        String Que = 'Queue';
        String City;
        
        List<Approval_Mapping__mdt> apprvMap = new List<Approval_Mapping__mdt>([Select MasterLabel,label,DeveloperName,City__c 
                                                                                  from Approval_Mapping__mdt]);
                                                              
        for(Approval_Mapping__mdt d : apprvMap){
                for(City_Census__c cns : censusList){
                    if(cns.City__c == d.City__c){
                        City = d.label;
                    }
                }
                    
        }

        Group assignQue = Database.query(' SELECT Id, Name FROM Group WHERE Type= :Que AND Name = :City ');

        for(City_Census__c cInit : censusList){
            cInit.ownerId = assignQue.Id;
        }

    }

    public static void insertCensus(List<City_Census__c> censusList) {
            for(City_Census__c cc : censusList){
                cc.Approval_Status__c = cc.Auto_Approve__c == TRUE 
                                    ? 'Approved' : 'For Approval';

            }
    }

    public static void retrieveRecord(List<City_Census__c> retrieveCensus){

        List<Contact> checkCity = [SELECT FirstName, LastName, City__c,Salutation
                                            FROM Contact];
        //select Id,City__c,(select First_Name__c from Resident__r) from City_census__c
        List<Resident__c> residentRec = new List<Resident__c>();
        for(City_Census__c cc: retrieveCensus){
            if(cc.Approval_Status__c == 'Approved') {
                for(Contact c : checkCity){
                    if(cc.City__c == c.City__c){

                        Resident__c r = new Resident__c();
                        r.First_Name__c = c.FirstName;
                        r.Last_Name__c = c.LastName;
                        r.City__c = c.City__c;
                        r.City_Census__c = cc.Id;
                        r.Name = c.FirstName + ' ' + c.LastName;
                        r.Record_Type__c = c.Salutation == 'Mr.'
                                                ? 'Male' : 'Female';
                        residentRec.add(r);
                    }
                    
                }
                insert residentRec;
            }
        }
    }
}