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
}
