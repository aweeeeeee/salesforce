public class AccountTriggerHandler {
	public static void CreateHandler() {
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                AccountTriggerHelper.BillingValidate(Trigger.New);
            } 
        }
        
    }
}