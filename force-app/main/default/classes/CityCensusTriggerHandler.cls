public class CityCensusTriggerHandler {
    public static void createHandler() {
        if(Trigger.isBefore){
            if(Trigger.isInsert || Trigger.isUpdate){
                CityCensusTriggerHelper.insertCensus(Trigger.New);
                CityCensusTriggerHelper.initCensus(Trigger.New);
            } 
            if(Trigger.isUpdate) {
                CityCensusTriggerHelper.updateCensus(Trigger.New, Trigger.old);
            }
        }
    }
}
