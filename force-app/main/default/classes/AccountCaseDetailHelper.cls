public class AccountCaseDetailHelper {
	public static void ClientTypeValidate(List<Account> clientVal) {
        for(Account acct : clientVal){
            if(acct.Client_Type__c == 'Gold') {
                acct.Client_Type__c.addError('Gold Client Have Only 3 Active Cases');
            }
        }
    }
}