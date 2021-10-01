public class CityCensusTriggerHandler {
    public static void createHandler() {
        if(Trigger.isBefore){
            if(Trigger.isInsert){

                CityCensusTriggerHelper.insertCensus(Trigger.New);

            }
        }
    }
}
