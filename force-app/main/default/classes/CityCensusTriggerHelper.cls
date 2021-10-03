public class CityCensusTriggerHelper  {
    public static void insertCensus(List<City_Census__c> censusList) {

        
        String Que = 'Queue';
        String CityVal = censusList[0].City__c;
        String CityName = censusList[0].Name;

        String City = CityVal == 'Makati' 
                            ? 'Makati City Approvers' 
                                : CityVal == 'Las Pinas' ? 'Las Pinas City Approvers'
                                    : 'Taguig City Approvers';

        Group assignQue = Database.query(' SELECT Id, Name FROM Group WHERE Type= :Que AND Name = :City ');
        
        for(City_Census__c c : censusList){
            if( c.Name.isNumeric() || c.Name.isAlpha() == FALSE || c.Name == null ){
                    
                c.Name.addError('You can Input Letters Only');
                
            }

            /**if( c.Approve_By__c.isNumeric() || c.Approve_By__c.isAlpha() == FALSE ){
                    
                    c.Approve_By__c.addError('You can Input Letters Only');
                    
            } **/
            
            /**if (c.Approval_Status__c == 'For Approval') {
                c.Auto_Approve__c = FALSE;
            }**/


            c.Approval_Status__c = c.Auto_Approve__c == TRUE 
                                        ? 'Approved' : 'For Approval';

            c.ownerId = assignQue.Id;

        }

    }

    public static void updateCensus(List<City_Census__c> censusList,List<City_Census__c> oldcensusList ) {

        /**List<City_Census__c> newCensus = [SELECT Id, Auto_Approve__c FROM City_Census__c WHERe Id IN:Trigger.old]; 
        
        String statusVal = censusList[0].Approval_Status__c;


        if (statusVal != 'Approved') {
                //newCensus.Auto_Approve__c = FALSE;
                System.debug('bb');
                //System.debug(cc.Approval_Status__c);
               
        } else {
                System.debug('aaa');
             
        }
        **/
        /**String awe;
        for (City_Census__c ccc: oldcensusList ) {
                awe = ccc.Approval_Status__c;
                System.debug(awe);
        }**/
        
        String statusVal = oldcensusList[0].Approval_Status__c;
        System.debug(statusVal);

        for (City_Census__c cc: censusList ) {
            if(statusVal == 'For Approval' && cc.Auto_Approve__c == TRUE) {
                cc.Auto_Approve__c = FALSE;
                cc.Approval_Status__c = cc.Approval_Status__c;
            } else if(cc.Approval_Status__c == 'For Approval' && cc.Auto_Approve__c == TRUE) {
                cc.Auto_Approve__c = FALSE;
                cc.Approval_Status__c = cc.Approval_Status__c;
            } else {
                cc.Auto_Approve__c = cc.Auto_Approve__c;
                cc.Approval_Status__c = cc.Approval_Status__c;
                
            } 

            
    
        }
    }
}
