public class CityCensusTriggerHandler {
    public static void createHandler() {
        if(Trigger.isBefore){
            CityCensusTriggerHelper.initCensus(Trigger.New);
            if(Trigger.isInsert){
                CityCensusTriggerHelper.insertCensus(Trigger.New);
            } 
            if(Trigger.isUpdate) {
                CityCensusTriggerHelper.updateCensus(Trigger.New);
            }
        }
        if(Trigger.isAfter){
            if(Trigger.isInsert || Trigger.isUpdate){
                CityCensusTriggerHelper.retrieveRecord(Trigger.New);
            }
        }
    }
}