public class CityCensusTriggerHandler {
    public static void createHandler() {
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                CityCensusTriggerHelper.insertCensus(Trigger.New);
                CityCensusTriggerHelper.initCensus(Trigger.New);
                CityCensusTriggerHelper.checkCensusName(Trigger.New);
            } 
            if(Trigger.isUpdate) {
                CityCensusTriggerHelper.updateCensus(Trigger.New, Trigger.old);
                CityCensusTriggerHelper.initCensus(Trigger.New);

            }
        }
        if(Trigger.isAfter){
            if(Trigger.isInsert){
                //CityCensusTriggerHandler.retrieveRecord(Trigger.New);
            }
               
        }
    }
}
