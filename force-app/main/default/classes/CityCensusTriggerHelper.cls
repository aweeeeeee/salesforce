public class CityCensusTriggerHelper  {
    public static void insertCensus(List<City_Census__c> censusList) {

        String Que = 'Queue';
        String City;

        for(City_Census__c c : censusList){

            //c.ownerId = (c.City__c == 'Makati') ?  assignQue.id : assignQue.id;
            /**if(c.City__c == 'Makati') {
                c.ownerId = assignQue.id;
            } **/
            
            City = c.City__c == 'Makati' 
                                ? 'Makati City Approvers' 
                                    : c.City__c == 'Las Pinas' ? 'Las Pinas City Approvers'
                                            : 'Taguig City Approvers';

            if( c.Name.isNumeric() || c.Name.isAlpha() == FALSE || c.Name == null ){
                
              	c.Name.addError('You can Input Letters Only');
                
            }
            if( c.Approve_By__c.isNumeric() || c.Approve_By__c.isAlpha() == FALSE ){
                
                c.Approve_By__c.addError('You can Input Letters Only');
                
            } 
          
            
        }
        
        Group assignQue = Database.query(' SELECT Id, Name FROM Group WHERE Type= :Que AND Name = :City ');
        
        for(City_Census__c c : censusList){
            c.ownerId = assignQue.Id;
        }

        System.debug(City);
    }
}
