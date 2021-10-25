public class CityCensusTriggerHandler {
    public static void createHandler() {
        if(Trigger.isBefore){
            
            if(Trigger.isInsert){
                CityCensusTriggerHelper.initCensus(Trigger.New);
                CityCensusTriggerHelper.insertCensus(Trigger.New);
            } 
          
        }
        if(Trigger.isAfter){
            if(Trigger.isInsert || Trigger.isUpdate){
                CityCensusTriggerHelper.retrieveRecord(Trigger.New);
            }
        }
    }
}