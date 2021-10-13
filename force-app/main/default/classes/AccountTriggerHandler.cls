public class AccountTriggerHandler {
	public static void CreateHandler() {
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                AccountTriggerHelper.BillingValidate(Trigger.New);
            } 
        }
        
    }
    
    public static void appendContact(){
        if(Trigger.isAfter){
            if(Trigger.isInsert){
                AccountTriggerHelper.appendContact(Trigger.New);
            } 
        }
    }
}