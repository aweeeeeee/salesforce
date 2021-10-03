public class CityCensusTriggerHandler {
    public static void createHandler() {
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                CityCensusTriggerHelper.insertCensus(Trigger.New);
            } 
            if(Trigger.isUpdate) {
                CityCensusTriggerHelper.updateCensus(Trigger.New, Trigger.old);
            }
        }
        
    }
}
