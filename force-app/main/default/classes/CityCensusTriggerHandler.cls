public class CityCensusTriggerHandler {
    public static void createHandler() {
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                CityCensusTriggerHelper.insertCensus(Trigger.New);
                CityCensusTriggerHelper.initCensus(Trigger.New);
            } 
            if(Trigger.isUpdate) {
                CityCensusTriggerHelper.initCensus(Trigger.New);
                CityCensusTriggerHelper.updateCensus(Trigger.New, Trigger.old);
            }
        }
    }
}
