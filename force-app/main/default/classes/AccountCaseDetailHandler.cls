public class AccountCaseDetailHandler {
	public static void CreateHandler() {
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                AccountCaseDetailHelper.ClientTypeValidate(Trigger.New);
            } 
        }
        
    }
}