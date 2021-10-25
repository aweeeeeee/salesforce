public class CityCensusTriggerHelper  {

    public static void initCensus(List<City_Census__c> censusList) {

        String Que = 'Queue';
        String CityVal = censusList[0].City__c;
        String City;
        
        List<Approval_Mapping__mdt> apprvMap = new List<Approval_Mapping__mdt>([Select MasterLabel,label,DeveloperName,City__c 
                                                                                    from Approval_Mapping__mdt]);
        for(Approval_Mapping__mdt d: apprvMap){
                    if(CityVal == d.City__c){
                            City = d.label;
                    }
        }

        Group assignQue = Database.query(' SELECT Id, Name FROM Group WHERE Type= :Que AND Name = :City ');

        for(City_Census__c cInit : censusList){
            cInit.ownerId = assignQue.Id;
        }

    }

    public static void insertCensus(List<City_Census__c> censusList) {

            censusList[0].Approval_Status__c = censusList[0].Auto_Approve__c == TRUE 
                                    ? 'Approved' : 'For Approval';
                                    

    }

    public static void updateCensus(List<City_Census__c> censusList) {

        for (City_Census__c cc: censusList ) {
             if(cc.Approval_Status__c == 'For Approval' && cc.Auto_Approve__c == TRUE) {
                cc.Auto_Approve__c = TRUE;
                cc.Approval_Status__c = 'Approved';
            } else {
                cc.Auto_Approve__c = cc.Auto_Approve__c;
                cc.Approval_Status__c = cc.Approval_Status__c;
            } 
        }
    }

    public static void retrieveRecord(List<City_Census__c> retrieveCensus){

        String retrieveCity = retrieveCensus[0].City__c;
        String CityCensusId = retrieveCensus[0].Id;
        String approveStatus = retrieveCensus[0].Approval_Status__c;
        List<Contact> checkCity = [SELECT FirstName, LastName, City__c,Salutation
                                            FROM Contact];

        List<Resident__c> residentRec = new List<Resident__c>();
        
        if(approveStatus == 'Approved') {
            for(Contact c : checkCity){
                if(retrieveCity == c.City__c){

                    Resident__c r = new Resident__c();
                    r.First_Name__c = c.FirstName;
                    r.Last_Name__c = c.LastName;
                    r.City__c = c.City__c;
                    r.City_Census__c = CityCensusId;
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