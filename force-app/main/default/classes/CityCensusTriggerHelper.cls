public class CityCensusTriggerHelper  {

    public static void initCensus(List<City_Census__c> censusList) {

        String Que = 'Queue';
        String CityVal = censusList[0].City__c;
        String City;
        
        List<Approval_Mapping__mdt> apprvMap = new List<Approval_Mapping__mdt>([Select MasterLabel,label,DeveloperName,City__c from Approval_Mapping__mdt]);
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
    public static void checkCensusName(List<City_Census__c> censusList) {

        List<City_Census__c> checkcensusList = [SELECT Id, Name FROM City_Census__c];

        for(City_Census__c c : censusList){
           
            for(City_Census__c cc :checkcensusList) {
                if(c.Name == cc.Name ) {
                    c.Name.addError('Name Already exist');
                }
            }
        }
    }

    public static void insertCensus(List<City_Census__c> censusList) {

        for(City_Census__c c : censusList){
           
            if( c.Name.isNumeric() ) {
                c.Name.addError('You can Input Letters Only');
            }

            c.Approval_Status__c = c.Auto_Approve__c == TRUE 
                                        ? 'Approved' : 'For Approval';

          
        }

    }

    public static void updateCensus(List<City_Census__c> censusList,List<City_Census__c> oldcensusList ) {

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

        List<Contact> checkCity = [SELECT FirstName, LastName, City__c 
                                            FROM Contact];

        List<Resident__c> residentRec = new List<Resident__c>();

        String retrieveCity = retrieveCensus[0].City__c;
        String CityCensusId = retrieveCensus[0].Id;

        for(Contact b : checkCity){
            if(retrieveCity == b.City__c){

                Resident__c r = new Resident__c();
                r.First_Name__c = b.FirstName;
                r.Last_Name__c = b.LastName;
                r.City__c = b.City__c;
                r.City_Census__c = CityCensusId;
                residentRec.add(r);
                System.debug('sucess');
    
            }
            
        }
        insert residentRec;
        /**
         * Resident__c[] doomedAccts = [SELECT Id, Name FROM Resident__c 
                         WHERE City__c = 'Las Pinas']; 
            try {
                delete doomedAccts;
            } catch (DmlException e) {
                // Process exception here
            }
         */
    }
}