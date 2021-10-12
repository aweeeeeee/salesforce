public class CityCensusTriggerHelper  {

    public static void initCensus(List<City_Census__c> censusList) {

        String Que = 'Queue';
        String CityVal = censusList[0].City__c;
        String CityName = censusList[0].Name;
        
        //Select MasterLabel,label,DeveloperName from Approval_Mapping__mdt
        //select Id, Name, DeveloperName from Group where Type = 'Queue'
        /**
         * Map<String, Approval_Mapping__mdt> mapEd = Approval_Mapping__mdt.getAll();
            for(String name : mapEd.keySet()){
                System.debug(mapEd.get(name).label);
            }
         * 
         */
        String City = CityVal == 'Makati' 
                            ? 'Makati City Approvers' 
                                : CityVal == 'Las Pinas' ? 'Las Pinas City Approvers'
                                    : 'Taguig City Approvers';

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
           
            //if( c.Name.isNumeric() || c.Name.isAlpha() == TRUE || c.Name == null ){
            if( c.Name.isNumeric() ) {
                c.Name.addError('You can Input Letters Only');
            }

            /**if( c.Approve_By__c.isNumeric() || c.Approve_By__c.isAlpha() == FALSE ){
                    
                    c.Approve_By__c.addError('You can Input Letters Only');
                    
            } **/

            c.Approval_Status__c = c.Auto_Approve__c == TRUE 
                                        ? 'Approved' : 'For Approval';

          
        }

    }

    public static void updateCensus(List<City_Census__c> censusList,List<City_Census__c> oldcensusList ) {
        
        //String statusVal = oldcensusList[0].Approval_Status__c;

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

    public static void retrieveRecord(List<City_Census__c> retriveRec){
        /**List<Contact> retCon = new List<Contact>();

        for(Contact c : [SELECT FirstName, 
                                LastName,
                                SA
                                FROM Contact ]){
                c.FirstName = c.FirstName;
                c.LastName = c.LastName;
                **/
        }

    }
}
